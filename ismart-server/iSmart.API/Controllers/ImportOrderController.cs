using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Controllers;
using Microsoft.EntityFrameworkCore;
using iSmart.Entity.DTOs.ImportOrderDTO;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Entity.Models;
using iSmart.Service;

namespace iSmart.API.Controllers
{
    [Route("api/import-order")]
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

        [HttpGet("get-newest-import-order")]
        public IActionResult GetNewestImportOrder()
        {
            var result = _importService.GetImportOrderNewest();
            return Ok(result);
        }

        [HttpGet("get-import-orders")]
        public IActionResult ImportOrderFilterPaging(int page, int? warehouseId, int? status, int? sortDate, string? keyword = "")
        {
            var reult = _importService.ImportOrderFilterPaging(page, warehouseId, status, sortDate, keyword);
            return Ok(reult);
        }

        [HttpPost("add-import-order")]
        public IActionResult AddImportOrder(CreateImportOrderRequest i)
        {
            var result = _importService.CreateImportOrder(i);
            return Ok(result);
        }


        [HttpPut("update-import-order")]
        public IActionResult UpdateImportOrder(UpdateImportOrderRequest i)
        {
            var result = _importService.UpdateOrder(i);
            return Ok(result);
        }

        [HttpPost("import")]
        public async Task<IActionResult> Import(int importid)
        {
            try
            {
                var result = await _context.ImportOrders.Include(a => a.ImportOrderDetails).SingleOrDefaultAsync(x => x.ImportId == importid);

                // Kiểm tra nếu đơn hàng tồn tại và trạng thái của đơn hàng là 3
                if (result != null && result.StatusId == 3)
                {
                    // Cập nhật trạng thái đơn hàng và thời gian nhập hàng
                    result.StatusId = 4;
                    result.ImportedDate = DateTime.Now;

                    // Duyệt qua từng chi tiết đơn hàng nhập
                    foreach (var detail in result.ImportOrderDetails)
                    {
                        // Tìm hàng hóa tương ứng với GoodsId trong chi tiết đơn hàng
                        var goods = await _context.Goods.SingleOrDefaultAsync(x => x.GoodsId == detail.GoodsId);
                        if (goods == null)
                        {
                            return BadRequest($"Goods with ID {detail.GoodsId} not found");
                        }

                        // Tìm thông tin hàng hóa trong kho
                        var goodsWarehouse = await _context.GoodsWarehouses.SingleOrDefaultAsync(x => x.GoodsId == detail.GoodsId);
                        if (goodsWarehouse == null)
                        {
                            // Nếu chưa có thông tin trong kho, tạo mới
                            goodsWarehouse = new GoodsWarehouse
                            {
                                GoodsId = goods.GoodsId,
                                Quantity = 0
                            };
                            _context.GoodsWarehouses.Add(goodsWarehouse);
                        }

                        // Tạo bản ghi lịch sử cho hàng hóa
                        var history = new GoodsHistory
                        {
                            GoodsId = goods.GoodsId,
                            ActionId = 1, // Hành động nhập hàng
                            OrderCode = result.ImportCode,
                            UserId = (int)result.UserId,
                            Date = DateTime.Now,
                            Quantity = goodsWarehouse.Quantity
                        };

                        // Cập nhật số lượng hàng trong kho
                        int total = (int)detail.Quantity;
                        goodsWarehouse.Quantity += total;
                        history.QuantityDifferential = $"{total}";

                        // Cập nhật giá nhập hàng
                        history.CostPrice = goods.StockPrice;
                        goods.StockPrice = detail.CostPrice;

                        // Tính toán sự chênh lệch giá nhập
                        var costdifferential = goods.StockPrice - history.CostPrice;
                        history.CostPriceDifferential = costdifferential != 0 ? $"{costdifferential}" : null;

                        // Cập nhật các thông tin khác cho bản ghi lịch sử
                        history.Quantity = goodsWarehouse.Quantity;

                        _context.GoodsHistories.Add(history);
                        _context.Goods.Update(goods);
                        _context.GoodsWarehouses.Update(goodsWarehouse);
                    }
                    await _context.SaveChangesAsync();
                    return Ok("Thành công");
                }
                else
                {
                    return BadRequest("Không có dữ liệu");
                }
            }
            catch (Exception ex)
            {
                // Log the exception (ex) for debugging purposes
                return StatusCode(500, "Internal server error: " + ex.Message);
            }
        }


        [HttpPost("cancel-import")]
        public async Task<IActionResult> CancelImport(int importId)
        {
            var result = _context.ImportOrders.FirstOrDefault(i => i.ImportId == importId);
            if (result != null && result.StatusId == 3)
            {
                result.StatusId = 5;
                result.ImportedDate = DateTime.Now;
                _context.ImportOrders.Update(result);
                await _context.SaveChangesAsync();
                return Ok("thành công");
            }
            else return BadRequest("Không tồn tại");

        }

    }
}

