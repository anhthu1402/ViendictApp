using Android.Widget;
using MediaManager;
using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Net.Http;
using System.Reflection;
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
        int isFav = 0;
        int IDFav = 0;
        string audio = "";
        private static string TranslateText(string input)
        {
            if(input==null)
            {
                return input;
            }
            else
            {
                string url = String.Format("https://translate.googleapis.com/translate_a/single?client=gtx&sl={0}&tl={1}&dt=t&q={2}", "en", "vi", Uri.EscapeUriString(input));
                System.Net.WebClient webClient = new System.Net.WebClient();
                webClient.Encoding = System.Text.Encoding.UTF8;
                var result = webClient.DownloadString(url);
                try
                {
                    result = result.Substring(4, result.IndexOf("\"", 4, StringComparison.Ordinal) - 4);
                    return result;
                }
                catch (Exception ex)
                {
                    return "error";
                }
            }
        }
        async void GetWordDetail(string Word)
        {
            HttpClient client = new HttpClient();
            var response = await client.GetStringAsync("https://api.dictionaryapi.dev/api/v2/entries/en/" + Word);
            var theWord = JsonConvert.DeserializeObject<List<WordAPI>>(response);
            w = new List<Word>();
            wd = new List<WordDetail>();
            string text = "";
            var ArraytheWord = theWord.ToArray();
            for (int k = 0; k < ArraytheWord.Length; k++)
            {
                var ArrayPhonetics = theWord[k].phonetics.ToArray();
                for (int i = 0; i < ArrayPhonetics.Length; i++)
                {
                    if (theWord[k].phonetics[i].text != null)
                    {
                        text = theWord[k].phonetics[i].text;
                        break;
                    }
                }
                for (int i = 0; i < ArrayPhonetics.Length; i++)
                {
                    if (theWord[k].phonetics[i].audio != null)
                    {
                        audio = theWord[k].phonetics[i].audio;
                        break;
                    }
                }
            }
            w.Add(new Word { word = theWord[0].word, phonetic = text });
            for (int h = 0; h < ArraytheWord.Length; h++)
            {
                var ArrayMeanings = theWord[h].meanings.ToArray();
                string wv = "";
                string PhonecticText = "";
                for (int i = 0; i < ArrayMeanings.Length; i++)
                {
                    var ArrayDefinitions = theWord[h].meanings[i].definitions.ToArray();

                    string PartOfSpeech = "▸ " + TranslateText(theWord[h].meanings[i].partOfSpeech);
                    if (h == 0 && i == 0)
                    {
                        wv = theWord[h].word;
                        PhonecticText = theWord[h].phonetics[0].text;
                    }
                    for (int j = 0; j < ArrayDefinitions.Length; j++)
                    {
                        if (j > 0 || h > 0)
                        {
                            wv = "";
                            PhonecticText = "";
                        }
                        if (j > 0)
                        {
                            PartOfSpeech = "";
                        }
                        wd.Add(new WordDetail { partOfSpeech = PartOfSpeech, definition = TranslateText(theWord[h].meanings[i].definitions[j].definition), enExample = theWord[h].meanings[i].definitions[j].example });
                    }
                }
            }
            BindableLayout.SetItemsSource(Header, w);
            BindableLayout.SetItemsSource(Detail, wd);
        }
        async void IsInFavorite(string Word)
        {
            HttpClient httpClient = new HttpClient();
            var lstword = await httpClient.GetStringAsync("http://viendictapi.somee.com/api/AppController/GetListFavorite?UserID=" + UserAccount.user.UserID.ToString());
            var lstwordConverted = JsonConvert.DeserializeObject<List<Favorite>>(lstword);
            foreach (Favorite favorite in lstwordConverted)
            {
                if (favorite.Word == Word)
                {
                    AddToFavorite.Source = "FavouriteRed.png";
                    isFav = 1;
                    IDFav = favorite.ID;
                }
                else isFav = 0;
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
            Xamarin.Forms.ImageButton rm = (Xamarin.Forms.ImageButton)sender;
            Favorite favorite;
            HttpClient http = new HttpClient();
            string jsonFav;
            StringContent httpcontent;
            if (UserAccount.user.UserID > 0)
            {
                if (isFav == 0)
                {
                    favorite = new Favorite { UserID = UserAccount.user.UserID, Word = Word };
                    AddToFavorite.Source = "FavouriteRed.png";
                    jsonFav = JsonConvert.SerializeObject(favorite);
                    httpcontent = new StringContent(jsonFav, Encoding.Default, "application/json");
                    HttpResponseMessage kq = await http.PostAsync("http://viendictapi.somee.com/api/AppController/AddToFavorite", httpcontent);
                    var kqtb = await kq.Content.ReadAsStringAsync();
                    if (int.Parse(kqtb.ToString()) > 0)
                    {
                        await DisplayAlert("", "Đã thêm " + Word + " vào mục yêu thích", "OK");
                    }
                    isFav = 1;
                }
                else if (isFav == 1)
                {
                    bool ans = await DisplayAlert("Thông báo", $"Bạn có chắc chắn muốn xóa từ {Word} khỏi mục yêu thích?", "Có", "Không");
                    if (ans)
                    {
                        AddToFavorite.Source = "FavouriteBlack.png";
                        favorite = new Favorite { ID = IDFav, UserID = UserAccount.user.UserID, Word = Word };
                        jsonFav = JsonConvert.SerializeObject(favorite);
                        httpcontent = new StringContent(jsonFav, Encoding.UTF8, "application/json");
                        await http.PostAsync("http://viendictapi.somee.com/api/AppController/DeleteFromFavorite", httpcontent);
                        isFav = 0;
                    }
                }
            }

            else await DisplayAlert("Thông báo", "Vui lòng đăng nhập để sử dụng tính năng này!", "Ok");
        }

        private void cmdSearch_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new NavigationPage(new PageSearch()));
        }

        private void TurnOnSpeaker_Clicked(object sender, EventArgs e)
        {
            Device.BeginInvokeOnMainThread(async () =>
            {
                if (audio != "")
                {
                    await CrossMediaManager.Current.Play(audio);
                }
                else await this.DisplayAlert("Thông báo", "Từ này không có bản phát âm trong hệ thống", "OK");
            });
        }
    }
}