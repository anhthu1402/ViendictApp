using System;
using System.Collections.Generic;
using System.Text;

namespace Viendict.WordDetail
{
    public class WordAPI
    {
        public string word { get; set; }
        public List<Phonetics> phonetics { get; set; }
        public List<Meanings> meanings { get; set; }
    }
}
