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
    public partial class PageDetail : CarouselPage
    {
        async void GetContentByLesson(int topicID, int lessonID)
        {
            HttpClient httpClient = new HttpClient();
            var topic_content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetContentByLesson?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString());
            var topic_contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(topic_content);
        }
        public PageDetail()
        {
            InitializeComponent();
        }
        public PageDetail(StudyListVocab lesson)
        {
            InitializeComponent();
            GetContentByLesson(lesson.TopicID, lesson.LessonID);
            this.Title = "Lesson" + lesson.ToString();
        }

    }
}