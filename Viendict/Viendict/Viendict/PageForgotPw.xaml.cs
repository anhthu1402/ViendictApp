using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net.Mail;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using System.Net.Http;
using Newtonsoft.Json;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageForgotPw : ContentPage
    {
        public PageForgotPw()
        {
            InitializeComponent();
        }
        private string RandomString()
        {
            StringBuilder sb = new StringBuilder();
            char c;
            Random rand = new Random();
            for (int i = 0; i < 8; i++)
            {
                c = Convert.ToChar(Convert.ToInt32(rand.Next(65, 87)));
                sb.Append(c);
            }
            return sb.ToString();
        }
        private async void cmdResetPassword_Clicked(object sender, EventArgs e)
        {
            bool agree = await DisplayAlert("Thông báo", "Bạn có chắc chắn muốn đặt lại mật khẩu không?", "Có", "Không");
            if (agree)
            {
                HttpClient http = new HttpClient();
                var sql = await http.GetStringAsync
                    ("http://viendictapi.somee.com/api/AppController/GetUserByEmail?Email=" +
                    email.Text);
                var user = JsonConvert.DeserializeObject<UserAccount>(sql);

                if (user.UserID <= 0)
                {
                    await DisplayAlert("Thông báo", "Email này chưa đăng ký tài khoản!", "Ok");
                    return;
                }
                PageForgotPw p = new PageForgotPw();
                string newpw = p.RandomString();

                user.Password = newpw;
                string jsonuser = JsonConvert.SerializeObject(user);
                StringContent httpcontent = new StringContent(jsonuser, Encoding.UTF8, "application/json");
                HttpClient http2 = new HttpClient();
                await http2.PostAsync("http://viendictapi.somee.com/api/AppController/ChangePassword", httpcontent);

                MailMessage mail = new MailMessage();
                SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");

                mail.From = new MailAddress("ie307viendict@gmail.com");
                mail.To.Add(email.Text);
                mail.Subject = "[Viendict] - Yêu cầu đổi mật khẩu";
                mail.Body = "Mật khẩu mới của bạn là " + newpw;

                smtpServer.Port = 587;
                smtpServer.Host = "smtp.gmail.com";
                smtpServer.EnableSsl = true;
                smtpServer.UseDefaultCredentials = false;
                smtpServer.Credentials = new System.Net.NetworkCredential("ie307viendict@gmail.com", "hpdhmjegpownndbj");

                smtpServer.Send(mail);
                await DisplayAlert("Thông báo", "Mật khẩu mới đã được gửi đến email của bạn.", "Ok");
                await Navigation.PopModalAsync();
            }

        }

        private void cmdBack_Clicked(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }
    }
}