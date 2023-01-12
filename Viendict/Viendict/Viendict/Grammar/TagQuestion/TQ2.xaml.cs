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
    public partial class TQ2 : ContentPage
    {
        public TQ2()
        {
            InitializeComponent();
        }
        public TQ2(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
        }
    }
}