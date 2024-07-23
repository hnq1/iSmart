using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.Models;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Service
{
    public interface ICategoryService
    {
        CategoryFilterPaging GetCategoryByKeyword(int page, string? keyword = "");
        Task<List<Category>?> GetAllCategory();
        Category? GetCategoryById(int id);
        CreateCategoryResponse AddCategory(CreateCategoryRequest category);
        UpdateCategoryResponse UpdateCaregory(UpdateCategoryRequest category);

    }

    public class CategoryService : ICategoryService
    {
        private readonly iSmartContext _context;
        public CategoryService(iSmartContext context)
        {
            _context = context;
        }

        public CreateCategoryResponse AddCategory(CreateCategoryRequest category)
        {
            try
            {
                var requestCategorry = new Category
                {
                    CategoryName = category.CategoryName,
                    Description = category.Description
                };
                if (_context.Categories.SingleOrDefault(c => c.CategoryName.ToLower() == requestCategorry.CategoryName.ToLower()) == null)
                {
                    _context.Categories.Add(requestCategorry);
                    _context.SaveChanges();
                    return new CreateCategoryResponse { IsSuccess = true, Message = $"Thêm loai hàng thành công" };
                }
                else return new CreateCategoryResponse { IsSuccess = false, Message = "Loại hàng hóa đã tồn tại!" };
            }
            catch (Exception ex)
            {
                return new CreateCategoryResponse { IsSuccess = false, Message = $"Thêm loai hàng thất bại" };
            }
        }

        public async Task<List<Category>?> GetAllCategory()
        {
            try
            {
                var category = await _context.Categories.ToListAsync();
                return category;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        public Category GetCategoryById(int id)
        {
            try
            {
                var category = _context.Categories.FirstOrDefault(c => c.CategoryId == id);
                return category ?? null;
            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }

        //public CategoryFilterPaging GetCategoryByKeyword(int page, string? keyword = "")
        //{
        //    try
        //    {
        //        var pageSize = 6;

        //        var category = _context.Categories.Where(c => c.CategoryName.ToLower().Contains(keyword.ToLower())
        //                                                || c.Description.ToLower().Contains(keyword.ToLower()))
        //                                        .OrderBy(c => c.CategoryId).ToList();
        //        var count = category.Count();
        //        var res = category.Skip((page - 1) * pageSize).Take(pageSize).ToList();
        //        var totalPages = Math.Ceiling((double)count / pageSize);
        //        return new CategoryFilterPaging { TotalPages = (int)totalPages, PageSize = pageSize, Data = res };

        //    }
        //    catch (Exception e)
        //    {
        //        throw new Exception(e.Message);
        //    }
        //}

        public CategoryFilterPaging GetCategoryByKeyword(int page, string? keyword = "")
        {
            try
            {
                var pageSize = 12;
                if (string.IsNullOrWhiteSpace(keyword))
                {
                    keyword = string.Empty;
                }
                var category = _context.Categories.Where(c => c.CategoryName.ToLower().Contains(keyword.ToLower())
                                                        || c.Description.ToLower().Contains(keyword.ToLower()))
                                                .OrderBy(c => c.CategoryId).ToList();
                var count = category.Count();
                var res = category.Skip((page - 1) * pageSize).Take(pageSize).ToList();
                var totalPages = Math.Ceiling((double)count / pageSize);
                return new CategoryFilterPaging { TotalPages = (int)totalPages, PageSize = pageSize, Data = res };

            }
            catch (Exception e)
            {
                throw new Exception(e.Message);
            }
        }




        public UpdateCategoryResponse UpdateCaregory(UpdateCategoryRequest category)
        {
            try
            {
                // Kiểm tra nếu CategoryName là null hoặc là một chuỗi khoảng trắng
                if (string.IsNullOrWhiteSpace(category.CategoryName))
                {
                    return new UpdateCategoryResponse { IsSuccess = false, Message = "Category name không được để trống hoặc là khoảng trắng!" };
                }

                var existingCategory = _context.Categories.SingleOrDefault(c => c.CategoryId == category.CategoryId);

                if (existingCategory == null)
                {
                    return new UpdateCategoryResponse { IsSuccess = false, Message = "Category không tồn tại!" };
                }

                // Kiểm tra nếu CategoryName đã tồn tại (trừ danh mục hiện tại)
                var duplicateCategory = _context.Categories
                    .SingleOrDefault(c => c.CategoryName.ToLower() == category.CategoryName.ToLower() && c.CategoryId != category.CategoryId);

                if (duplicateCategory != null)
                {
                    return new UpdateCategoryResponse { IsSuccess = false, Message = "Category name đã tồn tại!" };
                }

                existingCategory.CategoryName = category.CategoryName;
                existingCategory.Description = category.Description;

                _context.Categories.Update(existingCategory);
                _context.SaveChanges();

                return new UpdateCategoryResponse { IsSuccess = true, Message = "Update category successfully" };
            }
            catch (Exception e)
            {
                return new UpdateCategoryResponse { IsSuccess = false, Message = "Update category failed" };
            }
        }
    }
}
