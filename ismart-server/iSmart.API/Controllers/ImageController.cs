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

<<<<<<< HEAD
        var filePath = Path.Combine(uploads, fileUpload.FileName);
=======
        var uniqueFileName = $"{Path.GetFileNameWithoutExtension(file.FileName)}_{Guid.NewGuid()}{Path.GetExtension(file.FileName)}";
        var filePath = Path.Combine(uploads, uniqueFileName);

        if (System.IO.File.Exists(filePath))
        {
            return Conflict("A file with the same name already exists.");
        }

>>>>>>> origin/anhddhe170353
        using (var fileStream = new FileStream(filePath, FileMode.Create))
        {
            await fileUpload.CopyToAsync(fileStream);
        }

<<<<<<< HEAD
        var imageUrl = $"{Request.Scheme}://{Request.Host}/uploads/{fileUpload.FileName}";
=======
        var imageUrl = $"{Request.Scheme}://{Request.Host}/uploads/{uniqueFileName}";
>>>>>>> origin/anhddhe170353
        return Ok(new { url = imageUrl });
    }
}
