using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;

namespace Viendict.Grammar.TagQuestion
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTagQuestion : ContentPage
    {
        List<Title> titles;
        void InitializeTitle()
        {
            titles = new List<Title>();
            titles.Add(new Title { ID = 1, Name = "Công thức", Describe = "Tổng hợp công thức câu hỏi đuôi" });
            titles.Add(new Title { ID = 2, Name = "Các dạng đặc biệt", Describe = "Các công thức dạng đặc biệt của câu hỏi đuôi" });
        }
        public PageTagQuestion()
        {
            InitializeComponent();
        }
        public PageTagQuestion(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
            InitializeTitle();
            lstTagQues.ItemsSource = titles;
        }

        private void lstTagQues_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstTagQues.SelectedItem != null)
            {
                Title title = (Title)lstTagQues.SelectedItem;
                switch (title.ID)
                {
                    case 1:
                        Navigation.PushAsync(new TQ1(title));
                        break;
                    default:
                        _ = Navigation.PushAsync(new TQ2(title));
                        break;
                }
            }
        }
    }
}