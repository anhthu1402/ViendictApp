using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Http;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.WordDetail
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageWordDetail : ContentPage
    {
        List<Word> w;
        List<WordDetail> wd;
        async void GetWordDetail(string Word)
        {
            HttpClient client = new HttpClient();
            var response = await client.GetStringAsync("https://api.dictionaryapi.dev/api/v2/entries/en/" + Word);
            var theWord = JsonConvert.DeserializeObject<List<WordAPI>>(response);
            w = new List<Word>();
            wd = new List<WordDetail>();
            w.Add(new Word { word = theWord[0].word, phonetic = theWord[0].phonetics[0].text });
            var ArraytheWord = theWord.ToArray();
            for (int h = 0; h < ArraytheWord.Length; h++) 
            {
                var ArrayMeanings = theWord[h].meanings.ToArray();
                string wv = "";
                string PhonecticText = "";
                
                for (int i = 0; i < ArrayMeanings.Length; i++)
                {
                    var ArrayDefinitions = theWord[h].meanings[i].definitions.ToArray();
                    string PartOfSpeech = "▸  " + theWord[h].meanings[i].partOfSpeech;
                    if(h==0&&i==0)
                    {
                        wv = theWord[h].word;
                        PhonecticText = theWord[h].phonetics[0].text;
                    }
                    for (int j = 0; j < ArrayDefinitions.Length; j++)
                    {                        
                        if (j > 0 ||h>0) 
                        {
                            wv = "";
                            PhonecticText = "";
                        }
                        if(j>0)
                        {
                            PartOfSpeech = "";
                        }
                        wd.Add(new WordDetail { partOfSpeech = PartOfSpeech, definition = theWord[h].meanings[i].definitions[j].definition, example = theWord[h].meanings[i].definitions[j].example });
                    }
                }
            }
            BindableLayout.SetItemsSource(Header, w);
            BindableLayout.SetItemsSource(Detail, wd);
        }
        public PageWordDetail()
        {
            InitializeComponent();
        }
        public PageWordDetail(string toSearch)
        {
            InitializeComponent();
            GetWordDetail(toSearch);
            this.Title = toSearch;
        }

        private void AddToFavorite_Clicked(object sender, EventArgs e)
        {

        }

        private void cmdSearch_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageSearch());
        }
    }
}