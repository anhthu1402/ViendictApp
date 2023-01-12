using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;

namespace Viendict.Grammar.RelativeClause
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class RC1 : ContentPage
    {
        public RC1()
        {
            InitializeComponent();
        }
        public RC1(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}