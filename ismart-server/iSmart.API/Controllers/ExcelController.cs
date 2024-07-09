using iSmart.Entity.DTOs.GoodsDTO;
using iSmart.Entity.Models;
using iSmart.Service;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Logging;
using OfficeOpenXml;
using OfficeOpenXml.DataValidation;
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
        private readonly iSmartContext _context;
        public ExcelController(IWebHostEnvironment env, IGoodsService goodsService, iSmartContext context)
        {
            _uploadsFolderPath = Path.Combine(env.WebRootPath, "uploads");
            _goodsService = goodsService;
            _context = context;
        }

        //[HttpGet("download-template")]
        //public IActionResult DownloadTemplate()
        //{
        //    try
        //    {
        //        var filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "templates", "templateAddGoods.xlsx");

        //        if (!System.IO.File.Exists(filePath))
        //        {
        //            return NotFound("Mẫu file không tồn tại.");
        //        }
        //        var statusData = _context.Statuses.ToList();
        //        var categoryData = _context.Categories.ToList();
        //        var supplierData = _context.Suppliers.ToList();


        //        var fileBytes = System.IO.File.ReadAllBytes(filePath);
        //        return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "template.xlsx");
        //    }
        //    catch
        //    {
        //        return StatusCode(500, "Đã xảy ra lỗi khi tải xuống mẫu file.");
        //    }
        //}
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

                // Lấy danh sách từ cơ sở dữ liệu
                var categoryData = _context.Categories.Select(c => new { c.CategoryId, c.CategoryName }).ToList();
                var supplierData = _context.Suppliers.Select(s => new { s.SupplierId, s.SupplierName }).ToList();
                var statusData = _context.Statuses.Select(s => new { s.StatusId, s.StatusType }).ToList();

                using (var package = new ExcelPackage(new FileInfo(filePath)))
                {
                    var mainWorksheet = package.Workbook.Worksheets["GoodsTemplate"];

                    // Tạo sheet cho Category
                    var categoryWorksheet = package.Workbook.Worksheets.Add("Category");
                    categoryWorksheet.Cells[1, 1].Value = "CategoryId";
                    categoryWorksheet.Cells[1, 2].Value = "CategoryName";
                    for (int i = 0; i < categoryData.Count; i++)
                    {
                        categoryWorksheet.Cells[i + 2, 1].Value = categoryData[i].CategoryId;
                        categoryWorksheet.Cells[i + 2, 2].Value = categoryData[i].CategoryName;
                    }

                    // Tạo sheet cho Supplier
                    var supplierWorksheet = package.Workbook.Worksheets.Add("Supplier");
                    supplierWorksheet.Cells[1, 1].Value = "SupplierId";
                    supplierWorksheet.Cells[1, 2].Value = "SupplierName";
                    for (int i = 0; i < supplierData.Count; i++)
                    {
                        supplierWorksheet.Cells[i + 2, 1].Value = supplierData[i].SupplierId;
                        supplierWorksheet.Cells[i + 2, 2].Value = supplierData[i].SupplierName;
                    }

                    // Tạo sheet cho Status
                    var statusWorksheet = package.Workbook.Worksheets.Add("Status");
                    statusWorksheet.Cells[1, 1].Value = "StatusId";
                    statusWorksheet.Cells[1, 2].Value = "StatusType";
                    for (int i = 0; i < statusData.Count; i++)
                    {
                        statusWorksheet.Cells[i + 2, 1].Value = statusData[i].StatusId;
                        statusWorksheet.Cells[i + 2, 2].Value = statusData[i].StatusType;
                    }

                    var fileBytes = package.GetAsByteArray();
                    return File(fileBytes, "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet", "template.xlsx");
                }
            }
            catch (Exception ex)
            {
                return StatusCode(500, $"Đã xảy ra lỗi khi tải xuống mẫu file: {ex.Message}");
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
                        ExcelPackage.LicenseContext = LicenseContext.NonCommercial; // Thêm dòng này

                        // Lấy sheet "GoodsTemplate"
                        ExcelWorksheet worksheet = package.Workbook.Worksheets["GoodsTemplate"];
                        if (worksheet == null)
                        {
                            return BadRequest("Sheet 'GoodsTemplate' không tồn tại trong file.");
                        }

                        int rowCount = worksheet.Dimension?.Rows ?? 0;
                        if (rowCount == 0)
                        {
                            return BadRequest("Sheet 'GoodsTemplate' không có dữ liệu.");
                        }

                        for (int row = 2; row <= rowCount; row++)
                        {
                            var goods = new CreateGoodsRequest
                            {
                                GoodsName = worksheet.Cells[row, 2].Value?.ToString().Trim(),
                                GoodsCode = worksheet.Cells[row, 3].Value?.ToString().Trim(),
                                CategoryId = ParseInt(worksheet.Cells[row, 4].Value?.ToString().Trim()),
                                Description = worksheet.Cells[row, 5].Value?.ToString().Trim(),
                                SupplierId = ParseInt(worksheet.Cells[row, 6].Value?.ToString().Trim()),
                                MeasuredUnit = worksheet.Cells[row, 7].Value?.ToString().Trim(),
                                Image = worksheet.Cells[row, 8].Value?.ToString().Trim(),
                                StatusId = ParseInt(worksheet.Cells[row, 9].Value?.ToString().Trim()),
                                StockPrice = ParseFloat(worksheet.Cells[row, 10].Value?.ToString().Trim()),
                                Barcode = worksheet.Cells[row, 11].Value?.ToString().Trim(),
                                MaxStock = ParseInt(worksheet.Cells[row, 12].Value?.ToString().Trim()),
                                MinStock = ParseInt(worksheet.Cells[row, 13].Value?.ToString().Trim()),
                                CreatedDate = ParseDateTime(worksheet.Cells[row, 14].Value?.ToString().Trim()),
                                WarrantyTime = ParseInt(worksheet.Cells[row, 15].Value?.ToString().Trim())
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

        private int ParseInt(string value)
        {
            return int.TryParse(value, out int result) ? result : 0;
        }

        private float ParseFloat(string value)
        {
            return float.TryParse(value, out float result) ? result : 0;
        }

        private DateTime ParseDateTime(string value)
        {
            return DateTime.TryParse(value, out DateTime result) ? result : DateTime.MinValue;
        }



    }
}
