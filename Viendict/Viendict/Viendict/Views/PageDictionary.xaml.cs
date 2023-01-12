using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict.Views
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageDictionary : ContentPage
    {
        public PageDictionary()
        {
            InitializeComponent();
            Shell.SetNavBarIsVisible(this, false);
        }

        private void changeLang_Clicked(object sender, EventArgs e)
        {
            if (InputLang.Text == "Tiếng Việt")
            {
                InputLang.Text = "Tiếng Anh";
                OutputLang.Text = "Tiếng Việt";
            }
            else
            {
                OutputLang.Text = "Tiếng Anh";
                InputLang.Text = "Tiếng Việt";
            }
            var temp = txtInput.Text;
            txtInput.Text = txtOutput.Text;
            txtOutput.Text = temp;
        }

        private static string TranslateText(string input, string from, string to)
        {
            var fromLanguage = from;
            var toLanguage = to;
            if(fromLanguage== "Tiếng Việt")
            {
                string url = String.Format("https://translate.googleapis.com/translate_a/single?client=gtx&sl={0}&tl={1}&dt=t&q={2}", "vi", "en", Uri.EscapeUriString(input));
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

        private async void cmdTrans_Clicked(object sender, EventArgs e)
        {
            if(txtInput.Text=="")
            {
                await DisplayAlert("Thông báo", "Vui lòng nhập từ để tra", "Ok");
            }
            else
                txtOutput.Text = TranslateText(txtInput.Text, InputLang.Text, OutputLang.Text);
        }

        private void cmdSearch_Clicked(object sender, EventArgs e)
        {
            Navigation.PushModalAsync(new PageSearch());
        }

        private void cmdDelete_Clicked(object sender, EventArgs e)
        {
            txtInput.Text = "";
        }

        int count = 0;
        protected override bool OnBackButtonPressed()
        {
            count++;
            if (count < 2)
                Toast.MakeText(Android.App.Application.Context, "Nhấn lần nữa để thoát ứng dụng", ToastLength.Short).Show();
            if (count == 2)
            {
                count = 0;
                return base.OnBackButtonPressed();
            }
            return true;
        }
    }
}