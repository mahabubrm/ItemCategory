using EF.Core.Repository.Interface.Repository;
using ItemCategoryApp.Models.Entities;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.DAL.Interface
{
    public interface IRoleWiseScreenPermissionRepository : ICommonRepository<RoleWiseScreenPermission>
    {
    }
}
