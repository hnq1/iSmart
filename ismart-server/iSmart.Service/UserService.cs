using iSmart.Entity.Models;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Shared.Helpers;


namespace iSmart.Service
{
    public interface IUserService
    {
        UserFilterPagingResponse GetUsersByKeyword(int pageNum, int? role, int? warehouseId, int? statusId,string? keyword = "");
        List<UserDTO>? GetAllUser();
        UserDTO? GetUserById(int id);
        CreateUserResponse AddUser(CreateUserRequest user);
        UpdateUserResponse UpdateUser(UpdateUserDTO user);
        bool UpdateDeleteStatusUser(int id);

        List<Role> GetAllRole();
    }
    public class UserService : IUserService
    {
        private readonly iSmartContext _context;
        public IConfiguration _configuration;


        public UserService(iSmartContext context, IConfiguration configuration)
        {
            _context = context;
            _configuration = configuration;
        }
        List<UserDTO> userDTOs = new List<UserDTO>();
        public CreateUserResponse AddUser(CreateUserRequest user)
        {
            try
            {
                var password = string.Empty;
                if (user.Password is not null)
                {
                    password = HashHelper.Encrypt(user.Password, _configuration);
                }

                var requestUser = new User
                {
                    UserName = user.UserName,
                    UserCode = user.UserCode,
                    FullName = user.FullName,
                    Email = user.Email,
                    Address = user.Address,
                    Phone = user.Phone,
                    RoleId = user.RoleId,
                    Password = password,
                    StatusId = user.StatusId,
                    Image = user.Image,
                    //Status = _context.Statuses.FirstOrDefault(s => s.StatusId == user.StatusId)
                };

                if (_context.Users.Any(u => u.UserName.ToLower() == user.UserName.ToLower()) || _context.Users.Any(u => u.UserCode.ToLower() == user.UserCode.ToLower()))
                {
                    return new CreateUserResponse { IsSuccess = false, Message = "User existed" };
                }

                _context.Users.Add(requestUser);
                _context.SaveChanges();
                return new CreateUserResponse { IsSuccess = true, Message = "Add user complete" };
            }
            catch (Exception e)
            {
                return new CreateUserResponse { IsSuccess = false, Message = $"Add user failed {e.Message}" };
            }
        }

        public List<UserDTO>? GetAllUser()
        {
            try
            {
                var users = _context.Users
                    .Include(u => u.Role)
                    .Include(u => u.Status)
                    .Include(u => u.UserWarehouses) 
                    .Select(u => new UserDTO
                    {
                        UserId = u.UserId,
                        UserCode = u.UserCode,
                        UserName = u.UserName,
                        FullName = u.FullName,
                        Email = u.Email,
                        Address = u.Address,
                        Phone = u.Phone,
                        RoleId = u.RoleId,
                        RoleName = u.Role.RoleName,
                        StatusId = u.StatusId,
                        StatusName = u.Status.StatusType,
                        Image = u.Image,
                        //WarehouseNames = u.UserWarehouses.Select(uw => uw.Warehouse.WarehouseName).ToList()
                    })
                    .ToList();

                return users;
            }
            catch (Exception ex)
            {
                throw new Exception("Error occurred while getting all users.", ex);
            }
        }


        public UserDTO? GetUserById(int id)
        {
            try
            {
                var user = _context.Users
                    .Include(u => u.Role)
                    .Include(u => u.Status)
                    .FirstOrDefault(a => a.UserId == id);

                if (user != null)
                {
                    var u = new UserDTO
                    {
                        UserId = user.UserId,
                        UserName = user.UserName,
                        UserCode = user.UserCode,
                        FullName = user.FullName,
                        Email = user.Email,
                        Address = user.Address,
                        Phone = user.Phone,
                        RoleId = user.RoleId,
                        RoleName = user.Role.RoleName,
                        StatusId = user.StatusId,
                        StatusName = user.Status.StatusType,
                        Image = user.Image,
                        //WarehouseNames = user.UserWarehouses.Select(uw => uw.Warehouse.WarehouseName).ToList()
                    };

                    return u;
                }
                else
                {
                    return null;
                }
            }
            catch (Exception e)
            {
                throw new Exception("Error occurred while getting user by ID.", e);
            }
        }

