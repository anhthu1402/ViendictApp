using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.ExclamatorySentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class ExclamatorySentence : ContentPage
    {
        public ExclamatorySentence()
        {
            InitializeComponent();
        }
        public ExclamatorySentence(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
        }
    }
}