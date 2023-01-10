using System;
using System.Collections.Generic;
using System.Text;

namespace Viendict
{
    public class LessonLearnt
    {
        public int TopicID { get; set; }
        public int LessonID { get; set; }
        public int UserID { get; set; }
        public string Learnt { get; set; }
        public string Name { get; set; }
        public int TotalWords { get; set; }
    }
}
