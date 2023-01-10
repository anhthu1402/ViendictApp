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
    public partial class PageListStudy : ContentPage
    {
        LessonLearnt Learnt = new LessonLearnt();
        async void GetContentByLesson(int topicID, int lessonID)
        {
            HttpClient httpClient = new HttpClient();
            var lesson_content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetContentByLesson?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString());
            var lesson_contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(lesson_content);
            LstStudy.ItemsSource = lesson_contentConverted;
        }

        public PageListStudy()
        {
            InitializeComponent();
        }
        public PageListStudy(LessonLearnt learnt)
        {
            InitializeComponent();
            GetContentByLesson(learnt.TopicID, learnt.LessonID);
            this.Title = learnt.Name;
            Learnt = learnt;
        }

        protected override bool OnBackButtonPressed()
        {
            PageStudy pageStudy = new PageStudy();
            MessagingCenter.Send<PageStudy, int>(pageStudy, "Update Lessons' status", Learnt.TopicID);
            Navigation.PopModalAsync();
            return true;
        }

        private void Study_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PgeDetailLesson(Learnt, 1));
        }
    }
}