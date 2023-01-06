using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net.Http;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Newtonsoft.Json;

namespace Viendict.Study
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageListStudy : ContentPage
    {
        async void GetStudyByLesson(int lessonID)
        {
            HttpClient httpClient = new HttpClient();
            var topic_content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetStudyByLesson?LessonID=" + lessonID.ToString());
            var topic_contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(topic_content);
        }

        public PageListStudy()
        {
            InitializeComponent();
        }
        public PageListStudy(StudyListVocab lesson)
        {
            InitializeComponent();
            GetStudyByLesson(lesson.LessonID);
            this.Title = "Lesson" + lesson.ToString();
        }

        private void Study_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageDetail());
        }
    }
}