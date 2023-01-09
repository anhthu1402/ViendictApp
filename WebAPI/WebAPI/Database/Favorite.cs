using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Database
{
    public class Favorite
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public string Word { get; set; }
    }
}