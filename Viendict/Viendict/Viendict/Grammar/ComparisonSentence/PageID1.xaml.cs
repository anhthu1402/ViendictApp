using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;

namespace Viendict.Grammar.ComparisonSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageID1 : ContentPage
    {
        public PageID1()
        {
            InitializeComponent();
        }
        public PageID1(Title title) 
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}