        public UserFilterPagingResponse GetUsersByKeyword(int pageNum, int? role, int? warehouseId, int? statusId, string? keyword = "")
        {
            try
            {
                var pageSize = 6;
                if (pageNum <= 0) pageNum = 1;

                var query = _context.Users
                    .Include(u => u.Status)
                    .Include(u => u.Role)
                    .Include(u => u.UserWarehouses) 
                    .ThenInclude(uw => uw.Warehouse) 
                    .Where(u =>
                        (string.IsNullOrEmpty(keyword) || u.UserCode.ToLower().Contains(keyword.ToLower())
                                                      || u.UserName.ToLower().Contains(keyword.ToLower())
                                                      || u.Email.ToLower().Contains(keyword.ToLower())
                                                      || u.UserWarehouses.Any(uw => uw.Warehouse.WarehouseName.ToLower().Contains(keyword.ToLower())))
                        && (!role.HasValue || u.RoleId == role)
                        && (!statusId.HasValue || u.StatusId == statusId)
                        && (!warehouseId.HasValue || u.UserWarehouses.Any(uw => uw.WarehouseId == warehouseId))
                    )
                    .OrderBy(u => u.UserId);

                var count = query.Count();
                var users = query.Skip((pageNum - 1) * pageSize).Take(pageSize)
                    .Select(u => new UserDTO
                    {
                        UserId = u.UserId,
                        UserCode = u.UserCode,
                        UserName = u.UserName,
                        FullName = u.FullName,
                        Email = u.Email,
                        Address = u.Address,
                        Phone = u.Phone,
                        RoleId = u.RoleId,
                        RoleName = u.Role.RoleName,
                        StatusId = u.StatusId,
                        StatusName = u.Status.StatusType,
                        Image = u.Image,
                    })
                    .ToList();

                var totalPages = (int)Math.Ceiling((double)count / pageSize);

                return new UserFilterPagingResponse
                {
                    PageSize = pageSize,
                    TotalPages = totalPages,
                    Data = users
                };
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }



        public bool UpdateDeleteStatusUser(int id)
        {
            try
            {
                var user = _context.Users.FirstOrDefault(a => a.UserId == id);
                if (user == null)
                {
                    return false;
                }
                else if (user.StatusId == 1)
                {
                    user.StatusId = 2;
                }
                else user.StatusId = 1;
                _context.Update(user);
                _context.SaveChanges();
                return true;
            }
            catch (Exception)
            {
                return false;
            }
        }

        public UpdateUserResponse UpdateUser(UpdateUserDTO user)
        {
            try
            {
                // Kiểm tra xem người dùng có tồn tại không
                var existingUser = _context.Users.FirstOrDefault(u => u.UserId == user.UserId);
                if (existingUser == null)
                {
                    return new UpdateUserResponse { IsSuccess = false, Message = "User not found." };
                }

                existingUser.UserCode = user.UserCode;
                existingUser.UserName = user.UserName;
                existingUser.FullName = user.FullName;
                existingUser.Email = user.Email;
                existingUser.Address = user.Address;
                existingUser.Phone = user.Phone;
                existingUser.RoleId = user.RoleId;
                existingUser.StatusId = user.StatusId;
                existingUser.Image = user.Image;

                _context.SaveChanges();

                return new UpdateUserResponse { IsSuccess = true, Message = "Update account complete." };
            }
            catch (Exception e)
            {
                return new UpdateUserResponse { IsSuccess = false, Message = "Update account failed. " + e.Message };
            }
        }

        public List<Role> GetAllRole()
        {
            var roles = _context.Roles.ToList();
            return roles;
        }
    }
}
