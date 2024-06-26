using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.EntityFrameworkCore;
using iSmart.Entity.DTOs.ExportOrderDTO;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Entity.Models;
using iSmart.Service;

namespace iSmart.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]

    public class ExportOrderController : ControllerBase
    {
        public IConfiguration _configuration;
        private readonly IExportOrderService _exportService;
        private readonly iSmartContext _context;

        public ExportOrderController(IExportOrderService exportOrderService, IConfiguration configuration, iSmartContext context)
        {
            _exportService = exportOrderService;           
            _configuration = configuration;
            _context = context;
        }
        //[HttpGet("get-all-export-orders")]

        //public IActionResult GetAllOrders() {
        //    var result = _exportService.GetAllExportOrder();
        //    return Ok(result);
        //}

        //[HttpGet("get-newest-export-order")]

        //public IActionResult GetNewestImportOrder()
        //{
        //    var result = _exportService.GetExportOrderNewest();
        //    return Ok(result);
        //}
        //[HttpGet("get-export-orders")]
        //public IActionResult GetOrdersByKeyword(int page, int? user, int? storage,
        //                                        int? project, int? storekeeper, int? status, int? sortDate, string? keyword = "")
        //{
        //    var reult = _exportService.ExportOrderFilterPaging(page, user, storage, project, storekeeper, status, sortDate, keyword);
        //    return Ok(reult);
        //}
        [HttpPost("add-export-order")]
        public IActionResult AddExportOrder(CreateExportOrderRequest i, int staffId)
        {
            var result = _exportService.CreateExportOrder(i, staffId);
            return Ok(result);
        }

        //// PUT api/<UserController>/5
        //[HttpPut("update-export-order")]
        //public IActionResult UpdateExportOrder(UpdateExportOrderRequest i)
        //{
        //    var result = _exportService.UpdateOrder(i);
        //    return Ok(result);
        //}
        //[HttpPost("Export")]
        //public async Task<IActionResult> Export(int exportId)
        //{
        //    try
        //    {
        //        //var storageid = Int32.Parse(User.Claims.SingleOrDefault(x => x.Type == "StorageId").Value);
        //        var result = await _context.ExportOrders.Include(a => a.ExportOrderDetails).SingleOrDefaultAsync(x => x.ExportId == exportId);
        //        if (result != null && result.StatusId == 3)
        //        {
        //            result.StatusId = 4;
        //            result.ExportedDate = DateTime.Now;
        //            foreach (var detail in result.ExportOrderDetails)
        //            {
        //                var product = await _context.Goods.SingleOrDefaultAsync(x => x.GoodsId == detail.GoodsId);
        //                var history = new GoodsHistory
        //                {
        //                    GoodsId = product.GoodsId,
        //                    ActionId = 2
        //                };
        //                int total = (int)detail.Quantity;
        //                history.QuantityDifferential = $"-{detail.Quantity}";
        //                if (total > product.InStock)
        //                    return BadRequest("Số lượng xuất lớn hơn tồn kho");
        //                history.Quantity = product.InStock;
        //                product.InStock -= total;

        //                history.QuantityDifferential = $"-{total}";
        //                history.CostPrice = product.StockPrice;
        //                // product.StockPrice = (detail.Quantity * detail.Price + product.InStock * product.SellingPrice) / (total + product.InStock);
        //                var pricedifferential = product.StockPrice - history.CostPrice;
        //                if (pricedifferential > 0)
        //                    history.CostPriceDifferential = $"+{pricedifferential}";
        //                else if (pricedifferential < 0)
        //                    history.CostPriceDifferential = $"-{pricedifferential}";
        //                else
        //                    history.CostPriceDifferential = null;
        //                history.OrderCode = result.ExportCode;
        //                history.UserId = (int)result.StorekeeperId;
        //                history.Quantity = product.InStock;
        //                history.Date = DateTime.Now;
        //                _context.Add(history);
        //            }
        //            await _context.SaveChangesAsync();
        //            return Ok("Thành công");
        //        }
        //        else
        //        {
        //            return BadRequest("Không có dữ liệu");
        //        }
        //    }
        //    catch
        //    {
        //        return StatusCode(500);
        //    }
        //}
        //[HttpPost("cancel-export")]
        //public async Task<IActionResult> Cancelexport(int exportId)
        //{
        //    var result = _context.ExportOrders.FirstOrDefault(i => i.ExportId == exportId);
        //    if (result != null && result.StatusId == 3)
        //    {
        //        result.StatusId = 5;
        //        result.ExportedDate = DateTime.Now;
        //        _context.ExportOrders.Update(result);
        //        await _context.SaveChangesAsync();
        //        return Ok("thành công");
        //    }
        //    else return BadRequest("Không tồn tại");

        //}
    }
}
