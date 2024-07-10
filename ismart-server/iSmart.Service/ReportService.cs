using iSmart.Entity.DTOs.ReportDTO;
using iSmart.Entity.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Service
{
    public interface IReportService
    {
        Task<IEnumerable<ImportReportDto>> GetImportReport(DateTime startDate, DateTime endDate, int warehouseId);
        Task<IEnumerable<ExportReportDto>> GetExportReport(DateTime startDate, DateTime endDate, int warehouseId);
        Task<IEnumerable<InventoryReportDto>> GetInventoryReport(DateTime startDate, DateTime endDate, int warehouseId);
    }
    public class ReportService : IReportService
    {
        private readonly iSmartContext _context;

        public ReportService(iSmartContext context)
        {
            _context = context;
        }

        public async Task<IEnumerable<ExportReportDto>> GetExportReport(DateTime startDate, DateTime endDate, int warehouseId)
        {
            try
            {

                var exportReports = await _context.ExportOrders
                    .Where(e => e.ExportedDate >= startDate && e.ExportedDate <= endDate && e.WarehouseId == warehouseId && e.StatusId == 4)
                    .Include(e => e.Warehouse)
                    .Include(e => e.ExportOrderDetails)
                    .ThenInclude(eod => eod.Goods)
                    .SelectMany(e => e.ExportOrderDetails.Select(eod => new ExportReportDto
                    {
                        TransactionCode = eod.Export.ExportCode,
                        ProductId = (int)eod.GoodsId,
                        ProductName = eod.Goods.GoodsCode,
                        Quantity = (int)eod.Quantity,
                        MeasureUnit = eod.Goods.MeasuredUnit,
                        TransactionDate = (DateTime)e.ExportedDate
                    }))
                    .ToListAsync();

                return exportReports;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public async Task<IEnumerable<ImportReportDto>> GetImportReport(DateTime startDate, DateTime endDate, int warehouseId)
        {
            var importReports = await _context.ImportOrders
                .Where(io => io.ImportedDate >= startDate && io.ImportedDate <= endDate && io.WarehouseId == warehouseId && io.StatusId == 4)
                .Include(io => io.Warehouse)
                .Include(io => io.ImportOrderDetails)
                .ThenInclude(iod => iod.Goods)
                .Select(io => new ImportReportDto
                {
                    TransactionCode = io.ImportCode,
                    ProductId = io.ImportOrderDetails.Select(iod => iod.GoodsId).FirstOrDefault(),
                    ProductName = io.ImportOrderDetails.Select(iod => iod.Goods.GoodsCode).FirstOrDefault(),
                    Quantity = io.ImportOrderDetails.Sum(iod => iod.Quantity),
                    TransactionDate = (DateTime)io.ImportedDate,
                    MeasureUnit = io.ImportOrderDetails.Select(iod => iod.Goods.MeasuredUnit).FirstOrDefault()
                })
                .ToListAsync();

            return importReports;
        }

        public async Task<IEnumerable<InventoryReportDto>> GetInventoryReport(DateTime startDate, DateTime endDate, int warehouseId)
        {
            try
            {
                // Tính tồn đầu kỳ (trước ngày bắt đầu của khoảng thời gian báo cáo)
                var initialBalances = await _context.ImportOrderDetails
                    .Where(iod => iod.Import.ImportedDate < startDate && iod.Import.WarehouseId == warehouseId)
                    .GroupBy(iod => new { iod.GoodsId, iod.Goods.GoodsCode, iod.Goods.MeasuredUnit })
                    .Select(g => new
                    {
                        ProductId = g.Key.GoodsId,
                        ProductName = g.Key.GoodsCode,
                        MeasureUnit = g.Key.MeasuredUnit,
                        InitialBalance = g.Sum(iod => iod.Quantity) -
                                         _context.ExportOrderDetails
                                         .Where(eod => eod.Export.ExportedDate < startDate && eod.Export.WarehouseId == warehouseId && eod.GoodsId == g.Key.GoodsId)
                                         .Sum(eod => (int?)eod.Quantity) ?? 0
                    })
                    .ToListAsync();

                var importReports = await _context.ImportOrders
                    .Where(io => io.ImportedDate >= startDate && io.ImportedDate <= endDate && io.WarehouseId == warehouseId && io.StatusId == 4)
                    .Include(io => io.ImportOrderDetails)
                    .ThenInclude(iod => iod.Goods)
                    .SelectMany(io => io.ImportOrderDetails.Select(iod => new InventoryReportDto
                    {
                        TransactionCode = iod.Import.ImportCode,
                        ProductId = iod.GoodsId,
                        ProductName = iod.Goods.GoodsCode,
                        Imports = iod.Quantity,
                        Exports = 0,
                        MeasureUnit = iod.Goods.MeasuredUnit
                    }))
                    .ToListAsync();

                var exportReports = await _context.ExportOrders
                    .Where(eo => eo.ExportedDate >= startDate && eo.ExportedDate <= endDate && eo.WarehouseId == warehouseId)
                    .Include(eo => eo.ExportOrderDetails)
                    .ThenInclude(eod => eod.Goods)
                    .SelectMany(eo => eo.ExportOrderDetails.Select(eod => new InventoryReportDto
                    {
                        TransactionCode = eod.Export.ExportCode,
                        ProductId = (int)eod.GoodsId,
                        ProductName = eod.Goods.GoodsCode,
                        Imports = 0,
                        Exports = (int)eod.Quantity,
                        MeasureUnit = eod.Goods.MeasuredUnit,
                    }))
                    .ToListAsync();

                var inventoryReports = importReports
                   .Concat(exportReports)
                   .GroupBy(ir => new { ir.ProductId, ir.ProductName, ir.MeasureUnit })
                   .Select(g => new InventoryReportDto
                   {
                       ProductId = g.Key.ProductId,
                       ProductName = g.Key.ProductName,
                       MeasureUnit = g.Key.MeasureUnit,
                       Imports = g.Sum(x => x.Imports),
                       Exports = g.Sum(x => x.Exports),
                       Balance = g.Sum(x => x.Imports) - g.Sum(x => x.Exports)
                   })
                   .ToList();
                // Kết hợp tồn đầu kỳ và tồn trong kỳ để tính tồn cuối kỳ
                var finalReports = inventoryReports
                    .GroupJoin(initialBalances,
                        ir => new { ir.ProductId, ir.ProductName, ir.MeasureUnit },
                        ib => new { ib.ProductId, ib.ProductName, ib.MeasureUnit },
                        (ir, ib) => new { InventoryReport = ir, InitialBalance = ib.FirstOrDefault() })
                    .Select(result => new InventoryReportDto
                    {
                        ProductId = result.InventoryReport.ProductId,
                        ProductName = result.InventoryReport.ProductName,
                        MeasureUnit = result.InventoryReport.MeasureUnit,
                        InitialBalance = result.InitialBalance?.InitialBalance ?? 0,
                        Imports = result.InventoryReport.Imports,
                        Exports = result.InventoryReport.Exports,
                        Balance = (result.InitialBalance?.InitialBalance ?? 0) + result.InventoryReport.Imports - result.InventoryReport.Exports,
                        TransactionDate = result.InventoryReport.TransactionDate
                    })
                    .ToList();

                return finalReports;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
