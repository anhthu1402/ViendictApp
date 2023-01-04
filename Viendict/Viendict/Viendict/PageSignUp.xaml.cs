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
            UserAccount user = new UserAccount { UserLoginName = userloginname.Text, Password = userpassword.Text, Email = useremail.Text };
            HttpClient http = new HttpClient();
            string jsonuser = JsonConvert.SerializeObject(user);
            StringContent httpcontent = new StringContent(jsonuser, Encoding.UTF8, "application/json");
            HttpResponseMessage kq = await http.PostAsync("http://172.17.22.197/ViendictAPI/api/AppController/UserSignup", httpcontent);
            var kqtb = await kq.Content.ReadAsStringAsync();
            user = JsonConvert.DeserializeObject<UserAccount>(kqtb);
            if (user.UserID > 0)
            {
                await DisplayAlert("", "Chào mừng " + user.UserLoginName + " đến với Viendict!", "Ok");
                await Navigation.PushAsync(new PageSignIn());
            }
            else
                await DisplayAlert("Thông báo", "Tên đăng nhập hoặc email đã tồn tại!", "Ok");
        }
    }
}