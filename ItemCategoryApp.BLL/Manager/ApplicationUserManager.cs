using EF.Core.Repository.Manager;
using ItemCategoryApp.BLL.Interface;
using ItemCategoryApp.DAL.Repository;
using ItemCategoryApp.Models;
using ItemCategoryApp.Models.Entities;
using ItemCategoryApp.Models.ViewModels;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.BLL.Manager
{
    public class ApplicationUserManager : CommonManager<ApplicationUser>, IApplicationUserManager
    {
        private ApplicationUserRepository _applicationUserRepository;
        public ApplicationUserManager(ItemDBContext _dbContext) : base(new ApplicationUserRepository(_dbContext))
        {
            _applicationUserRepository = new ApplicationUserRepository(_dbContext);
        }

        public ReturnMessage ValidateUserLogin(UserLogin login, out AppSession userSession)
        {
            userSession = new AppSession();
            ReturnMessage message;
            message = ReturnMessage.SetSuccessMessage("Valid User");
            try
            {
                var appSession = new AppSession();
                var user = _applicationUserRepository.GetByUserName(login.UserName);

                if (user == null)
                {
                    message = ReturnMessage.SetErrorMessage("Invalid username or password");
                }
                else
                {
                    if (user.Password.Trim() == login.Password.Trim())
                    {
                        if (user.IsActive)
                        {
                            appSession.UserName = !string.IsNullOrEmpty(user.UserName) ? user.UserName : "User Name not found";
                            appSession.RoleId = user.RoleId;
                            appSession.IsActive = user.IsActive;
                            appSession.UserId = user.UserId;
                            appSession.UserFullName = !string.IsNullOrEmpty(user.UserFullName) ? user.UserFullName : "Name not found";
                            appSession.UserEmail = !string.IsNullOrEmpty(user.Email) ? user.Email : "Email not found";
                            //HttpContext.Current.Session[AppSetting.Session] = appSession;
                            message = ReturnMessage.SetSuccessMessage("Success!");
                        }
                        else
                        {
                            message = ReturnMessage.SetErrorMessage("User is Inactive");
                        }
                    }
                    else
                    {
                        message = ReturnMessage.SetErrorMessage("Password not matching");
                    }

                }

            }
            catch (Exception ex)
            {
                message = ReturnMessage.SetErrorMessage();
            }

            return message;
        }

    }
}
