using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;
using System.Net.Http;
using Newtonsoft.Json;

namespace Viendict.Grammar
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageGrammarTenseContent : ContentPage
    {
        async void GetGrammarTenseByTenseID(int tenseID)
        {
            HttpClient httpClient = new HttpClient();
            var tense_content = await httpClient.GetStringAsync("http://192.168.1.85/ViendictAPI/api/AppController/GetGrammarTenseByTenseID?TenseID=" + tenseID.ToString());
            var tense_contentConverted = JsonConvert.DeserializeObject<List<GrammarTenseContent>>(tense_content);
            lstTenseContent.ItemsSource = tense_contentConverted;
        }
        public PageGrammarTenseContent()
        {
            InitializeComponent();
        }
        public PageGrammarTenseContent(GrammarTenseTitle tenseTitle)
        {
            InitializeComponent();
            GetGrammarTenseByTenseID(tenseTitle.TenseID);
            this.Title = tenseTitle.Name;
        }
    }
}