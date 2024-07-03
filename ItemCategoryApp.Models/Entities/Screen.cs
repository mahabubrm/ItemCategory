using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models.Entities
{
    [Table("Screen")]
    public class Screen
    {
        [Key]
        public string ScreenCode { get; set; }
        public string ScreenName { get; set; }
        public string ModuleId { get; set; }
        public byte Scope { get; set; }
        public string URL { get; set; }
        public string ParentScreenCode { get; set; }
        public string Description { get; set; }
        public bool IsRequiredForApproval { get; set; }
        public bool IsFinancialScreen { get; set; }
        public Nullable<bool> IsEmailNotificationSend { get; set; }
        public string Manager { get; set; }
        public string MenuIcon { get; set; }
        public System.DateTime SetDate { get; set; }
        public string UserName { get; set; }
    }
}
