﻿using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using iSmart.Entity.DTOs.CategoryDTO;
using iSmart.Entity.DTOs.UserDTO;
using iSmart.Entity.Models;
using iSmart.Service;

namespace WM.Test
{
    public class TestUser
    {
        private UserService _userService { get; set; } = null;
        private iSmartContext _context;

        [SetUp]
        public void Setup()
        {
            var context = new iSmartContext();
            _context = context;
            _userService = new UserService(context);
        }
        // get all user
        [Test]
        public void GetAllUser_Test()
        {
            var result = false;
            var users = _userService.GetAllUser();
            if (users != null) result = true;
            Assert.That(result, Is.EqualTo(true));

        }


        //get user by id
        [Test]
        public void GetUserById_Test()
        {
            var result = false;
            var users = _userService.GetUserById(11);
            if (users != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }

        //create new user
        [Test]
        public void CreateUser_Test()
        {
            var result = false;
            var userEntry = new CreateUserRequest
            {
                UserName = "Test5",
                UserCode = "Test5",
                FullName = "Test5",
                Email = "thanhdo5@gmail.com",
                Address = "Test5",
                Phone = "0795743786",
                RoleId = 1,
                Password = "Test5",
                StatusId = 1,
                Image = "Test5"
            };
            var userResponse = _userService.AddUser(userEntry);
            if (userResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(true));
        }

        //get user by roll id
        //[Test]
        //public void GetUserByRollId_Test()
        //{
        //    var result = false;
        //    var users = _userService.GetUsersByRoleId(1, 1);
        //    if (users != null) result = true;
        //    Assert.That(result, Is.EqualTo(true));
        //}

        //update user
        [Test]
        public void EditUser_Test()
        {
            var result = false;
            var userEntry = new UpdateUserDTO
            {
                UserId = 12,
                UserName = "Test",
                UserCode = "Test",
                FullName = "Test",
                Email = "thanh@gmail.com",
                Address = "Test3",
                Phone = "Test3",
                RoleId = 1,
                StatusId = 1,
                Image = "Test3"
            };
            var userResponse = _userService.UpdateUser(userEntry);
            if (userResponse.IsSuccess is true) result = true;
            Assert.That(result, Is.EqualTo(false));
        }

        //get user status
        [Test]
        public void GetUserStatus_Test()
        {
            var result = false;
            var users = _userService.UpdateDeleteStatusUser(1);
            if (users != null) result = true;
            Assert.That(result, Is.EqualTo(true));
        }
    }
}