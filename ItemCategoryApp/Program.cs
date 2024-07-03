using ItemCategoryApp.BLL.Interface;
using ItemCategoryApp.BLL.Manager;
using ItemCategoryApp.Models;
using Microsoft.AspNetCore.Authentication.Cookies;
using Microsoft.EntityFrameworkCore;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddControllersWithViews();

builder.Services.AddDbContext<ItemDBContext>(options => options.UseSqlServer(builder.Configuration.GetConnectionString("DbConnectionString")));

builder.Services.AddTransient<ICategoryManager, CategoryManager>();
builder.Services.AddTransient<IApplicationUserManager, ApplicationUserManager>();
builder.Services.AddTransient<IUserRoleManager, UserRoleManager>();
builder.Services.AddTransient<IItemManager, ItemManager>();
builder.Services.AddTransient<IScreenManager, ScreenManager>();
builder.Services.AddTransient<IRoleWiseScreenManager, RoleWiseScreenManager>();

builder.Services.AddMvc(options => options.EnableEndpointRouting = false);
builder.Services.AddControllersWithViews();
builder.Services.AddRazorPages();

builder.Services.AddAuthentication(CookieAuthenticationDefaults.AuthenticationScheme)
            .AddCookie(options =>
            {
                options.LoginPath = "/Login/Index";

            });


var app = builder.Build();

// Configure the HTTP request pipeline.
if (!app.Environment.IsDevelopment())
{
    app.UseExceptionHandler("/Home/Error");
}
app.UseStaticFiles();

app.UseRouting();

app.UseAuthorization();

app.MapControllerRoute(
    name: "default",
    pattern: "{controller=Login}/{action=Index}/{id?}");

app.Run();
