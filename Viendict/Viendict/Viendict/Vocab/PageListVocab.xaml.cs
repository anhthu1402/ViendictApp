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

namespace Viendict.Vocab
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageListVocab : ContentPage
    {
        async void GetVocabByTopic(int topicID)
        {
            HttpClient httpClient = new HttpClient();
            var topic_content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetVocabByTopic?TopicID=" + topicID.ToString());
            var topic_contentConverted = JsonConvert.DeserializeObject<List<ListVocab>>(topic_content);
            lstWord.ItemsSource = topic_contentConverted;
        }
        public PageListVocab()
        {
            InitializeComponent();
        }

        public PageListVocab(ListVocabTopic topic)
        {
            InitializeComponent();
            GetVocabByTopic(topic.TopicID);
            this.Title = topic.Name;
        }

        private void lstWord_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if(lstWord.SelectedItem!=null)
            {
                ListVocab vocab = (ListVocab)lstWord.SelectedItem;
                Navigation.PushAsync(new PageWordDetail(vocab.Word));
            }
        }
    }
}