using iSmart.Entity.DTOs.InventoryCheckDTO;
using iSmart.Entity.DTOs.ReturnOrderDTO;
using iSmart.Entity.Models;
using iSmart.Service;
using iText.IO.Font;
using iText.IO.Font.Constants;
using iText.Kernel.Font;
using iText.Kernel.Pdf;
using iText.Layout;
using iText.Layout.Element;
using iText.Layout.Properties;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore.Metadata.Internal;

namespace iSmart.API.Controllers
{
    [Route("api/inventory-check")]
    [ApiController]
    public class InventoryCheckController : ControllerBase
    {
        private readonly IInventoryCheckService _inventoryCheckService;
        private readonly iSmartContext _context;

        public InventoryCheckController(IInventoryCheckService inventoryCheckService, iSmartContext context)
        {
            _inventoryCheckService = inventoryCheckService;
            _context = context;
        }

        [HttpPost("create-return-order")]
        public ActionResult<InventoryCheck> CreateInventoryCheckAsync(CreateInventoryCheckDTO inventoryCheck)
        {
            var result = _inventoryCheckService.CreateInventoryCheck(inventoryCheck);
            return Ok(result);

        }

        [HttpGet("get-all-inventory-checks")]
        public async Task<ActionResult<List<CreateInventoryCheckDTO>>> GetAllInventoryChecksAsync(int? warehouseId)
        {
            try
            {
                var inventoryChecks = await _inventoryCheckService.GetAllInventoryChecksAsync(warehouseId);
                return Ok(inventoryChecks);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Message = $"Internal server error: {ex.Message}" });
            }
        }

        [HttpGet("get-inventory-check/{id}")]
        public async Task<ActionResult<ResponseInventoryCheckDTO>> GetInventoryCheckByIdAsync(int id)
        {
            try
            {
                var inventoryCheck = await _inventoryCheckService.GetInventoryCheckByIdAsync(id);
                if (inventoryCheck == null)
                {
                    return NotFound(new { Message = $"Inventory Check with ID {id} not found." });
                }
                return Ok(inventoryCheck);
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Message = $"Internal server error: {ex.Message}" });
            }
        }

        [HttpPost("cancel-inventory-check")]
        public async Task<IActionResult> CancelInventoryCheck(int id)
        {
            var result = _context.InventoryChecks.FirstOrDefault(i => i.Id == id);
            if (result != null && result.StatusId == 3)
            {
                result.StatusId = 5;
                result.CheckDate = DateTime.Now;
                _context.InventoryChecks.Update(result);
                await _context.SaveChangesAsync();
                return Ok("thành công");
            }
            else return BadRequest("Không tồn tại");

        }
    

        [HttpPost("update-batch-quantities")]
        public async Task<ActionResult> UpdateBatchQuantitiesAsync([FromBody] Dictionary<string, int> batchQuantities)
        {
            try
            {
                await _inventoryCheckService.UpdateBatchQuantitiesAsync(batchQuantities);
                return Ok(new { Message = "Batch quantities updated successfully." });
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Message = $"Internal server error: {ex.Message}" });
            }
        }

        [HttpGet("export-inventory-check/{id}")]
        public async Task<IActionResult> ExportInventoryCheckToPdf(int id)
        {
            try
            {
                var inventoryCheck = await _inventoryCheckService.GetInventoryCheckByIdAsync(id);

                if (inventoryCheck == null)
                {
                    return NotFound($"Phiếu kiểm kê với ID {id} không tồn tại.");
                }

                using (var stream = new MemoryStream())
                {
                    // Create PdfWriter with the MemoryStream
                    using (var writer = new PdfWriter(stream))
                    {
                        using (var pdf = new PdfDocument(writer))
                        {
                            var document = new Document(pdf);

                            // Load and set font
                            var fontPath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot/fonts/arial.ttf");
                            var font = PdfFontFactory.CreateFont(fontPath, PdfEncodings.IDENTITY_H);

                            document.SetFont(font);

                            // Title
                            document.Add(new Paragraph("Báo Cáo Kiểm Kê Kho")
                                .SetFontSize(18)
                                .SetBold()
                                .SetTextAlignment(iText.Layout.Properties.TextAlignment.CENTER));

                            // Warehouse Info
                            document.Add(new Paragraph($"Tên Kho: {inventoryCheck.WarehouseName}"));
                            document.Add(new Paragraph($"Địa Chỉ Kho: {inventoryCheck.WarehouseAddress}"));
                            document.Add(new Paragraph($"Tên Kế Toán: {inventoryCheck.AccountantName}"));
                            document.Add(new Paragraph($"Tên Quản Lý Kho: {inventoryCheck.WarehouseManagerName}"));
                            document.Add(new Paragraph($"Ngày Kiểm Kê: {inventoryCheck.CheckDate:dd/MM/yyyy}"));

                            document.Add(new Paragraph("\n"));

                            // Table Header
                            var table = new iText.Layout.Element.Table(UnitValue.CreatePercentArray(new float[] { 3, 4, 3, 3, 3, 2, 4 }))
                                .SetWidth(UnitValue.CreatePercentValue(100));

                            table.AddHeaderCell("Mã Hàng");
                            table.AddHeaderCell("Tên Hàng");
                            table.AddHeaderCell("Số Lượng Thực Tế");
                            table.AddHeaderCell("Số Lượng Trong App");
                            table.AddHeaderCell("Chênh Lệch");
                            table.AddHeaderCell("Đơn Vị Tính");
                            table.AddHeaderCell("Ghi Chú");

                            // Table Rows
                            foreach (var detail in inventoryCheck.Detail)
                            {
                                table.AddCell(detail.goodCode);
                                table.AddCell(detail.goodName);
                                table.AddCell(detail.ActualQuantity.ToString());
                                table.AddCell(detail.InAppQuantity.ToString());
                                table.AddCell(detail.Difference.ToString());
                                table.AddCell(detail.MeasureUnit);
                                table.AddCell(detail.Note);
                            }

                            document.Add(table);

                            document.Close();
                        }
                    }

                    // Return the file as a response
                    return File(stream.ToArray(), "application/pdf", $"BaoCaoKiemKeKho_{id}.pdf");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, new { Message = $"Lỗi máy chủ: {ex.Message}" });
            }
        }

    }

}
