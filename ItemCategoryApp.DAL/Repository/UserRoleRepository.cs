using EF.Core.Repository.Repository;
using ItemCategoryApp.DAL.Interface;
using ItemCategoryApp.Models.Entities;
using ItemCategoryApp.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.DAL.Repository
{
    public class UserRoleRepository : CommonRepository<UserRole>, IUserRoleRepository
    {
        public UserRoleRepository(ItemDBContext dbContext) : base(dbContext)
        {

        }
    }
}
