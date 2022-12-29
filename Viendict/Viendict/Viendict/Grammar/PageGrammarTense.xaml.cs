﻿using Newtonsoft.Json;
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
    public partial class PageGrammarTense : ContentPage
    {
        async void GetAllGrammarTenses()
        {
            HttpClient httpClient = new HttpClient();
            var tenses = await httpClient.GetStringAsync("http://192.168.1.85/ViendictAPI/api/GrammarTenseController/GetAllGrammarTenses");
            var tensesConverted = JsonConvert.DeserializeObject<List<GrammarTenseTitle>>(tenses);
            lstGrammarTenseTitle.ItemsSource = tensesConverted;
        }
        public PageGrammarTense()
        {
            InitializeComponent();
            GetAllGrammarTenses();
        }

        private void lstGrammarTenseTitle_ItemTapped(object sender, ItemTappedEventArgs e)
        {
            if (lstGrammarTenseTitle.SelectedItem != null)
            {
                GrammarTenseTitle tenseTitle = (GrammarTenseTitle)lstGrammarTenseTitle.SelectedItem;
                Navigation.PushAsync(new PageGrammarTenseContent(tenseTitle));
            }
        }
    }
}