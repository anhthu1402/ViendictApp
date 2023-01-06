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

namespace Viendict.Study
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageListLesson : ContentPage
    {
        async void GetAllStudyLessonByTopic(int topicID)
        {
            HttpClient httpClient = new HttpClient();
            var lesson = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetAllStudyLessonByTopic?TopicID=" + topicID.ToString());
            var lessonConverted = JsonConvert.DeserializeObject<List<StudyListLesson>>(lesson);
            lstStudyLesson.ItemsSource = lessonConverted;
        }
        public PageListLesson()
        {
            InitializeComponent();
        }
        public PageListLesson(StudyListTopic topic)
        {
            InitializeComponent();
            GetAllStudyLessonByTopic(topic.TopicID);
            this.Title = topic.Name;
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