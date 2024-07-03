using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models.Entities
{
    [Table("ApplicationUser")]
    public class ApplicationUser
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long UserId { get; set; }
        public string? UserName { get; set; }
        public string? UserFullName { get; set; }
        public string? Password { get; set; }
        public string? PasswordSalt { get; set; }
        public string? EmployeeID { get; set; }
        public int RoleId { get; set; }
        public bool IsActive { get; set; }
        public bool IsLockedOut { get; set; }
        public string? Email { get; set; }
        public string? ContactNo { get; set; }
        public System.DateTime SetDate { get; set; }
        public string? EntryUserName { get; set; }
        //public virtual UserRole? UserRole { get; set; }
    }
}
