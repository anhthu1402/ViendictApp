using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.ConditionalSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageID5 : ContentPage
    {
        public PageID5()
        {
            InitializeComponent();
        }
        public PageID5(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}