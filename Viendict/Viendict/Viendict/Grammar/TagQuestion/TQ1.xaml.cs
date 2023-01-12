using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;


namespace Viendict.Grammar.TagQuestion
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class TQ1 : ContentPage
    {
        public TQ1()
        {
            InitializeComponent();
        }
            public TQ1(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}