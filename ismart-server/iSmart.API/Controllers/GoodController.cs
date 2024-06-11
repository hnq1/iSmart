using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using iSmart.Entity.DTOs.GoodsDTO;
using iSmart.Service;

namespace iSmart.API.Controllers
{
    [Route("api/goods")]
    [ApiController]
    //[Authorize]
    public class GoodController : ControllerBase
    {
        private readonly IGoodsService _goodsService;

        public GoodController(IGoodsService goodsService)
        {
            _goodsService = goodsService;
        }

        // GET: GoodsController
        [AllowAnonymous]
        [HttpGet("get-all-goods")]
        public async Task <IActionResult> GetAllGoods()
        {
            var result = await _goodsService.GetAllGoods();
          
            return Ok(result);
        }

        [HttpPost("add-goods")]
        public async Task<IActionResult> AddGoods(CreateGoodsRequest goods, int userId)
        {
            var result = _goodsService.AddGoods(goods, userId);
            return Ok(result);
        }

        [HttpGet("get-goods")]
        public IActionResult GetGoodsByKeyword(int page, int? categoryId, int? supplierId, int? sortPrice, string? keyword = "")
        {
            var result = _goodsService.GetGoodsByKeyword(page, categoryId, supplierId, sortPrice, keyword);
            return Ok(result);
        }

        [HttpGet("get-good-by-id")]
        public IActionResult GetGoodById(int id)
        {
            var result = _goodsService.GetGoodsById(id);
            return Ok(result);
        }


        [HttpGet("get-goods-with-warehouse-supplier")]
        public async Task<IActionResult> GetAllGoodsWithStorageAndSupplier(int storageId, int supplierId)
        {
            var result = await _goodsService.GetAllGoodsWithStorageAndSupplier(storageId, supplierId);

            return Ok(result);
        }


        [HttpPut("update-goods")]
        public async Task<IActionResult> UpdateGoods(UpdateGoodsRequest goods)
        {
            var result = _goodsService.UpdateGoods(goods);
            return Ok(result);
        }

        [HttpPut("update-goods-status")]
        public async Task<IActionResult> UpdateStatus(int id, int status)
        {
            var user = _goodsService.UpdateStatusGoods(id, status);
            return Ok(user);
        }
    }
}
