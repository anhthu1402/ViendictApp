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
    public partial class PageFavorite : ContentPage
    {
        public int tapHeartCount = 0;
        public int tapSpeakerCount = 0;
        public PageFavorite()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
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
    }
}