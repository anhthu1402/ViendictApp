using Android.Widget;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
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