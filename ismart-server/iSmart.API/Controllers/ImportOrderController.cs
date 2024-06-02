using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.EntityFrameworkCore;
using iSmart.Entity.DTOs.ImportOrderDTO;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Entity.Models;
using WM.Service;

namespace WM.API.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    //[Authorize]

    public class ImportOrderController : ControllerBase
    {
        public IConfiguration _configuration;
        private readonly IImportOrderService _importService;
   
        private readonly iSmartContext _context;

        public ImportOrderController(IImportOrderService ImportOrderService, iSmartContext context)
        {
            _importService = ImportOrderService;
            _context = context;
        }
       
        [HttpGet("get-all-import-orders")]
        public IActionResult GetAllOrders()
        {
            var result = _importService.GetAllImportOrder();
            return Ok(result);
        }

        //[HttpGet("get-newest-import-order")]
        //public IActionResult GetNewestImportOrder()
        //{
        //    var result = _importService.GetImportOrderNewest();
        //    return Ok(result);
        //}

        //[HttpGet("get-import-orders")]
        //public IActionResult ImportOrderFilterPaging(int page, int? storage, int? status, int? sortDate, string? keyword = "")
        //{
        //    var reult = _importService.ImportOrderFilterPaging(page,storage, status, sortDate, keyword);
        //    return Ok(reult);
        //}
        //[HttpPost("add-import-order")]
        //public IActionResult AddImportOrder(CreateImportOrderRequest i)
        //{
        //    var result = _importService.CreateImportOrder(i);
        //    return Ok(result);
        //}

         
        //[HttpPut("update-import-order")]
        //public IActionResult UpdateImportOrder(UpdateImportOrderRequest i)
        //{
        //   var result = _importService.UpdateOrder(i);
        //   return Ok(result);
        //}
        //[HttpPost("cancel-import")]
        //public async Task<IActionResult> CancelImport(int importId)
        //{
        //    var result = _context.ImportOrders.FirstOrDefault(i => i.ImportId == importId);
        //    if (result != null && result.StatusId == 3)
        //    {
        //        result.StatusId = 5;
        //        result.ImportedDate = DateTime.Now;
        //        _context.ImportOrders.Update(result);
        //        await _context.SaveChangesAsync();
        //        return Ok("thành công");
        //    }
        //    else return BadRequest("Không tồn tại");

        //}
        //[HttpPost("Import")]
        //public async Task<IActionResult> Import(int importid)
        //{
        //    try
        //    {
        //        var result = await _context.ImportOrders.Include(a => a.ImportOrderDetails).SingleOrDefaultAsync(x => x.ImportId == importid);
        //        if (result != null && result.StatusId == 3)
        //        {
        //            result.StatusId = 4;
        //            result.ImportedDate = DateTime.Now;
        //            foreach (var detail in result.ImportOrderDetails)
        //            {
        //                var Goods = await _context.Goods.SingleOrDefaultAsync(x => x.GoodsId == detail.GoodsId);
        //                var history = new GoodsHistory
        //                {
        //                    GoodsId = Goods.GoodsId,
        //                    ActionId = 1
        //                };
        //                int total = (int)detail.Quantity;
        //                history.Quantity = Goods.InStock;
        //                Goods.InStock += total;                                           
        //                history.QuantityDifferential = $"{total}";
        //                history.CostPrice = Goods.StockPrice;
        //                Goods.StockPrice = detail.CostPrice;
        //                var costdifferential = Goods.StockPrice - history.CostPrice;
        //                if (costdifferential > 0)
        //                    history.CostPriceDifferential = $"{costdifferential}";
        //                else if (costdifferential < 0)
        //                    history.CostPriceDifferential = $"{costdifferential}";
        //                else
        //                    history.CostPriceDifferential = null;
        //                history.OrderCode = result.ImportCode;
        //                history.UserId = (int)result.StorekeeperId;
        //                history.Quantity = Goods.InStock;
        //                history.Date = DateTime.Now;
        //                _context.Add(history);
        //                _context.Goods.Update(Goods);
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
    }     
}

