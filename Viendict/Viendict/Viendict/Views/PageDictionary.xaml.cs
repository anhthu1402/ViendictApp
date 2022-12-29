using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageDictionary : ContentPage
    {
        public PageDictionary()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
        }

        private void changeLang_Clicked(object sender, EventArgs e)
        {
            if (InputLang.Text == "Tiếng Việt")
            {
                InputLang.Text = "Tiếng Anh";
                OutputLang.Text = "Tiếng Việt";
            }
            else
            {
                OutputLang.Text = "Tiếng Anh";
                InputLang.Text = "Tiếng Việt";
            }
        }

        private void cmdTrans_Clicked(object sender, EventArgs e)
        {

        }
    }
}