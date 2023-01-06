using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using System.Net.Http;
using Newtonsoft.Json;
using Viendict.Vocab;
using Viendict.Views;

namespace Viendict.Study
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTopicStudy : ContentPage
    {
        async void GetAllStudyTopic()
        {
            HttpClient httpClient = new HttpClient();
            var topics = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllStudyTopic");
            var topicsConverted = JsonConvert.DeserializeObject<List<StudyListTopic>>(topics);
            lstTopicStudy.ItemsSource = topicsConverted;
        }

        public PageTopicStudy()
        {
            InitializeComponent();
            GetAllStudyTopic();
        }

        private void lstTopicStudy_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstTopicStudy.SelectedItem != null)
            {
                StudyListTopic topic = (StudyListTopic)lstTopicStudy.SelectedItem;
                
            }
        }
    }
}