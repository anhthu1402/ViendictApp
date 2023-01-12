using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.ConditionalSentence;

namespace Viendict.Grammar.RelativeClause
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageTitleRC : ContentPage
    {
        List<Title> titles;
        void InitializeTitle()
        {
            titles = new List<Title>();
            titles.Add(new Title { ID = 1, Name = "Đại từ quan hệ, trạng từ quan hệ", Describe = "Đại từ quan hệ Who, Which, Whom,..." });
            titles.Add(new Title { ID = 2, Name = "Rút gọn mệnh đề, lược bỏ đại từ quan hệ", Describe = "Các cách rút gọn mệnh đề, lược bỏ đại từ quan hệ" });
        }
        public PageTitleRC()
        {
            InitializeComponent();
        }
        public PageTitleRC(GrammarTitle title)
        {
            InitializeComponent();
            this.Title = title.Title;
            InitializeTitle();
            lstRCTitle.ItemsSource = titles;
        }

        private void lstRCTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstRCTitle.SelectedItem != null)
            {
                Title title = (Title)lstRCTitle.SelectedItem;
                switch (title.ID)
                {
                    case 1:
                        Navigation.PushAsync(new RC1(title));
                        break;
                    default:
                        Navigation.PushAsync(new RC2(title));
                        break;
                }
            }
        }
    }
}