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
        string Word;
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
        async void IsInFavorite(string Word)
        {
            HttpClient httpClient = new HttpClient();
            var lstword = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListFavorite");
            var lstwordConverted = JsonConvert.DeserializeObject<List<Favorite>>(lstword);
            foreach (Favorite favorite in lstwordConverted)
            {
                if (favorite.Word == Word)
                {
                    AddToFavorite.Source = "FavouriteRed.png";
                }
            }
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
            IsInFavorite(toSearch);
            Word = toSearch;
        }

        private async void AddToFavorite_Clicked(object sender, EventArgs e)
        {
            ImageButton imageButton = (ImageButton)sender;
            Favorite favorite = new Favorite { Word = Word };
            //if (imageButton.Source.ToString() == "FavouriteBlack.png")
            //{
                AddToFavorite.Source = "FavouriteRed.png";
                HttpClient http = new HttpClient();
                string jsonFav = JsonConvert.SerializeObject(favorite);
                StringContent httpcontent = new StringContent(jsonFav, Encoding.Default, "application/json");
                HttpResponseMessage kq = await http.PostAsync("http://viendictapi.somee.com/api/AppController/AddToFavorite", httpcontent);
                var kqtb = await kq.Content.ReadAsStringAsync();
                if(int.Parse(kqtb.ToString())>0)
                {
                    await DisplayAlert("", "Đã thêm " + Word + " vào mục yêu thích", "OK");
                }
            //}
        }

        private void cmdSearch_Clicked(object sender, EventArgs e)
        {
            Navigation.PushAsync(new PageSearch());
        }
    }
}