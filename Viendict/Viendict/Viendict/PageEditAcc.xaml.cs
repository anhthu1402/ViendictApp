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
    public partial class PageEditAcc : ContentPage
    {
        public PageEditAcc()
        {
            InitializeComponent();
            if (UserAccount.user.UserID > 0)
            {
                userloginname.Text = UserAccount.user.UserLoginName;
                useremail.Text = UserAccount.user.Email;
			}
        }

        private async void cmdSubmit_Clicked(object sender, EventArgs e)
        {
			if (UserAccount.user.UserID > 0)
            {
				if (userloginname.Text == "" || useremail.Text == "")
				{
					await DisplayAlert("Thông báo", "Vui lòng nhập đầy đủ các trường trên.", "Ok");
					return;
				}
				if(useremail.Text.ToLower().Contains('@') == false)
                {
					await DisplayAlert("Thông báo", "Email đã nhập chưa đúng định dạng", "Ok");
					return;
                }
				UserAccount.user.UserLoginName = userloginname.Text;
				UserAccount.user.Email = useremail.Text;
				HttpClient http = new HttpClient();
				string jsonuser = JsonConvert.SerializeObject(UserAccount.user);
				StringContent httpcontent = new StringContent(jsonuser, Encoding.UTF8, "application/json");
				HttpResponseMessage kq;
				kq = await http.PostAsync("http://viendictapi.somee.com/api/AppController/UpdateAccount", httpcontent);
				var result = await kq.Content.ReadAsStringAsync();
				if (int.Parse(result.ToString()) > 0)
				{
					await DisplayAlert("Thông báo", "Cập nhật thành công", "Ok");
					await Navigation.PopModalAsync();
				}
				else
					await DisplayAlert("Thông báo", "Đã xảy ra lỗi, vui lòng thử lại!", "Ok");
			}
		}
    }
}