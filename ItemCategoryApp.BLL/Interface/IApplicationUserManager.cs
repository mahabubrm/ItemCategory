using EF.Core.Repository.Interface.Manager;
using ItemCategoryApp.Models.Entities;
using ItemCategoryApp.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.BLL.Interface
{
    public interface IApplicationUserManager : ICommonManager<ApplicationUser>
    {
        ReturnMessage ValidateUserLogin(UserLogin login, out AppSession userSession);
    }
}
