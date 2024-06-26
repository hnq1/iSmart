using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.Models;
using iSmart.Service;

namespace iSmart.Test
{
    public class TestCategory
    {
        private CategoryService _categoryService { get; set; } = null;
        private iSmartContext _context;

        [SetUp]
        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            _categoryService = new CategoryService(context);
        }
        // get all category
        [Test]
        public void GetAllCategory_Test()
        {
            var result = false;
            var categories = _categoryService.GetAllCategory();
            if(categories != null) result = true;
            Assert.That(result, Is.EqualTo(true));

        }
        //get category by keyword
        [Test]
        public void GetCategoryWithFilter_Test()
        {
            var result = false;
            var categories = _categoryService.GetCategoryByKeyword(1,"t");
            if(categories.Data.Count > 0) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        //get category by id
        [Test]
        public void GetCategoryById_Test()
        {
            var result = false;
            var categories = _categoryService.GetCategoryById(1);
            if (categories != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        [Test]
        public void CreateCategory_Test()
        {
            var result = false;
            var categoryEntry = new CreateCategoryRequest
            {
                CategoryName = "Máy Giặt",
                Description = " ",
            };
            var categoryResponse = _categoryService.AddCategory(categoryEntry);
            if (categoryResponse.IsSuccess == true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
        //create new category
        [Test]
        public void CreateCategory_TestBlank()
        {
            var result = false;
            var categoryEntry = new CreateCategoryRequest
            {
                CategoryName = " ",
                Description = " ",
            };
            var categoryResponse = _categoryService.AddCategory(categoryEntry);
            if (categoryResponse.IsSuccess == true) result = true;
            Assert.That(result, Is.EqualTo(false));
        }
        //create new category
        [Test]
        public void CreateCategory_TestRepeat()
        {
            var result = false;
            var categoryEntry = new CreateCategoryRequest
            {
                CategoryName = "Tivi",
                Description = " ",
            };
            var categoryResponse = _categoryService.AddCategory(categoryEntry);
            if (categoryResponse.IsSuccess == true) result = true;
            Assert.That(result, Is.EqualTo(false));
        }
        //update category
        [Test]
        public void EditCategory_TestBlank()
        {
            var result = false;
            var categoryEntry = new UpdateCategoryRequest
            {
                CategoryId = 11,
                CategoryName = " ",
                Description = " "
            };
            var categoryResponse = _categoryService.UpdateCaregory(categoryEntry);
            if (categoryResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(false));
        }
        [Test]
        public void EditCategory_TestRepeat()
        {
            var result = false;
            var categoryEntry = new UpdateCategoryRequest
            {
                CategoryId = 11,
                CategoryName = "Tivi",
                Description = " "
            };
            var categoryResponse = _categoryService.UpdateCaregory(categoryEntry);
            if (categoryResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(false));
        }
    }
}
