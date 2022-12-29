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
    public partial class PageWishTypes : ContentPage
    {
        async void GetAllWishTypes()
        {
            HttpClient httpClient = new HttpClient();
            var types = await httpClient.GetStringAsync("http://192.168.1.85/ViendictAPI/api/GrammarTenseController/GetAllWishTypes");
            var typesConverted = JsonConvert.DeserializeObject<List<WishType>>(types);
            lstWishTypes.ItemsSource = typesConverted;
        }
        public PageWishTypes()
        {
            InitializeComponent();
            GetAllWishTypes();
        }

        private void lstWishTypes_ItemTapped(object sender, ItemTappedEventArgs e)
        {

        }
    }
}