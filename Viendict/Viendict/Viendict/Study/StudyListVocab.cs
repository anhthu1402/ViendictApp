using System;
using System.Collections.Generic;
using System.Text;

namespace Viendict.Study
{
    public class StudyListVocab
    {
        public int ID { get; set; }
        public string Word { get; set; }
        public string IPA { get; set; }
        public string Type { get; set; }
        public string Meaning { get; set; }
        public string EnExample { get; set; }
        public string ViExample { get; set; }
        public int LessonID { get; set; }
    }
}
