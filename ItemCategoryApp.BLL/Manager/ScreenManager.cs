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
    public class ScreenManager : CommonManager<Screen>, IScreenManager
    {
        private ScreenRepository _screenRepository;
        public ScreenManager(ItemDBContext _dbContext) : base(new ScreenRepository(_dbContext))
        {
            _screenRepository = new ScreenRepository(_dbContext);
        }
    }
}
