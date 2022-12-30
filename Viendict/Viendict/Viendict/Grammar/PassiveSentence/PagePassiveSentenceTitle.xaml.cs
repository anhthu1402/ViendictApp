using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.PassiveSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PagePassiveSentenceTitle : ContentPage
    {
        List<PassiveSentenceTitle> titles;
        void InitializeTitle()
        {
            titles = new List<PassiveSentenceTitle>();
            titles.Add(new PassiveSentenceTitle { ID = 1, Title = "Cấu trúc ngữ pháp", Describe = "Tổng hợp cấu trúc ngữ pháp câu bị động" });
            titles.Add(new PassiveSentenceTitle { ID = 2, Title = "Các trường hợp đặc biệt", Describe = "Các cấu trúc ngữ pháp đặc biệt của câu bị động" });
        }
        public PagePassiveSentenceTitle()
        {
            InitializeComponent();
        }
        public PagePassiveSentenceTitle(GrammarTitle title)
        {
            InitializeComponent();
            InitializeTitle();
            lstPssSentenceTitle.ItemsSource = titles;
            this.Title = title.Title;
        }

        private void lstPssSentenceTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstPssSentenceTitle.SelectedItem != null)
            {
                PassiveSentenceTitle title = (PassiveSentenceTitle)lstPssSentenceTitle.SelectedItem;
                if (title.ID == 1)
                {
                    Navigation.PushAsync(new PageID1(title));
                }
                else
                    Navigation.PushAsync(new PageID2(title));
            }
        }
    }
}