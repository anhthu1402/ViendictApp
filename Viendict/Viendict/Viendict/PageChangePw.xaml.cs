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
    public partial class PageChangePw : ContentPage
    {
        public PageChangePw()
        {
            InitializeComponent();
        }

        private async void cmdSubmit_Clicked(object sender, EventArgs e)
        {
			if (UserAccount.user.UserID > 0)
			{
				if (currentpassword.Text == "" || newpassword.Text == "" || confirm_newpassword.Text == "")
				{
					await DisplayAlert("Thông Báo", "Vui lòng nhập đầy đủ các trường trên.", "Ok");
					return;
				}
				if (currentpassword.Text != UserAccount.user.Password)
                {
					await DisplayAlert("Thông Báo", "Mật khẩu cũ chưa chính xác!", "Ok");
					return;
				}
				if(newpassword.Text.Length < 8)
                {
					await DisplayAlert("Thông báo", "Mật khẩu phải chứa ít nhất tám kí tự.", "Ok");
					return;
                }
				if (newpassword.Text != confirm_newpassword.Text)
                {
					await DisplayAlert("Thông Báo", "Mật khẩu xác nhận lại chưa khớp!", "Ok");
					return;
				}
				UserAccount.user.Password = newpassword.Text;
				HttpClient http = new HttpClient();
				string jsonuser = JsonConvert.SerializeObject(UserAccount.user);
				StringContent httpcontent = new StringContent(jsonuser, Encoding.UTF8, "application/json");
				HttpResponseMessage kq;
				kq = await http.PostAsync("http://viendictapi.somee.com/api/AppController/ChangePassword", httpcontent);
				var result = await kq.Content.ReadAsStringAsync();
				if (int.Parse(result.ToString()) > 0)
				{
					await DisplayAlert("Thông báo", "Đổi mật khẩu thành công", "Ok");
					await Navigation.PopModalAsync();
				}
				else
					await DisplayAlert("Thông báo", "Đã xảy ra lỗi, vui lòng thử lại!", "Ok");
			}
		}
    }
}