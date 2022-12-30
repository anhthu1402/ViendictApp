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
    public partial class PageID4 : ContentPage
    {
        public PageID4()
        {
            InitializeComponent();
        }
        public PageID4(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}