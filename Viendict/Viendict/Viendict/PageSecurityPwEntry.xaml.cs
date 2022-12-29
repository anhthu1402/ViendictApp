﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

using Xamarin.Forms;
using Xamarin.Forms.Xaml;

namespace Viendict
{
    [XamlCompilation(XamlCompilationOptions.Compile)]
    public partial class PageSecurityPwEntry : ContentView
    {
        public PageSecurityPwEntry()
        {
            InitializeComponent();
        }

        private void show_hide_Clicked(object sender, EventArgs e)
        {
            var imageButton = sender as ImageButton;
            if (password.IsPassword)
            {
                imageButton.Source = ImageSource.FromFile("eyeon.png");
                password.IsPassword = false;
            }
            else
            {
                imageButton.Source = ImageSource.FromFile("eyeoff.png");
                password.IsPassword = true;
            }
        }
    }
}