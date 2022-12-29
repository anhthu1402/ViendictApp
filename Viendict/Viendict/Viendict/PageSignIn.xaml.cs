using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSignIn : ContentPage
    {
        public PageSignIn()
        {
            InitializeComponent();
        }

        private void ForgotPwd_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageForgotPw());
        }
    }
}