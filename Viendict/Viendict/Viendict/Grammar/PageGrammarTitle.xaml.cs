using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;


namespace Viendict.Grammar
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageGrammarTitle : ContentPage
    {
        async void GetAllGrammarTitle()
        {
            HttpClient httpClient = new HttpClient();
            var titles = await httpClient.GetStringAsync("http://192.168.1.85/ViendictAPI/api/GrammarTenseController/GetAllGrammarTitle");
            var titlesConverted = JsonConvert.DeserializeObject<List<GrammarTitle>>(titles);
            lstGrammarTitle.ItemsSource = titlesConverted;
        }
        public PageGrammarTitle()
        {
            InitializeComponent();
            GetAllGrammarTitle();
        }

        private void lstGrammarTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstGrammarTitle.SelectedItem != null)
            {
                GrammarTitle grammarTitle = (GrammarTitle)lstGrammarTitle.SelectedItem;
                switch (grammarTitle.ID)
                {
                    case 1:
                        Navigation.PushAsync(new PageGrammarTense());
                        break;
                    case 2:
                        Navigation.PushAsync(new PagePassiveSentence());
                        break;
                    case 3:
                        Navigation.PushAsync(new PageWishTypes());
                        break;
                }
            }
        }

        private void cmdBack_Clicked(object sender, EventArgs e)
        {
            Navigation.PopModalAsync();
        }
    }
}