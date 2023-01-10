using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebAPI.Database
{
    public class LessonLearnt
    {
        public int TopicID { get; set; }
        public int LessonID { get; set; }
        public int UserID { get; set; }
        public string Learnt { get; set; }
    }
}