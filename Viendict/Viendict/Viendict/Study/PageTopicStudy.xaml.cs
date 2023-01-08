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
        List<StudyListLesson> studyListLessons;
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
        async void GetAllStudyLessonByTopic(int topicID)
        {
            studyListLessons = new List<StudyListLesson>();
            HttpClient httpClient = new HttpClient();
            var lesson = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllStudyLessonByTopic?TopicID=" + topicID.ToString());
            var lessonConverted = JsonConvert.DeserializeObject<List<StudyListLesson>>(lesson);
            studyListLessons = lessonConverted;
        }
        private void lstTopicStudy_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstTopicStudy.SelectedItem != null)
            {
                StudyListTopic topic = (StudyListTopic)lstTopicStudy.SelectedItem;
                PageStudy pageStudy = new PageStudy();
                MessagingCenter.Send<PageStudy, int>(pageStudy, "Update Topic", topic.TopicID);
                Navigation.PopModalAsync();
            }
        }
    }
}