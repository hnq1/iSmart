using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
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

        public ExcelController(IWebHostEnvironment env)
        {
            _uploadsFolderPath = Path.Combine(env.WebRootPath, "uploads");
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
    }
}
