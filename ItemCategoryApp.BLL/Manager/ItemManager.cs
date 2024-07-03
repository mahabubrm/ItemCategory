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
    public class ItemManager : CommonManager<Item>, IItemManager
    {
        private ItemRepository _itemRepository;
        public ItemManager(ItemDBContext _dbContext) : base(new ItemRepository(_dbContext))
        {
            _itemRepository = new ItemRepository(_dbContext);
        }
    }
}
