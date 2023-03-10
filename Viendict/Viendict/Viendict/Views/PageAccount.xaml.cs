using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageAccount : ContentPage
    {
        public PageAccount()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            if (UserAccount.user.UserID > 0)
            {
                UserName.Text = UserAccount.user.UserLoginName;
                IsUser.IsVisible = true;
                IsGuest.IsVisible = false;
            }
            else
            {
                IsUser.IsVisible = false;
                IsGuest.IsVisible = true;
            }
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            if (UserAccount.user.UserID > 0)
                UserName.Text = UserAccount.user.UserLoginName;
        }

        private void cmdEditProfile_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageEditAcc());
        }

        private void cmdChangePw_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageChangePw());
        }

        private async void cmdSignout_Clicked(object sender, EventArgs e)
        {
            bool ans = await DisplayAlert("Thông báo", $"{UserAccount.user.UserLoginName}, bạn có chắc chắn muốn đăng xuất không?", "Có", "Không");
            if (ans)
            {
                await Application.Current.MainPage.Navigation.PopToRootAsync();
                Application.Current.MainPage = new MainPage();
            }
        }

        private void cmdSignup_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignUp();
        }

        private void cmdSignin_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignIn();
        }

        int count = 0;
        protected override bool OnBackButtonPressed()
        {
            count++;
            if (count < 2)
                Toast.MakeText(Android.App.Application.Context, "Nhấn lần nữa để thoát ứng dụng", ToastLength.Short).Show();
            if (count == 2)
            {
                count = 0;
                return base.OnBackButtonPressed();
            }
            return true;
        }
    }
}