﻿using Newtonsoft.Json;
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
    public partial class PageListStudy : ContentPage
    {
        StudyListLesson Lesson = new StudyListLesson();
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
        public PageListStudy(StudyListLesson lesson)
        {
            InitializeComponent();
            GetContentByLesson(lesson.TopicID, lesson.LessonID);
            this.Title = "Lesson " + lesson.LessonID;
            Lesson = lesson;
        }

        private void Study_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageDetail(Lesson));
        }
    }
}