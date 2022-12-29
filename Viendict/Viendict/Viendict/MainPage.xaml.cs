using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;

namespace Viendict
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();
        }

        private void Signup_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageSignUp());
        }

        private void Signin_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageSignIn());
        }

        private async void NoAccount_Clicked(object sender, EventArgs e)
        {
            await Application.Current.MainPage.Navigation.PopAsync();
            Application.Current.MainPage = new AppShell();
        }
    }
}
