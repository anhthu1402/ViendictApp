using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Study;
using System.Net.Http;
using Newtonsoft.Json;
using Viendict.Vocab;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageStudy : ContentPage
    {
        public StudyListTopic topicDefault = new StudyListTopic { TopicID = 1 };
        async void GetAllStudyLessonByTopic(int topicID)
        {

            HttpClient httpClient = new HttpClient();
            var lesson = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllStudyLessonByTopic?TopicID=" + topicID.ToString());
            var lessonConverted = JsonConvert.DeserializeObject<List<StudyListLesson>>(lesson);
            lstStudyLesson.ItemsSource = lessonConverted;
        }
        async void GetStudyTopicByTopicID(int topicID)
        {
            HttpClient httpClient = new HttpClient();
            var topic = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetStudyTopicByTopicID?TopicID=" + topicID.ToString());
            var topicConverted = JsonConvert.DeserializeObject<List<StudyListTopic>>(topic);
            lstStudyTopic.ItemsSource = topicConverted;
        }
        public PageStudy()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            GetAllStudyLessonByTopic(topicDefault.TopicID);
            GetStudyTopicByTopicID(topicDefault.TopicID);
        }
        public PageStudy(StudyListTopic topic)
        {
            InitializeComponent();
            GetAllStudyLessonByTopic(topic.TopicID);
            GetStudyTopicByTopicID(topicDefault.TopicID);
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            MessagingCenter.Subscribe<PageStudy, int>(this, "Hi", (sender, arg) =>
            {
                GetAllStudyLessonByTopic(arg);
                GetStudyTopicByTopicID(arg);
            });
        }

        private void cmdChangeTopic_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new NavigationPage(new PageTopicStudy()));
        }

        private void lstStudyLesson_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstStudyLesson.SelectedItem != null)
            {
                StudyListLesson lesson = (StudyListLesson)lstStudyLesson.SelectedItem;
                Navigation.PushModalAsync(new NavigationPage(new PageListStudy(lesson)));
            }
        }
    }
}