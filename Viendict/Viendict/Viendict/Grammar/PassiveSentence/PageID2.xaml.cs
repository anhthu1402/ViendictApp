using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.PassiveSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageID2 : ContentPage
    {
        public PageID2()
        {
            InitializeComponent();
        }
        public PageID2(PassiveSentenceTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
        }
    }
}