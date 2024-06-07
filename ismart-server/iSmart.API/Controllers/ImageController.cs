using Microsoft.AspNetCore.Mvc;

[ApiController]
[Route("api/images")]
public class ImagesController : ControllerBase
{
    private readonly IWebHostEnvironment _env;

    public ImagesController(IWebHostEnvironment env)
    {
        _env = env ?? throw new ArgumentNullException(nameof(env));
    }

    [HttpPost("upload")]
    public async Task<IActionResult> UploadImage(IFormFile fileUpload)
    {
        if (fileUpload == null || fileUpload.Length == 0)
        {
            return BadRequest("No file uploaded.");
        }

        if (string.IsNullOrEmpty(_env.WebRootPath))
        {
            return StatusCode(500, "WebRootPath is not configured.");
        }

        var uploads = Path.Combine(_env.WebRootPath, "uploads");
        if (!Directory.Exists(uploads))
        {
            Directory.CreateDirectory(uploads);
        }

        var filePath = Path.Combine(uploads, fileUpload.FileName);
        using (var fileStream = new FileStream(filePath, FileMode.Create))
        {
            await fileUpload.CopyToAsync(fileStream);
        }

        var imageUrl = $"{Request.Scheme}://{Request.Host}/uploads/{fileUpload.FileName}";
        return Ok(new { url = imageUrl });
    }
}
