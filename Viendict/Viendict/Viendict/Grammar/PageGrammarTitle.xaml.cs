using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using Viendict.Grammar.PassiveSentence;
using Viendict.Grammar.WishSentence;
using Viendict.Grammar.Reported_Speech;
using Viendict.Grammar.ConditionalSentence;
using Viendict.Grammar.ComparisonSentence;


namespace Viendict.Grammar
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageGrammarTitle : ContentPage
    {
        async void GetAllGrammarTitle()
        {
            HttpClient httpClient = new HttpClient();
            var titles = await httpClient.GetStringAsync("http://192.168.1.84/ViendictAPI/api/AppController/GetAllGrammarTitle");
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
                        Navigation.PushAsync(new PageGrammarTense(grammarTitle));
                        break;
                    case 2:
                        Navigation.PushAsync(new PagePassiveSentenceTitle(grammarTitle));
                        break;
                    case 3:
                        Navigation.PushAsync(new PageWishTypes(grammarTitle));
                        break;
                    case 4:
                        Navigation.PushAsync(new PageReportedSpeech(grammarTitle));
                        break;
                    case 5:
                        Navigation.PushAsync(new PageTitle(grammarTitle));
                        break;
                    case 6:
                        Navigation.PushAsync(new PageComparisonSentence(grammarTitle));
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