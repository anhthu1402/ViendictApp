using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;

namespace Viendict.Grammar.ComparisonSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageComparisonSentence : ContentPage
    {
        List<Title> titles;
        void InitializeTitle()
        {
            titles = new List<Title>();
            titles.Add(new Title { ID = 1, Name = "So sánh bằng, so sánh bội số", Describe = "So sánh bằng, so sánh bội số" });
            titles.Add(new Title { ID = 2, Name = "So sánh hơn", Describe = "So sánh hơn kém, ..." });
            titles.Add(new Title { ID = 3, Name = "So sánh hơn nhất", Describe = "Cách dùng, các công thức liên quan" });
        }
        public PageComparisonSentence()
        {
            InitializeComponent();
        }
        public PageComparisonSentence(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
            InitializeTitle();
            lstComparisonTitle.ItemsSource = titles;
        }

        private void lstComparisonTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if(lstComparisonTitle.SelectedItem!=null)
            {
                Title title = (Title)lstComparisonTitle.SelectedItem;
                switch(title.ID)
                {
                    case 1:
                        Navigation.PushAsync(new PageID1(title));
                        break;
                    case 2:
                        Navigation.PushAsync(new PageID2(title));
                        break;
                    default:
                        Navigation.PushAsync(new PageID3(title));
                        break;
                }
            }
        }
    }
}