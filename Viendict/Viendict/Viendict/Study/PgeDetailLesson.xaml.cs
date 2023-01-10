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
        LessonLearnt Learnt;
        async void GetDetailContentLessonByID(int topicID, int lessonID, int id)
        {
            HttpClient httpClient = new HttpClient();
            var content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetDetailContentLessonByID?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString() + "&ID=" + id.ToString());
            var contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(content);
            lstcontent.ItemsSource = contentConverted;
        }
        async void UpdateLessonLearnt(int topicID, int lessonID, int userID)
        {
            HttpClient httpClient = new HttpClient();
            var json = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/UpdateLessonLearnt?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString() + "&UserID=" + userID.ToString());
            var jsonConverted = JsonConvert.DeserializeObject<List<LessonLearnt>>(json);
        }

        public PgeDetailLesson()
        {
            InitializeComponent();
        }
        public PgeDetailLesson(LessonLearnt learnt, int index)
        {
            InitializeComponent();
            GetDetailContentLessonByID(learnt.TopicID, learnt.LessonID, index);
            Learnt = learnt;
            count = index + 1;
            this.Title = "Bài " + learnt.LessonID;
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
            GetDetailContentLessonByID(Learnt.TopicID, Learnt.LessonID, count);
            
            if(count> Learnt.TotalWords)
            {
                if(Learnt.Learnt=="Chưa hoàn thành")
                {
                    await DisplayAlert("Tuyệt vời", "Bạn vừa học xong tất cả các từ của Bài " + Learnt.LessonID, "OK");
                    UpdateLessonLearnt(Learnt.TopicID, Learnt.LessonID, UserAccount.user.UserID);
                }
                else
                {
                    await DisplayAlert("Tuyệt vời", "Bạn vừa hoàn thành luyện tập Bài " + Learnt.LessonID + ". Hãy quay lại để luyện tập nhiều hơn nhé!", "OK");
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
                progressBar.Progress = (count-1) * (1.0/ Learnt.TotalWords);
            }
        }
    }
}