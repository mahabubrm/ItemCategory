using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace ItemCategoryApp.Models.Entities
{
    [Table("Item")]
    public class Item
    {
        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public int ItemId { get; set; }
        public string ItemName { get; set; }
        public string ItemUnit { get; set; }
        public int ItemQuantity { get; set; }
        public int CategoryId { set; get; }

    }
}
