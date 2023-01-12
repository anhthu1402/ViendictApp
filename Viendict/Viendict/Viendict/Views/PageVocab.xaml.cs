using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Vocab;
using Viendict.Grammar;
using Android.Widget;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageVocab : ContentPage
    {
        async void GetAllVocabTopic()
        {
            HttpClient httpClient = new HttpClient();
            var topics = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllVocabTopic");
            var topicsConverted = JsonConvert.DeserializeObject<List<ListVocabTopic>>(topics);
            lstVocabTopic.ItemsSource = topicsConverted;
        }
        public PageVocab()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            GetAllVocabTopic();
        }

        private void cmdGrammar_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new NavigationPage(new PageGrammarTitle()));
        }

        private void lstVocabTopic_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstVocabTopic.SelectedItem != null)
            {
                ListVocabTopic topic = (ListVocabTopic)lstVocabTopic.SelectedItem;
                Navigation.PushModalAsync(new NavigationPage(new PageListVocab(topic)));
            }
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