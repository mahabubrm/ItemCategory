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
    public class CategoryManager : CommonManager<Category>, ICategoryManager
    {
        private CategoryRepository _cagtegoryRepository;
        public CategoryManager(ItemDBContext _dbContext) : base(new CategoryRepository(_dbContext))
        {
            _cagtegoryRepository = new CategoryRepository(_dbContext);
        }
    }
}
