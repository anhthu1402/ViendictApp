using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using System.Net.Mail;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;

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
            for (int i = 0; i < 12; i++)
            {
                c = Convert.ToChar(Convert.ToInt32(rand.Next(65, 87)));
                sb.Append(c);
            }
            return sb.ToString();
        }
        private void cmdResetPassword_Clicked(object sender, EventArgs e)
        {
            if (email.Text )
            try
            {
                MailMessage mail = new MailMessage();
                SmtpClient smtpServer = new SmtpClient("smtp.gmail.com");
                
                mail.From = new MailAddress("ie307viendict@gmail.com");
                mail.To.Add(email.Text);
                mail.Subject = "[Viendict] - Reset password request";
                PageForgotPw p = new PageForgotPw();
                string newpw = p.RandomString();
                mail.Body = "Your new password is " + newpw;

                smtpServer.Port = 587;
                smtpServer.Host = "smtp.gmail.com";
                smtpServer.EnableSsl = true;
                smtpServer.UseDefaultCredentials = false;
                smtpServer.Credentials = new System.Net.NetworkCredential("ie307viendict@gmail.com", "viendictie307.n11");

                smtpServer.Send(mail);
            }
            catch(Exception ex)
            {
                DisplayAlert("Fail", ex.Message, "Ok");
            }
        }
    }
}