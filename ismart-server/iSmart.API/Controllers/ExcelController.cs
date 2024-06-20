using iSmart.Entity.DTOs.GoodsDTO;
using iSmart.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OfficeOpenXml;
using System;
using System.IO;
using System.Linq;
using System.Threading.Tasks;

namespace iSmart.API.Controllers
{
    [Route("api/excel")]
    [ApiController]
    public class ExcelController : ControllerBase
    {
        private static readonly string[] PermittedExtensions = { ".xlsx", ".xls" };
        private static readonly string[] ExcelMimeTypes = { "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "application/vnd.ms-excel" };
        private readonly string _uploadsFolderPath;
        private readonly IGoodsService _goodsService;
        public ExcelController(IWebHostEnvironment env, IGoodsService goodsService)
        {
            _uploadsFolderPath = Path.Combine(env.WebRootPath, "uploads");
            _goodsService = goodsService;
        }

        [HttpGet("download-template")]
        public IActionResult DownloadTemplate()
        {
            try
            {
                var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "templates", "templateAddGoods.xlsx");

                if (!System.IO.File.Exists(filePath))
                {
                    return NotFound("Mẫu file không tồn tại.");
                }

                var fileBytes = System.IO.File.ReadAllBytes(filePath);
                return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "template.xlsx");
            }
            catch
            {
                return StatusCode(500, "Đã xảy ra lỗi khi tải xuống mẫu file.");
            }
        }

        [HttpPost("upload-excel")]
        public async Task<IActionResult> UploadExcel(IFormFile file)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("File không hợp lệ.");
            }

            var extension = Path.GetExtension(file.FileName).ToLowerInvariant();
            if (string.IsNullOrEmpty(extension) || !PermittedExtensions.Contains(extension))
            {
                return BadRequest("Chỉ chấp nhận file Excel.");
            }

            if (!ExcelMimeTypes.Contains(file.ContentType))
            {
                return BadRequest("Định dạng file không hợp lệ.");
            }

            if (!Directory.Exists(_uploadsFolderPath))
            {
                Directory.CreateDirectory(_uploadsFolderPath);
            }

            var safeFileName = $"{Path.GetFileNameWithoutExtension(file.FileName)}_{Guid.NewGuid()}{extension}";
            var filePath = Path.Combine(_uploadsFolderPath, safeFileName);

            try
            {
                using (var stream = new FileStream(filePath, FileMode.Create))
                {
                    await file.CopyToAsync(stream);
                }

                var fileUrl = $"{Request.Scheme}://{Request.Host}/uploads/{safeFileName}";
                return Ok(new { filePath = fileUrl });
            }
            catch
            {
                return StatusCode(500, "Đã xảy ra lỗi khi tải lên file.");
            }
        }

        [HttpPost("import-from-excel")]
        public async Task<IActionResult> ImportFromExcel(IFormFile file, int userId)
        {
            if (file == null || file.Length == 0)
            {
                return BadRequest("File không hợp lệ.");
            }

            try
            {
                var goodsList = new List<CreateGoodsRequest>();

                using (var stream = new MemoryStream())
                {
                    await file.CopyToAsync(stream);
                    using (var package = new ExcelPackage(stream))
                    {
                        ExcelWorksheet worksheet = package.Workbook.Worksheets[0];
                        int rowCount = worksheet.Dimension.Rows;

                        for (int row = 2; row <= rowCount; row++)
                        {
                            var goods = new CreateGoodsRequest
                            {
                                GoodsName = worksheet.Cells[row, 1].Value?.ToString().Trim(),
                                GoodsCode = worksheet.Cells[row, 2].Value?.ToString().Trim(),
                                CategoryId = int.Parse(worksheet.Cells[row, 3].Value?.ToString().Trim()),
                                Description = worksheet.Cells[row, 4].Value?.ToString().Trim(),
                                SupplierId = int.Parse(worksheet.Cells[row, 5].Value?.ToString().Trim()),
                                MeasuredUnit = worksheet.Cells[row, 6].Value?.ToString().Trim(),
                                Image = worksheet.Cells[row, 7].Value?.ToString().Trim(),
                                StatusId = int.Parse(worksheet.Cells[row, 8].Value?.ToString().Trim()),
                                StockPrice = (float)decimal.Parse(worksheet.Cells[row, 9].Value?.ToString().Trim()),
                                WarrantyTime = int.Parse(worksheet.Cells[row, 10].Value?.ToString().Trim()),
                                Barcode = worksheet.Cells[row, 11].Value?.ToString().Trim(),
                                MaxStock = int.Parse(worksheet.Cells[row, 12].Value?.ToString().Trim()),
                                MinStock = int.Parse(worksheet.Cells[row, 13].Value?.ToString().Trim())
                            };

                            goodsList.Add(goods);
                        }
                    }
                }

                var responseList = new List<CreateGoodsResponse>();

                foreach (var goods in goodsList)
                {
                    var response = _goodsService.AddGoods(goods, userId);
                    responseList.Add(response);
                }

                // Kiểm tra và phản hồi kết quả
                if (responseList.All(r => r.IsSuccess))
                {
                    return Ok("Dữ liệu đã được nhập thành công từ file Excel.");
                }
                else
                {
                    var errorMessages = string.Join("; ", responseList.Where(r => !r.IsSuccess).Select(r => r.Message));
                    return StatusCode(500, $"Một số hàng hóa không thể thêm: {errorMessages}");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Đã xảy ra lỗi: {ex.Message}");
            }
        }


    }
}
