using EF.Core.Repository.Repository;
using ItemCategoryApp.DAL.Interface;
using ItemCategoryApp.Models;
using ItemCategoryApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.DAL.Repository
{
    public class ApplicationUserRepository : CommonRepository<ApplicationUser>, IApplicationUserRepository
    {
        public ApplicationUserRepository(ItemDBContext dbContext) : base(dbContext)
        {

        }
        public ApplicationUser GetByUserName(string userName)
        {
            return GetFirstOrDefault(o => o.UserName == userName);
        }

    }
}
