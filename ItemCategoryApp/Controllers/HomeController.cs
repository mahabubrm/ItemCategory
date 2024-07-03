using ItemCategoryApp.BLL.Interface;
using ItemCategoryApp.Models;
using Microsoft.AspNetCore.Mvc;
using System.Diagnostics;

namespace ItemCategoryApp.Controllers
{
    public class HomeController : Controller
    {
        private readonly ILogger<HomeController> _logger;
        private ICategoryManager _categoryManager;
        private IItemManager _itemManager;

        public HomeController(ILogger<HomeController> logger, IItemManager itemManager, ICategoryManager categoryManager)
        {
            _logger = logger;
            _itemManager = itemManager;
            _categoryManager = categoryManager;
        }

        public IActionResult Index()
        {
            return View();
        }

        public IActionResult Categories()
        {
            var categories = _categoryManager.GetAll();
            return View();
        }

        public IActionResult Items()
        {
            return View();
        }

        [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
        public IActionResult Error()
        {
            return View(new ErrorViewModel { RequestId = Activity.Current?.Id ?? HttpContext.TraceIdentifier });
        }
    }
}
