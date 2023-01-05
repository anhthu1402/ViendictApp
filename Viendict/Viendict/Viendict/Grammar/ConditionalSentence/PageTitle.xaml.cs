using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.ConditionalSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTitle : ContentPage
    {
        List<Title> titles;
        void InitializeTitle()
        {
            titles = new List<Title>();
            titles.Add(new Title { ID = 1, Name = "Câu điều kiện loại 1", Describe = "Khái niệm, công thức, cách dùng câu điều kiện loại 1" });
            titles.Add(new Title { ID = 2, Name = "Câu điều kiện loại 2", Describe = "Khái niệm, công thức, cách dùng câu điều kiện loại 2" });
            titles.Add(new Title { ID = 3, Name = "Câu điều kiện loại 3", Describe = "Khái niệm, công thức, cách dùng câu điều kiện loại 3" });
            titles.Add(new Title { ID = 4, Name = "Câu điều kiện dạng đảo ngữ", Describe = "Đảo ngữ câu điều kiện loại 1, loại 2, loại 3" });
            titles.Add(new Title { ID = 5, Name = "Câu điều kiện dạng đặc biệt", Describe = "Câu điều kiện hỗn hợp, câu điều kiện với Unless, ..." });
        }
        public PageTitle()
        {
            InitializeComponent();
        }
        public PageTitle(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
            InitializeTitle();
            lstTitle.ItemsSource = titles;
        }

        private void lstTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if(lstTitle.SelectedItem!=null)
            {
                Title title = (Title)lstTitle.SelectedItem;
                if(title.ID==1||title.ID==2||title.ID==3)
                {
                    Navigation.PushAsync(new PageConditionalSentenceType(title));
                }
                else if(title.ID==4)
                {
                    Navigation.PushAsync(new PageID4(title));
                }
                else if(title.ID==5)
                {
                    Navigation.PushAsync(new PageID5(title));
                }
            }
        }
    }
}