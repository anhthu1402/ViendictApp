using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Database
{
    public class UserAccount
    {
        public int UserID { get; set; }
        public string UserLoginName { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }
    }
}