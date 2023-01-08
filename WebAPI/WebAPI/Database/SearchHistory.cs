using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Database
{
    public class SearchHistory
    {
        public int ID { get; set; }
        public int UserID { get; set; }
        public int WordID { get; set; }
        public string Word { get; set; }
    }
}