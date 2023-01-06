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
        async void GetAllStudyLessonByTopic(int topicID)
        {

            HttpClient httpClient = new HttpClient();
            var lesson = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllStudyLessonByTopic?TopicID=" + topicID.ToString());
            var lessonConverted = JsonConvert.DeserializeObject<List<StudyListLesson>>(lesson);
            lstStudyLesson.ItemsSource = lessonConverted;
        }

        //void ListStudyLesson()
        //{
        //    List<StudyListLesson> lstLesson = new List<StudyListLesson>();
        //    lstLesson.Add(new StudyListLesson { LessonID = 1, Name = "Health problems", TopicID = 1 });
        //    lstLesson.Add(new StudyListLesson { LessonID = 2, Name = "Academic subjects", TopicID = 1 });
        //    lstLesson.Add(new StudyListLesson { LessonID = 3, Name = "Travel and adventure", TopicID = 1 });
        //    lstLesson.Add(new StudyListLesson { LessonID = 4, Name = "Dimensions", TopicID = 1 });
        //    lstLesson.Add(new StudyListLesson { LessonID = 5, Name = "City life", TopicID = 1 });
        //    lstStudyLesson.ItemsSource = lstLesson;
        //}
        public PageStudy()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
        }
        public PageStudy(StudyListTopic topic)
        {
            InitializeComponent();
            GetAllStudyLessonByTopic(topic.TopicID);
            this.Title = topic.Name;
        }


        private void cmdChangeTopic_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageTopicStudy());
        }

        private void lstStudyLesson_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstStudyLesson.SelectedItem != null)
            {
                StudyListVocab lesson = (StudyListVocab)lstStudyLesson.SelectedItem;
                Navigation.PushAsync(new PageListStudy(lesson));
            }
        }
    }
}