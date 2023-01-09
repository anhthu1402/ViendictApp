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
            UserAccount.user.UserID = 0;
            Application.Current.MainPage = new PageSignUp();
        }

        private void Signin_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage = new PageSignIn();
        }

        private void NoAccount_Clicked(object sender, EventArgs e)
        {
            // await Application.Current.MainPage.Navigation.PopAsync();
            UserAccount.user.UserID = 0; 
            Application.Current.MainPage = new AppShell();
        }
    }
}
