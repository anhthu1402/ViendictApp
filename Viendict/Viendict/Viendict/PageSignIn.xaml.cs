using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
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
            Navigation.PushModalAsync(new PageForgotPw());
        }

        private async void cmdSignin_Clicked(object sender, EventArgs e)
        {
            HttpClient http = new HttpClient();
            var kq = await http.GetStringAsync
                ("http://192.168.1.8/ViendictAPI/api/AppController/UserSignin?Email=" +
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
            Navigation.PopModalAsync();
        }
    }
}