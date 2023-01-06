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
    public partial class PageDetail : CarouselPage
    {
        async void GetContentByLesson(int topicID, int lessonID)
        {
            HttpClient httpClient = new HttpClient();
            var content = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetContentByLesson?TopicID=" + topicID.ToString() + "&LessonID=" + lessonID.ToString());
            var contentConverted = JsonConvert.DeserializeObject<List<StudyListVocab>>(content);
            lstContent.ItemsSource = contentConverted;
        }

        public PageDetail()
        {
            InitializeComponent();
        }
        public PageDetail(StudyListLesson lesson)
        {
            InitializeComponent();
            GetContentByLesson(lesson.TopicID, lesson.LessonID);
        }
    }
}