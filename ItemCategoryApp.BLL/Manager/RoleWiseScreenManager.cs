using EF.Core.Repository.Manager;
using ItemCategoryApp.BLL.Interface;
using ItemCategoryApp.DAL.Repository;
using ItemCategoryApp.Models.Entities;
using ItemCategoryApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.BLL.Manager
{
    public class RoleWiseScreenManager : CommonManager<RoleWiseScreenPermission>, IRoleWiseScreenManager
    {
        private RoleWiseScreenPermissionRepository _screenPermissionRepository;
        public RoleWiseScreenManager(ItemDBContext _dbContext) : base(new RoleWiseScreenPermissionRepository(_dbContext))
        {
            _screenPermissionRepository = new RoleWiseScreenPermissionRepository(_dbContext);
        }
    }
}
