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
    public partial class PageAccount : ContentPage
    {
        public PageAccount()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
        }

        private void cmdEditProfile_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageEditAcc());
        }

        private void cmdChangePw_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageChangePw());
        }

        private void cmdSignout_Clicked(object sender, EventArgs e)
        {

        }
    }
}