﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.GoodsDTO;
using iSmart.Entity.Models;
using iSmart.Service;
namespace iSmart.Test
{
    public class TestGoods
    {
        private GoodsService _goodsService { get; set; } = null;
        private iSmartContext _context;
        [SetUp]
        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            _goodsService = new GoodsService(context);
        }
        //Get all goods
        [Test]
        public void GetAllGoods_Test()
        {
            var result = false;
            var goods = _goodsService.GetAllGoods();
            if(goods != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        //Create new goods
        [Test]
        public void CreateGoods_Test() {
            var result = false;
            var goodsEntry = new CreateGoodsRequest
            {
                GoodsCode = "Test3",
                GoodsName = "Test3",
                CategoryId = 4,
                Description = "Test3",
                SupplierId = 4,
                MeasuredUnit = "Test3",
                Image = "Test3",
                StatusId = 4,
                StockPrice = 100,
                Barcode = "Test",
                MaxStock = 1000,
                MinStock = 1,
                CreatedDate = DateTime.Now,
                WarrantyTime = 12,                             
            };
            var goodsResponse = _goodsService.AddGoods(goodsEntry,11);
            if(goodsResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        //Update goods
        [Test]
        public void UpdateGoods_Test()
        {
            var result = false;
            var goodsEntry = new UpdateGoodsRequest
            {
                GoodsCode = "Test",
                GoodsName = "Test1",
                CategoryId = 3,
                Description = "Test1",
                SupplierId = 3,
                MeasuredUnit = "Test1",
                //InStock = 100,
                Image = "Test1",
                StatusId = 1,
                StockPrice = 100,
                Barcode = "Test1",
                MaxStock = 1000,
                MinStock = 1,
                WarrantyTime = 12,

            };
            var goodsResponse = _goodsService.UpdateGoods(goodsEntry);
            if (goodsResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }

        //get goods by id
        [Test]
        public void GetGoodsById_Test()
        {
            var result = false;
            var goods = _goodsService.GetGoodsById(1);
            if (goods != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }


    }
}
