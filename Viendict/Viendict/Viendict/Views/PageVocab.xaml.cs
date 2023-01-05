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
                Navigation.PushAsync(new PageListVocab(topic));
            }
        }
    }
}