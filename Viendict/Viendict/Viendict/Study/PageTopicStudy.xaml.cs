using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Study
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTopicStudy : ContentPage
    {
        void ListStudyTopics()
        {
            List<StudyListTopic> lstTopic = new List<StudyListTopic>();
            lstTopic.Add(new StudyListTopic { TopicID = 1, Name = "900 từ vựng luyện IELTS", Img = "ielts900", TotalLessons = 50 });
            lstTopic.Add(new StudyListTopic { TopicID = 2, Name = "600 từ vựng TOEIC", Img = "toeic600", TotalLessons = 50 });
            lstTopic.Add(new StudyListTopic { TopicID = 3, Name = "1000 từ vựng TOEFL", Img = "toefl1000", TotalLessons = 50 });
            lstTopic.Add(new StudyListTopic { TopicID = 4, Name = "900 từ vựng luyện thi SAT", Img = "sat900", TotalLessons = 59 });
            lstTopicStudy.ItemsSource = lstTopic;
        }
        public PageTopicStudy()
        {
            InitializeComponent();
            ListStudyTopics();
        }
    }
}