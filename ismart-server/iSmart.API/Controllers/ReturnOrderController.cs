using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using iSmart.Entity.DTOs.ReturnOrderDTO;
using iSmart.Service;

namespace iSmart.API.Controllers
{
    [Route("api/return-order")]
    [ApiController]
    public class ReturnOrderController : ControllerBase
    {
        private readonly IReturnOrderService _returnOrderService;

        public ReturnOrderController(IReturnOrderService returnOrderService)
        {
            _returnOrderService = returnOrderService;
        }

        [HttpPost("create-return-order")]
        public ActionResult<CreateReturnOrderResponse> CreateReturnOrder(CreateReturnOrderRequest request, int staffId)
        {
            var response = _returnOrderService.CreateReturnOrder(request, staffId);
            if (response.IsSuccess)
            {
                return Ok(response);
            }
            return BadRequest(response);
        }

        [HttpGet("get-all-return-orders")]
        public ActionResult<List<ReturnOrderDTO>> GetAllReturnOrders()
        {
            var returnOrders = _returnOrderService.GetAllReturnOrders();
            return Ok(returnOrders);
        }

        [HttpGet("get-return-order-newest")]
        public ActionResult<int> GetReturnOrderNewest()
        {
            var returnOrderId = _returnOrderService.GetReturnOrderNewest();
            return Ok(returnOrderId);
        }

        [HttpGet("return-order-filter-paging")]
        public ActionResult<ReturnOrderFilterPaging> ReturnOrderFilterPaging(int pageSize, int page, int? warehouseId, int? userId, int? approvedById, int? status, int? sortDate, string? keyword = "")
        {
            var result = _returnOrderService.ReturnOrderFilterPaging(pageSize, page, warehouseId, userId, approvedById, status, sortDate, keyword);
            return Ok(result);
        }

        [HttpPost("update-order")]
        public ActionResult<UpdateReturnOrderResponse> UpdateOrder(UpdateReturnOrderRequest request)
        {
            var response = _returnOrderService.UpdateOrder(request);
            if (response.IsSuccess)
            {
                return Ok(response);
            }
            return BadRequest(response);
        }
    }
}
