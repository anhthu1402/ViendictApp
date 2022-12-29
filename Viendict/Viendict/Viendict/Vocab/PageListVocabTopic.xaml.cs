using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Vocab
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageListVocabTopic : ContentPage
    {
        async void GetAllVocabTopic()
        {
            HttpClient httpClient = new HttpClient();
            var topics = await httpClient.GetStringAsync("http://192.168.1.85/ViendictAPI/api/GrammarTenseController/GetAllVocabTopic");
            var topicsConverted = JsonConvert.DeserializeObject<List<ListVocabTopic>>(topics);
            lstVocabTopic.ItemsSource = topicsConverted;
        }
        public PageListVocabTopic()
        {
            InitializeComponent();
            GetAllVocabTopic();
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