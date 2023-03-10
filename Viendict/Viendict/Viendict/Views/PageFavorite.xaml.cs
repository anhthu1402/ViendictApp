using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;
using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.WordDetail;
using Android.Widget;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageFavorite : ContentPage
    {
        public async void GetListFavorite()
        {
            if (UserAccount.user.UserID > 0)
            {
                HttpClient httpClient = new HttpClient();
                var lstword = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListFavorite?UserID=" + UserAccount.user.UserID.ToString());
                var lstwordConverted = JsonConvert.DeserializeObject<List<Favorite>>(lstword);
                lstFavorite.ItemsSource = lstwordConverted;
            }
        }

        public PageFavorite()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            if (UserAccount.user.UserID > 0)
            {
                IsUser.IsVisible = true;
                IsGuest.IsVisible = false;
                GetListFavorite();
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
            GetListFavorite();
        }

        private void lstFavorite_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if(lstFavorite.SelectedItem!=null)
            {
                Favorite fv = (Favorite)lstFavorite.SelectedItem;
                Navigation.PushAsync(new PageWordDetail(fv.Word));
            }
        }

        private async void RemoveFromFavourite_Clicked(object sender, EventArgs e)
        {
            Xamarin.Forms.ImageButton rm = (Xamarin.Forms.ImageButton)sender;
            Favorite word = rm.CommandParameter as Favorite;
            HttpClient http = new HttpClient();
            string jsonword = JsonConvert.SerializeObject(word);
            StringContent httpcontent = new StringContent(jsonword, Encoding.UTF8, "application/json");
            await http.PostAsync("http://viendictapi.somee.com/api/AppController/DeleteFromFavorite", httpcontent);

            OnAppearing();
        }

        private void cmdSignin_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignIn();
        }

        private void cmdSignup_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignUp();
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