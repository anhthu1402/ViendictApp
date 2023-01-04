using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Grammar.ConditionalSentence
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageConditionalSentenceType : ContentPage
    {
        async void GetConditionalSentenceTypes(int ID)
        {
            HttpClient httpClient = new HttpClient();
            var content = await httpClient.GetStringAsync("http://192.168.1.8/ViendictAPI/api/AppController/GetConditionalSentenceTypes?ID=" + ID.ToString());
            var contentConverted = JsonConvert.DeserializeObject<List<ConditionalSentenceType>>(content);
            lstContent.ItemsSource = contentConverted;
        }
        public PageConditionalSentenceType()
        {
            InitializeComponent();
        }
        public PageConditionalSentenceType(Title title)
        {
            InitializeComponent();
            this.Title = title.Name;
            GetConditionalSentenceTypes(title.ID);
        }
    }
}