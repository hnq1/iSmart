﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace iSmart.Entity.DTOs.CategoryDTO
{
    public class CreateCategoryRequest
    {

        public string CategoryName { get; set; } = null!;

        public string? Description { get; set; }
    }
}
