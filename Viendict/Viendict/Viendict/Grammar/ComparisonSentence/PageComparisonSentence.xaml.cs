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
            titles.Add(new Title { ID = 2, Name = "So sánh hơn", Describe = "So sánh hơn kém, so sánh hơn kém không dùng 'than'" });
            titles.Add(new Title { ID = 3, Name = "So sánh hơn nhất", Describe = "Cách dùng, các công thức liên quan" });
            titles.Add(new Title { ID = 4, Name = "So sánh kép", Describe = "Cách dùng, một số lưu ý" });
            titles.Add(new Title { ID = 5, Name = "So sánh hơn gấp nhiều lần", Describe = "So sánh hơn gấp nhiều lần, công thức, ví dụ, lưu ý" });
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

        }
    }
}