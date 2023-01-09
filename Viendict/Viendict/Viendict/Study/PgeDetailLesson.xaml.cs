using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Views;

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
        async void StudyLessonFinished(int topicID, int lessonID)
        {
            HttpClient httpClient = new HttpClient();
            var json = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/StudyLessonFinished?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString());
            var jsonConverted = JsonConvert.DeserializeObject<List<StudyListLesson>>(json);
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
            count = index + 1;
            this.Title = "Bài " + lesson.LessonID;
        }
        protected override bool OnBackButtonPressed()
        {
            Device.BeginInvokeOnMainThread(async () =>
            {
                var result = await this.DisplayAlert("Thông báo", "Bạn chưa hoàn thành bài học. Bạn có thật sự muốn thoát?", "Thoát", "Không");
                if (result) await Navigation.PopModalAsync();
            });
            return true;
        }

        private async void cmdNextPage_Clicked(object sender, EventArgs e)
        {
            GetDetailContentLessonByID(Lesson.TopicID, Lesson.LessonID, count);
            
            if(count>Lesson.TotalWords)
            {
                if(Lesson.Learnt=="Chưa hoàn thành")
                {
                    await DisplayAlert("Tuyệt vời", "Bạn vừa học xong tất cả các từ của Bài " + Lesson.LessonID, "OK");
                    StudyLessonFinished(Lesson.TopicID, Lesson.LessonID);
                }
                else
                {
                    await DisplayAlert("Tuyệt vời", "Bạn vừa hoàn thành luyện tập Bài " + Lesson.LessonID + ". Hãy quay lại để luyện tập nhiều hơn nhé!", "OK");
                }
                await Navigation.PopModalAsync();
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