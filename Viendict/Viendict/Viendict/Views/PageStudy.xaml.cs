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
using Android.Widget;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageStudy : ContentPage
    {
        public StudyListTopic topicDefault = new StudyListTopic { TopicID = 1 };
        async void GetStudyTopicByTopicID(int topicID)
        {
            HttpClient httpClient = new HttpClient();
            var topic = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetStudyTopicByTopicID?TopicID=" + topicID.ToString());
            var topicConverted = JsonConvert.DeserializeObject<List<StudyListTopic>>(topic);
            lstStudyTopic.ItemsSource = topicConverted;
        }

        async void GetListLessonLearntByUserID( int userID, int topicID)
        {
            HttpClient httpClient = new HttpClient();
            var learnt = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListLessonLearntByUserID?userID=" + userID.ToString() + "&topicID=" + topicID.ToString());
            var learntConverted = JsonConvert.DeserializeObject<List<LessonLearnt>>(learnt);
            lstStudyLesson.ItemsSource = learntConverted;
        }
        public PageStudy()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            if (UserAccount.user.UserID > 0)
            {
                IsUser.IsVisible = true;
                IsGuest.IsVisible = false;
                GetListLessonLearntByUserID(UserAccount.user.UserID, topicDefault.TopicID);
                GetStudyTopicByTopicID(topicDefault.TopicID);
            }
            else
            {
                IsUser.IsVisible = false;
                IsGuest.IsVisible = true;
                this.BackgroundImageSource = "";
                this.BackgroundColor = Color.AliceBlue;
            }
        }
        public PageStudy(StudyListTopic topic)
        {
            InitializeComponent();
            GetListLessonLearntByUserID(UserAccount.user.UserID, topic.TopicID);
            GetStudyTopicByTopicID(topicDefault.TopicID);
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            MessagingCenter.Subscribe<PageStudy, int>(this, "Update Topic", (sender, arg) =>
            {
                GetListLessonLearntByUserID(UserAccount.user.UserID, arg);
                GetStudyTopicByTopicID(arg);
            });
            MessagingCenter.Subscribe<PageStudy, int>(this, "Update Lessons' status", (sender, arg) =>
            {
                GetListLessonLearntByUserID(UserAccount.user.UserID, arg);
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
                LessonLearnt lesson = (LessonLearnt)lstStudyLesson.SelectedItem;
                Navigation.PushModalAsync(new NavigationPage(new PageListStudy(lesson)));
            }
        }

        private void cmdSignup_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignUp();
        }

        private void cmdSignin_Clicked(object sender, EventArgs e)
        {
            Application.Current.MainPage.Navigation.PopToRootAsync();
            Application.Current.MainPage = new PageSignIn();
        }
        int count = 0;
        protected override bool OnBackButtonPressed()
        {
            count++;
            if (count < 2)
                Toast.MakeText(Android.App.Application.Context, "Nhấn lần nữa để thoát ứng dụng", ToastLength.Short).Show();
            if (count == 2)
            {
                count = 0;
                return base.OnBackButtonPressed();
            }
            return true;
        }
    }
}