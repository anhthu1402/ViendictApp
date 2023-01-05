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
        async void GetListFavorite()
        {
            HttpClient httpClient = new HttpClient();
            var lstword = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListFavorite");
            var lstwordConverted = JsonConvert.DeserializeObject<List<Favorite>>(lstword);
            lstFavorite.ItemsSource = lstwordConverted;
        }
        public int tapHeartCount = 0;
        public int tapSpeakerCount = 0;
        public PageFavorite()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            GetListFavorite();
        }

        private void TurnOnSpeaker_Tapped(object sender, EventArgs e)
        {
            tapSpeakerCount++;
            var imageSender = (Image)sender;
            imageSender.Source = (tapSpeakerCount % 2 == 0) ? "speakeroff.png" : "speakeron.png";
        }

        private void RemoveFromFavourite_Tapped(object sender, EventArgs e)
        {
            tapHeartCount++;
            var imageSender = (Image)sender;
            imageSender.Source = (tapHeartCount % 2 == 0) ? "FavouriteRed.png" : "FavouriteBlack.png";
        }

        private void lstFavorite_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if(lstFavorite.SelectedItem!=null)
            {
                Favorite fv = (Favorite)lstFavorite.SelectedItem;
                Navigation.PushAsync(new PageWordDetail(fv.Word));
            }
        }
    }
}