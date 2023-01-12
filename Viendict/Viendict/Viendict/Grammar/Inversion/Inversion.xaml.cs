using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.Inversion
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class Inversion : ContentPage
    {
        public Inversion()
        {
            InitializeComponent();
        }
        public Inversion(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
        }
    }
}