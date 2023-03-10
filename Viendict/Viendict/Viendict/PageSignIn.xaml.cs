//using Android.Widget;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.PlatformConfiguration;
using Xamarin.Forms.Xaml;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSignIn : ContentPage
    {
        public PageSignIn()
        {
            InitializeComponent();
            if (UserAccount.user.UserID > 0)
            {
                useremail.Text = UserAccount.user.Email;
            }
        }
        private void ForgotPwd_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageForgotPw());
        }

        protected override bool OnBackButtonPressed()
        {
            Application.Current.MainPage.Navigation.PopModalAsync();
            Application.Current.MainPage = new MainPage();
            return true;
        }

        private async void cmdSignin_Clicked(object sender, EventArgs e)
        {
            HttpClient http = new HttpClient();
            var kq = await http.GetStringAsync
               ("http://viendictapi.somee.com/api/AppController/UserSignin?Email=" +
                useremail.Text + "&&Password=" + userpassword.Text);
            var user = JsonConvert.DeserializeObject<UserAccount>(kq);
            if (user.Email != "" && user.Email != null)
            {
                UserAccount.user = user;
                Application.Current.MainPage = new AppShell();
            }
            else
                await DisplayAlert("Thông báo", "Email hoặc mật khẩu chưa chính xác!", "Ok");
        }

        private void cmdBack_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopModalAsync();
            Application.Current.MainPage = new MainPage();
        }

        private void show_hide_Clicked(object sender, EventArgs e)
        {
            if (userpassword.IsPassword)
            {
                show_hide.Source = "eyeon.png";
                userpassword.IsPassword = false;
            }
            else
            {
                show_hide.Source = "eyeoff.png";
                userpassword.IsPassword = true;
            }
        }
    }
}