//using Microsoft.EntityFrameworkCore;

//using System;
//using System.Collections.Generic;
//using System.Data;
//using System.Linq;
//using System.Text;
//using System.Threading.Tasks;
//using iSmart.Entity.DTOs.ExportOrderDTO;
//using iSmart.Entity.DTOs.ImportOrderDTO;
//using iSmart.Entity.DTOs.UserDTO;
//using iSmart.Entity.Models;

//namespace iSmart.Service
//{
//    public interface IExportOrderService
//    {
//        UpdateExportOrderResponse UpdateOrder(UpdateExportOrderRequest i);
//        List<ExportOrderDTO> GetAllExportOrder();
//        ExportOrder? GetExportOrderById(int id);
//        ExportOrder? GetExportOrderByOrderCode(string code);
//        CreateExportOrderResponse CreateExportOrder(CreateExportOrderRequest i);

//        int GetExportOrderNewest();

//        ExportOrderFilterPaging ExportOrderFilterPaging(int page, int? user, int? storage,
//                                                        int? project, int? storekeeper,
//                                                        int? status, int? sortDate, string? keyword = "");
//    }
//    public class ExportOrderService : IExportOrderService
//    {
//        private readonly iSmartContext _context;
//        public ExportOrderService(iSmartContext context)
//        {
//            _context = context;
//        }

//        public CreateExportOrderResponse CreateExportOrder(CreateExportOrderRequest i)
//        {
//            try
//            {
//                var exportOrder = new ExportOrder
//                {
//                    ExportCode = "XH" + i.ExportCode,
//                    UserId = i.UserId,
//                    TotalPrice = i.TotalPrice,
//                    Note = i.Note,
//                    StatusId = i.StatusId,
//                    CreatedDate = DateTime.Now,
//                    ExportedDate = i.ExportedDate,
//                    StorageId = i.StorageId,
//                    ProjectId = i.ProjectId,
//                    CancelDate = i.CancelDate,
//                    DeliveryId = i.DeliveryId,
//                    Image = i.Image,
//                    StorekeeperId = i.StorekeeperId,
//                    Customer = i.Customer,
//                    Address = i.Address
//                };
//                    if (_context.ExportOrders.SingleOrDefault(z => exportOrder.ExportCode.ToLower() == z.ExportCode.ToLower()) == null)

//                    {
//                        _context.Add(exportOrder);
//                    _context.SaveChanges();
//                    return new CreateExportOrderResponse { IsSuccess = true, Message = "tao don hang xuat thanh cong" };
//                }
//                else  return new CreateExportOrderResponse { IsSuccess = false, Message = "Ma xuat hang da ton tai"};
//            }
//            catch (Exception e) {
//                return new CreateExportOrderResponse { IsSuccess = false, Message = $"Tao don hang xuat that bai +{e.Message}" };
//            }
//        }

//        public int GetExportOrderNewest()
//        {
//            var importOrderNewest = _context.ExportOrders.OrderByDescending(i => i.ExportId).FirstOrDefault();
//            if (importOrderNewest != null)
//            {
//                return importOrderNewest.ExportId;
//            }
//            return 0;

//        }
//        public ExportOrderFilterPaging ExportOrderFilterPaging(int page,  int? user, int? storage, int? project, int? storekeeper, int? status, int? sortDate, string? keyword = "")
//        {
//            try
//            {
//                var pageSize = 6;
//                if (page <= 0) page = 1;
//                var users = _context.ExportOrders.Where(s => s.ExportCode.ToLower().Contains(keyword.ToLower())

//                                                      && (user == null || s.UserId == user)
//                                                      && (storekeeper == null || s.StorekeeperId  == storekeeper )
//                                                      && (status == null || s.StatusId == status)
//                                                      && (storage == null || s.StorageId == storage)
//                                                      && (project == null || s.ProjectId == project));
//                if (sortDate != null)
//                {
//                    users = users.OrderBy(s => s.ExportedDate);
//                }

//                var count = users.Count();
//                var exportOrder = users.Select(i => new ExportOrderDTO
//                {
//                    ExportId = i.ExportId,
//                    ExportCode = i.ExportCode,
//                    UserId = i.UserId,
//                    UserName = i.User.UserName,
//                    TotalPrice = i.TotalPrice,
//                    Note = i.Note,
//                    StatusId = i.StatusId,
//                    StatusType = i.Status.StatusType,
//                    CreatedDate = i.CreatedDate,
//                    ExportedDate = i.ExportedDate,
//                    StorageId = i.StorageId,
//                    StorageName = i.Storage.StorageName,
//                    ProjectId = i.ProjectId,
//                    ProjectName = i.Project.ProjectName,
//                    CancelDate = i.CancelDate,
//                    DeliveryId = i.DeliveryId,
//                    DeliveryName = i.Delivery.DeliveryName,
//                    Image = i.Image,
//                    StorekeeperId = i.StorekeeperId,
//                    StorekeeperName = _context.Users.FirstOrDefault(u => u.UserId == i.StorekeeperId).UserName,
//                    Customer = i.Customer,
//                    Address = i.Address,
//                    ExportOrderDetails = (List<ExportDetailDTO>)i.ExportOrderDetails
//                    .Select(
//                             i => new ExportDetailDTO
//                             {
//                                 ExportId = i.ExportId,
//                                 Price = i.Price,
//                                 GoodsId = i.GoodsId,
//                                 Quantity = i.Quantity,
//                                 GoodsCode = i.Goods.GoodsCode
//                             })
//                });
//                var res = exportOrder.Skip((page - 1) * pageSize).Take(pageSize).ToList();
//                var totalPages = Math.Ceiling((double)count / pageSize);
//                return new ExportOrderFilterPaging
//                {
//                    Data = res,                                            
//                    PageSize = pageSize,
//                    TotalPages = (int)totalPages
//                };
//            }
//            catch (Exception e) {
//                throw new Exception(e.Message);
//            }
//        }

