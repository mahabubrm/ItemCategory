using ItemCategoryApp.Models.ViewModels;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using System.Security.Claims;
using ItemCategoryApp.BLL.Interface;

namespace ItemCategoryApp.Controllers
{
    public class LoginController : Controller
    {
        private IApplicationUserManager _userManager;

        public LoginController(IApplicationUserManager userManager)
        {
            _userManager = userManager;
        }
        public IActionResult Index()
        {
            return View();
        }

        [HttpPost]
        public async Task<IActionResult> Authentication(UserLogin userLogin)
        {
            var user = new AppSession();
            var message = _userManager.ValidateUserLogin(userLogin, out user);
            if (message.MessageType == MessageTypes.Success)
            {
                var claims = new List<Claim>
                {
                    new Claim(ClaimTypes.Name.ToString(), !string.IsNullOrEmpty(user.UserFullName)?user.UserFullName:"Name not found"),
                    new Claim(ClaimTypes.Email.ToString(), !string.IsNullOrEmpty(user.UserEmail) ? user.UserEmail : "Email not found"),
                    new Claim(ClaimTypes.Role.ToString(), user.RoleId.ToString()),
                    new Claim("UserId", user.UserId.ToString())
                };
                var claimsIdentity = new ClaimsIdentity(claims, "Login");

                await HttpContext.SignInAsync(CookieAuthenticationDefaults.AuthenticationScheme, new ClaimsPrincipal(claimsIdentity));
                //return Redirect(ReturnUrl == null ? "/Secured" : ReturnUrl);
                //Session["Session"] = user;
                return RedirectToAction("Index", "Home");

            }
            else
            {
                message.MessageType = MessageTypes.Error;
                message.Message = "Not Found.";
                return View();
            }

        }

        public async Task<IActionResult> Logout()
        {
            await HttpContext.SignOutAsync();
            return RedirectToAction("Index", "Login");
        }
    }
}
