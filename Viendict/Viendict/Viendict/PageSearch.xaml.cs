using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.WordDetail;
using System.Net.Http;
using Newtonsoft.Json;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSearch : ContentPage
    {
        public async void GetListHistoryByUserID()
        {
            if (UserAccount.user.UserID > 0)
            {
                HttpClient httpClient = new HttpClient();
                var lstword = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListHistoryByUserID?UserID=" + UserAccount.user.UserID.ToString());
                var jsonlstword = JsonConvert.DeserializeObject<List<SearchHistory>>(lstword);
                lstSearchHistory.ItemsSource = jsonlstword;
                txthistory.IsVisible = true;
            }
            else txthistory.IsVisible = false;
        }
        public PageSearch()
        {
            InitializeComponent();
            GetListHistoryByUserID();
        }
        protected override void OnAppearing()
        {
            base.OnAppearing();
            GetListHistoryByUserID();
        }
        public PageSearch(string word)
        {
            InitializeComponent();
            search.Text = word;
        }

        protected override bool OnBackButtonPressed()
        {
            Application.Current.MainPage.Navigation.PopModalAsync();
            Application.Current.MainPage = new AppShell();
            return true;
        }

        private async void cmdSearch_Clicked(object sender, EventArgs e)
        {
            if (UserAccount.user.UserID > 0)
            {
                SearchHistory word = new SearchHistory { UserID = UserAccount.user.UserID, Word = search.Text };
                HttpClient http = new HttpClient();
                string jsonhistory = JsonConvert.SerializeObject(word);
                StringContent httpcontent = new StringContent(jsonhistory, Encoding.Default, "application/json");
                await http.PostAsync("http://viendictapi.somee.com/api/AppController/AddToHistory", httpcontent);
            }

            await Navigation.PushModalAsync(new NavigationPage(new PageWordDetail(search.Text)));
        }

        private async void cmdDelete_Clicked(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            SearchHistory word = bt.CommandParameter as SearchHistory;
            HttpClient http = new HttpClient();
            string jsonword = JsonConvert.SerializeObject(word);
            StringContent httpcontent = new StringContent(jsonword, Encoding.UTF8, "application/json");
            await http.PostAsync("http://viendictapi.somee.com/api/AppController/DeleteFromHistory", httpcontent);

            OnAppearing();
        }

        private void lstSearchHistory_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstSearchHistory.SelectedItem != null)
            {
                SearchHistory word = (SearchHistory)lstSearchHistory.SelectedItem;
                Navigation.PushModalAsync(new NavigationPage(new PageWordDetail(word.Word)));
            }
        }

        private async void search_SearchButtonPressed(object sender, EventArgs e)
        {
            if (UserAccount.user.UserID > 0)
            {
                SearchHistory word = new SearchHistory { UserID = UserAccount.user.UserID, Word = search.Text };
                HttpClient http = new HttpClient();
                string jsonhistory = JsonConvert.SerializeObject(word);
                StringContent httpcontent = new StringContent(jsonhistory, Encoding.Default, "application/json");
                await http.PostAsync("http://viendictapi.somee.com/api/AppController/AddToHistory", httpcontent);
            }

            await Navigation.PushModalAsync(new NavigationPage(new PageWordDetail(search.Text)));
        }
    }
}