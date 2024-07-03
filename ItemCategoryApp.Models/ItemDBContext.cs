using ItemCategoryApp.Models.Entities;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models
{
    public class ItemDBContext:DbContext
    {
        public ItemDBContext(DbContextOptions<ItemDBContext> options) : base(options)
        {

        }

        public DbSet<Item> Items { get; set; }
        public DbSet<Category> Categories { get; set; }
        public DbSet<ApplicationUser> Users { get; set; }
        public DbSet<UserRole> Roles { get; set; }
        public DbSet<Screen> Screens { get; set; }
        public DbSet<RoleWiseScreenPermission> RoleWiseScreenPermissions { get; set; }
    }
}
