using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models.Entities
{
    [Table("RoleWiseScreenPermission")]
    public class RoleWiseScreenPermission
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int SL { get; set; }
        public int RoleId { get; set; }
        public string ScreenCode { get; set; }
        public string AccessRightCode { get; set; }
        public Nullable<bool> IsCreate { get; set; }
        public Nullable<bool> IsRead { get; set; }
        public Nullable<bool> IsUpdate { get; set; }
        public Nullable<bool> IsDelete { get; set; }
        public System.DateTime EntryDate { get; set; }
        public string EntryUser { get; set; }
    }
}
