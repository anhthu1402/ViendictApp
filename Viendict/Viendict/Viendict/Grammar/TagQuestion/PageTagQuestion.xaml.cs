using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.TagQuestion
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTagQuestion : ContentPage
    {
        public PageTagQuestion()
        {
            InitializeComponent();
        }
        public PageTagQuestion(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
        }
    }
}