using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System.Net.Mail;
using System.Net;
using iSmart.Entity.DTOs;
using iSmart.Service;
using iSmart.Entity.DTOs.UserDTO;


namespace iSmart.API.Controllers
{
    [Route("api/user")]
    [ApiController]
    //[Authorize]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;

        public UserController(IUserService userService)
        {
            _userService = userService;
        }

        //[AllowAnonymous]
        [HttpGet("get-all-user")]
        public IActionResult GetAllUser()
        {
            var result = _userService.GetAllUser();
            return Ok(result);
        }

        [HttpGet("get-users")]
        public IActionResult GetUserByKeyword(int pageNum, int? role, int? statusId, string? keyword = "") 
        {
            var reult = _userService.GetUsersByKeyword(pageNum,role,statusId, keyword);
            return Ok(reult);
        }

        // GET api/<UserController>/5
        [HttpGet("get-user-by-id")]
        public IActionResult GetUserById(int id)
        {
            var result  = _userService.GetUserById(id);
            if(result == null)
            {
                return NotFound("Khong co ket qua");

            }
            else
                    return Ok(result);
        }

        // POST api/<UserController>
        [HttpPost("add-user")]
        public IActionResult AddUser(CreateUserRequest user )
        {
            var username = user.UserName;
            var password = user.Password;
            MailMessage mm = new MailMessage("wmsystemsp24@gmail.com", user.Email);
            mm.Subject = "Chào mừng đến với hệ thống WMS";
            mm.Body = "Tài khoản đằng nhập của bạn" + "<br>" +
                "Tài khoản của bạn: " + username + "<br>" +
                "Mật khẩu của bạn: " + password + "<br>" +
                "Làm ơn không đưa người khác email này";
            mm.IsBodyHtml = true;
            SmtpClient smtp = new SmtpClient();
            smtp.Host = "smtp.gmail.com";
            smtp.EnableSsl = true;
            NetworkCredential NetworkCred = new NetworkCredential();
            NetworkCred.UserName = "wmsystemsp24@gmail.com";
            NetworkCred.Password = "jxpd wccm kits gona";
            smtp.UseDefaultCredentials = false;
            smtp.Credentials = NetworkCred;
            smtp.EnableSsl = true;
            smtp.Port = 587;
            smtp.Send(mm);
            var result = _userService.AddUser(user);
            return Ok(result);
        }

        // PUT api/<UserController>/5
        [HttpPut("update-user")]
        public IActionResult UpdateUser(UpdateUserDTO user)
        {
            var result = _userService.UpdateUser(user);
            return Ok(result);
        }

        
        [HttpPut("update-user-status")]
        public async Task<IActionResult> UpdateStatus(int id)
        {
            var user = _userService.UpdateDeleteStatusUser(id);
            return Ok(user);
        }
    }
}
