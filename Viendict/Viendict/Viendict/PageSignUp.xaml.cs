using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Viendict;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSignUp : ContentPage
    {
        public PageSignUp()
        {
            InitializeComponent();
            if (UserAccount.user.UserID > 0)
            {
                userloginname.Text = UserAccount.user.UserLoginName;
                useremail.Text = UserAccount.user.Email;
            }
        }
        private async void cmdSignup_Clicked(object sender, EventArgs e)
        {
            if (useremail.Text != "" && useremail.Text != null && useremail.Text.ToLower().Contains('@') && userpassword.Text.Length >= 8)
            {
                UserAccount user = new UserAccount { UserLoginName = userloginname.Text, Password = userpassword.Text, Email = useremail.Text };
                HttpClient http = new HttpClient();
                string jsonuser = JsonConvert.SerializeObject(user);
                StringContent httpcontent = new StringContent(jsonuser, Encoding.UTF8, "application/json");
                HttpResponseMessage kq = await http.PostAsync("http://viendictapi.somee.com/api/AppController/UserSignup", httpcontent);
                var kqtb = await kq.Content.ReadAsStringAsync();
                user = JsonConvert.DeserializeObject<UserAccount>(kqtb);
                if (user.UserID > 0)
                {
                    await DisplayAlert("", "Chào mừng " + user.UserLoginName + " đến với Viendict!", "Ok");
                    var login = await http.GetStringAsync
                    ("http://viendictapi.somee.com/api/AppController/UserSignin?Email=" +
                    user.Email + "&&Password=" + user.Password);
                    var userlogin = JsonConvert.DeserializeObject<UserAccount>(login);
                    UserAccount.user = userlogin;
                    Application.Current.MainPage = new AppShell();
                }
                else
                    await DisplayAlert("Thông báo", "Tên đăng nhập hoặc email đã tồn tại!", "Ok");
            }
            else if (useremail.Text == "" || useremail.Text == null || useremail.Text.ToLower().Contains('@') == false)
            {
                await DisplayAlert("Thông báo", "Email chưa nhập hoặc chưa đúng định dạng!", "Ok");
            }
            else await DisplayAlert("Thông báo", "Mật khẩu phải chứa ít nhất 8 kí tự!", "Ok");
        }

        private void cmdBack_Clicked(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }
    }
}