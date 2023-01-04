using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.WordDetail;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSearch : ContentPage
    {
        public PageSearch()
        {
            InitializeComponent();
        }
        public PageSearch(string word)
        {
            InitializeComponent();
            search.Text = word;
        }

        private void cmdSearch_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageWordDetail(search.Text));
        }

        private void search_TextChanged(object sender, TextChangedEventArgs e)
        {
            SearchBar searchBar = (SearchBar)sender;
            
        }
    }
}