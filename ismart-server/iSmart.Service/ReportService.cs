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
                        ProductId = (int)eod.GoodsId,
                        ProductName = eod.Goods.GoodsCode,
                        Quantity = (int)eod.Quantity,
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
                    ProductId = io.ImportOrderDetails.Select(iod => iod.GoodsId).FirstOrDefault(),
                    ProductName = io.ImportOrderDetails.Select(iod => iod.Goods.GoodsCode).FirstOrDefault(),
                    Quantity = io.ImportOrderDetails.Sum(iod => iod.Quantity),
                    TransactionDate = (DateTime)io.ImportedDate,
                })
                .ToListAsync();

            return importReports;
        }

        public async Task<IEnumerable<InventoryReportDto>> GetInventoryReport(DateTime startDate, DateTime endDate, int warehouseId)
        {
            try
            {
                var importReports = await _context.ImportOrders
                    .Where(io => io.ImportedDate >= startDate && io.ImportedDate <= endDate && io.WarehouseId == warehouseId && io.StatusId == 4)
                    .Include(io => io.ImportOrderDetails)
                    .ThenInclude(iod => iod.Goods)
                    .SelectMany(io => io.ImportOrderDetails.Select(iod => new InventoryReportDto
                    {
                        ProductId = iod.GoodsId,
                        ProductName = iod.Goods.GoodsCode,
                        Imports = iod.Quantity,
                        Exports = 0,
                        Balance = iod.Quantity
                    }))
                    .ToListAsync();

                var exportReports = await _context.ExportOrders
                    .Where(eo => eo.ExportedDate >= startDate && eo.ExportedDate <= endDate && eo.WarehouseId == warehouseId)
                    .Include(eo => eo.ExportOrderDetails)
                    .ThenInclude(eod => eod.Goods)
                    .SelectMany(eo => eo.ExportOrderDetails.Select(eod => new InventoryReportDto
                    {
                        ProductId = (int)eod.GoodsId,
                        ProductName = eod.Goods.GoodsCode,
                        Imports = 0,
                        Exports = (int)eod.Quantity,
                        Balance = (int)-eod.Quantity
                    }))
                    .ToListAsync();

                var inventoryReports = importReports
                    .Concat(exportReports)
                    .GroupBy(ir => new { ir.ProductId, ir.ProductName })
                    .Select(g => new InventoryReportDto
                    {
                        ProductId = g.Key.ProductId,
                        ProductName = g.Key.ProductName,
                        Imports = g.Sum(x => x.Imports),
                        Exports = g.Sum(x => x.Exports),
                        Balance = g.Sum(x => x.Imports) - g.Sum(x => x.Exports)
                    })
                    .Where(ir => ir.Imports != 0 || ir.Exports != 0)
                    .ToList();

                return inventoryReports;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }
    }
}
