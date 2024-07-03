using EF.Core.Repository.Manager;
using ItemCategoryApp.BLL.Interface;
using ItemCategoryApp.DAL.Repository;
using ItemCategoryApp.Models;
using ItemCategoryApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.BLL.Manager
{
    public class UserRoleManager : CommonManager<UserRole>, IUserRoleManager
    {
        private UserRoleRepository _userRoleRepository;
        public UserRoleManager(ItemDBContext _dbContext) : base(new UserRoleRepository(_dbContext))
        {
            _userRoleRepository = new UserRoleRepository(_dbContext);
        }
    }
}
