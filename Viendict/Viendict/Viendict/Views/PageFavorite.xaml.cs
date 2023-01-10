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

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageFavorite : ContentPage
    {
        string host = "http://192.168.1.6/ViendictAPI";
        //string host = "http://viendictapi.somee.com";
        public async void GetListFavorite()
        {
            if (UserAccount.user.UserID > 0)
            {
                HttpClient httpClient = new HttpClient();
                var lstword = await httpClient.GetStringAsync(host + "/api/AppController/GetListFavorite?UserID=" + UserAccount.user.UserID.ToString());
                var lstwordConverted = JsonConvert.DeserializeObject<List<Favorite>>(lstword);
                lstFavorite.ItemsSource = lstwordConverted;
            }
        }
        public int tapHeartCount = 0;
        public int tapSpeakerCount = 0;
        public PageFavorite()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            GetListFavorite();
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            GetListFavorite();
        }
        private void TurnOnSpeaker_Tapped(object sender, EventArgs e)
        {
            tapSpeakerCount++;
            var imageSender = (Image)sender;
            imageSender.Source = (tapSpeakerCount % 2 == 0) ? "speakeroff.png" : "speakeron.png";
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
            ImageButton rm = (ImageButton)sender;
            Favorite word = rm.CommandParameter as Favorite;
            HttpClient http = new HttpClient();
            string jsonword = JsonConvert.SerializeObject(word);
            StringContent httpcontent = new StringContent(jsonword, Encoding.UTF8, "application/json");
            await http.PostAsync(host + "/api/AppController/DeleteFromFavorite", httpcontent);

            OnAppearing();
        }
    }
}