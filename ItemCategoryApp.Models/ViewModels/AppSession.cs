using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ItemCategoryApp.Models.ViewModels
{
    public class AppSession
    {
        private string userName;
        private string userFullName;
        private string userEmail;

        public long UserId { get; set; }
        public string UserName { get => userName; set => userName = value; }
        public string UserFullName { get => userFullName; set => userFullName = value; }
        public int RoleId { get; set; }
        public bool IsActive { get; set; }
        public string UserEmail { get => userEmail; set => userEmail = value; }
        public string? ProfilePic { set; get; }
    }
}
