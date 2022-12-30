using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.Reported_Speech
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageReportedSpeech : ContentPage
    {
        public PageReportedSpeech()
        {
            InitializeComponent();
        }
        public PageReportedSpeech(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
        }
    }
}