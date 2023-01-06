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

        public PageStudy()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            GetAllStudyLessonByTopic(topicDefault.TopicID);
        }
        public PageStudy(StudyListTopic topic)
        {
            InitializeComponent();
            GetAllStudyLessonByTopic(topic.TopicID);
        }


        private void cmdChangeTopic_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageTopicStudy());
        }

        private void lstStudyLesson_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstStudyLesson.SelectedItem != null)
            {
                StudyListLesson lesson = (StudyListLesson)lstStudyLesson.SelectedItem;
                Navigation.PushAsync(new PageListStudy(lesson));
            }
        }
    }
}