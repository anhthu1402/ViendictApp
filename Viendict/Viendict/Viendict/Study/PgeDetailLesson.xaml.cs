using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Study
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PgeDetailLesson : ContentPage
    {
        int count = 0;
        StudyListLesson Lesson;
        async void GetDetailContentLessonByID(int topicID, int lessonID, int id)
        {
            HttpClient httpClient = new HttpClient();
            var content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetDetailContentLessonByID?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString() + "&ID=" + id.ToString());
            var contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(content);
            lstcontent.ItemsSource = contentConverted;
        }

        public PgeDetailLesson()
        {
            InitializeComponent();
        }
        public PgeDetailLesson(StudyListLesson lesson, int index)
        {
            InitializeComponent();
            GetDetailContentLessonByID(lesson.TopicID, lesson.LessonID, index);
            Lesson = lesson;
            count = index+1;
        }

        private async void cmdNextPage_Clicked(object sender, EventArgs e)
        {
            GetDetailContentLessonByID(Lesson.TopicID, Lesson.LessonID, count);
            
            if(count>Lesson.TotalWords)
            {
                await DisplayAlert("Tuyệt vời", "Bạn đã hoàn thành Bài " + Lesson.LessonID, "OK");
                await Navigation.PopAsync();
            }
            count++;
        }

        private void progressBar_PropertyChanging(object sender, PropertyChangingEventArgs e)
        {
            ProgressBar progressBar = (ProgressBar)sender;
            if(count==2)
            {
                progressBar.Progress = 0;
            }
            else
            {
                progressBar.Progress = (count-1) * (1.0/Lesson.TotalWords);
            }
        }
    }
}