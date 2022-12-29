using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Study;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageStudy : ContentPage
    {
        void ListStudyLesson()
        {
            List<StudyListLesson> lstLesson = new List<StudyListLesson>();
            lstLesson.Add(new StudyListLesson { ID = 1, Name = "Health problems", IDTopic = 1 });
            lstLesson.Add(new StudyListLesson { ID = 2, Name = "Academic subjects", IDTopic = 1 });
            lstLesson.Add(new StudyListLesson { ID = 3, Name = "Travel and adventure", IDTopic = 1 });
            lstLesson.Add(new StudyListLesson { ID = 4, Name = "Dimensions", IDTopic = 1 });
            lstLesson.Add(new StudyListLesson { ID = 5, Name = "City life", IDTopic = 1 });
            lstStudyLesson.ItemsSource = lstLesson;
        }
        public PageStudy()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
            ListStudyLesson();
        }

        private void cmdChangeTopic_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageTopicStudy());
        }
    }
}