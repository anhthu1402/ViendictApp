using System;
using System.Collections.Generic;
using System.Text;

namespace Viendict.Study
{
    public class StudyListLesson
    {
        public int LessonID { get; set; }
        public string Name { get; set; }
        public int TopicID { get; set; }
        public string Learnt { get; set; }
        public int TotalWords { get; set; }
    }
}
