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
        UserFilterPagingResponse GetUsersByKeyword(int pageNum, int? role, int? statusId, IEnumerable<int> warehouseIds, string? keyword = "");
        List<UserDTO>? GetAllUser();
        UserDTO? GetUserById(int id);
        User? GetUserByEmailAndPassword(string email, string password);
        User? GetUserByEmail(string email);
        CreateUserResponse AddUser(CreateUserRequest user);
        UpdateUserResponse UpdateUser(UpdateUserRequest user);
        bool UpdateDeleteStatusUser(int id);
        UserFilterPagingResponse GetUsersByRoleId(int pageNum, int? roleId);
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


        public User? GetUserByEmail(string email)
        {
            throw new NotImplementedException();
        }

        public User? GetUserByEmailAndPassword(string email, string password)
        {
            throw new NotImplementedException();
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

        public UserFilterPagingResponse GetUsersByKeyword(int pageNum, int? role, int? statusId, IEnumerable<int> warehouseIds, string? keyword = "")
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
                                                      || u.Email.ToLower().Contains(keyword.ToLower()))
                        && (!role.HasValue || u.RoleId == role)
                        && (!statusId.HasValue || u.StatusId == statusId)
                        && (warehouseIds == null || warehouseIds.Any(id => u.UserWarehouses.Any(uw => uw.WarehouseId == id)))
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
                        //WarehouseNames = u.UserWarehouses.Select(uw => uw.Warehouse.WarehouseName).ToList() // Lấy tên kho từ UserWarehouses
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


        public UserFilterPagingResponse GetUsersByRoleId(int pageNum, int? roleId)
        {
            throw new NotImplementedException();
        }

        public bool UpdateDeleteStatusUser(int id)
        {
            throw new NotImplementedException();
        }

        public UpdateUserResponse UpdateUser(UpdateUserRequest user)
        {
            throw new NotImplementedException();
        }
    }
}
