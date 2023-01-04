using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.WishSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageWishSentenceContent : ContentPage
    {
        async void GetWishSentence(int ID)
        {
            HttpClient httpClient = new HttpClient();
            var content = await httpClient.GetStringAsync("http://192.168.1.8/ViendictAPI/api/AppController/GetWishSentence?ID=" + ID.ToString());
            var contentConverted = JsonConvert.DeserializeObject<List<GrammarTenseContent>>(content);
            lstWishSentenceContent.ItemsSource = contentConverted;
        }
        public PageWishSentenceContent()
        {
            InitializeComponent();
        }
        public PageWishSentenceContent(WishType type)
        {
            InitializeComponent();
            this.Title = type.Name;
            GetWishSentence(type.ID);
        }
    }
}