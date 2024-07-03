using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models.Entities
{
    [Table("UserRole")]
    public class UserRole
    {
        public UserRole()
        {
            //this.ApplicationUsers = new HashSet<ApplicationUser>();
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int RoleID { get; set; }
        public string? RoleName { get; set; }
        public string? RoleFlag { get; set; }
        public string? RoleDescription { get; set; }
        public DateTime SetDate { get; set; }
        public string? UserName { get; set; }
        //public virtual ICollection<ApplicationUser> ApplicationUsers { get; set; }
    }
}