//        public List<ExportOrderDTO> GetAllExportOrder()
//        {
//            try
//            {
//                var exportOrder = _context.ExportOrders
//                    // .Include(i => i.Status).Include(i => i.User).Include(i => i.Storage).Include(i => i.Storage).Include(i => i.Project)
//                    .Select( i=> new ExportOrderDTO
//                    {
//                        ExportId = i.ExportId,
//                        ExportCode = i.ExportCode,
//                        UserId = i.UserId,
//                        UserName = i.User.FullName,
//                        TotalPrice = i.TotalPrice,
//                        Note = i.Note,
//                        StatusId = i.StatusId,
//                        StatusType = i.Status.StatusType,
//                        CreatedDate = i.CreatedDate,
//                        ExportedDate = i.ExportedDate,
//                        StorageId = i.StorageId,
//                        StorageName = i.Storage.StorageName,
//                        ProjectId = i.ProjectId,
//                        ProjectName = i.Project.ProjectName,
//                        CancelDate = i.CancelDate,
//                        DeliveryId = i.DeliveryId,
//                        DeliveryName = i.Delivery.DeliveryName,
//                        Image = i.Image,
//                        StorekeeperId = i.StorekeeperId,
//                        StorekeeperName = _context.Users.FirstOrDefault(u => u.UserId == i.StorekeeperId).UserName,
//                        Customer = i.Customer,
//                        Address = i.Address,
//                        ExportOrderDetails = (List<ExportDetailDTO>)i.ExportOrderDetails.
//                        Select(
//                            i => new ExportDetailDTO
//                            {
//                                ExportId = i.ExportId,
//                                GoodsId = i.GoodsId,
//                                Price = i.Price,
//                                Quantity = i.Quantity,
//                                GoodsCode = i.Goods.GoodsCode

//                            })                 
//                    })
//                    .ToList();
//                return exportOrder;
//            }catch (Exception e)
//            {
//                throw new Exception(e.Message);
//            }
//        }

//        public ExportOrder? GetExportOrderById(int id)
//        {
//            try
//            {
//                var exportOrder = _context.ExportOrders
//                    .Include(i => i.Status).Include(i => i.User).Include(i => i.Storage).Include(i => i.Storage).Include(i => i.Project)
//                    .FirstOrDefault(i => i.ExportId == id);
//                return exportOrder;
//            }
//            catch (Exception e)
//            {
//                throw new Exception(e.Message);
//            }
//        }

//        public ExportOrder? GetExportOrderByOrderCode(string code)
//        {
//            try
//            {
//                var exportOrder = _context.ExportOrders
//                    .Include(i => i.Status).Include(i => i.User).Include(i => i.Storage).Include(i => i.Storage).Include(i => i.Project)
//                    .FirstOrDefault(i => i.ExportCode.ToLower().Contains(code.ToLower()));
//                return exportOrder ?? null;
//            }
//            catch (Exception e)
//            {
//                throw new Exception(e.Message);

//            }
//        }

//        public UpdateExportOrderResponse UpdateOrder(UpdateExportOrderRequest i)
//        {
//            try
//            {
//                var exportOrder = new ExportOrder
//                {
//                    ExportId = i.ExportId,
//                    ExportCode = i.ExportCode,
//                    UserId = i.UserId,
//                    TotalPrice = i.TotalPrice,
//                    Note = i.Note,
//                    StatusId = i.StatusId,
//                    CreatedDate = i.CreatedDate,
//                    ExportedDate = i.ExportedDate,
//                    StorageId = i.StorageId,
//                    ProjectId = i.ProjectId,
//                    DeliveryId = i.DeliveryId,
//                    Image = i.Image,
//                    StorekeeperId = i.StokekeeperId,
                    
//                };
//                _context.Update(exportOrder);
//                _context.SaveChanges();
//                return new UpdateExportOrderResponse { IsSuccess = true, Message = "sưa don hang thanh cong" };

//            }
//            catch (Exception e)
//            {
//                return new UpdateExportOrderResponse { IsSuccess = false, Message = $"sua don hang nhap that bai +{e.Message}" };
//            }
//        }
//    }
//}
