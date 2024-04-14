using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.ComponentModel;
using System.Runtime.CompilerServices;

namespace Lab_04_05.Models
{
    public class Products : INotifyPropertyChanged
    {
        private string title;
        private string imagePath;
        private string category;
        private string description;
        private decimal price;
      
        public uint Id { get; set; }
        public string Title { get { return title; } set { title = value; } }
        public string ImagePath { get { return imagePath; } set { imagePath = value; OnPropertyChanged("ImagePath"); } }

        public decimal Price { get { return price; } set { price = value; OnPropertyChanged("Price"); } }
    
        public string Category { get { return category; } set { category = value; OnPropertyChanged("Description"); } }

        public string Description { get { return description; } set { description = value; OnPropertyChanged("Description"); } }

        public event PropertyChangedEventHandler PropertyChanged;
        public void OnPropertyChanged([CallerMemberName] string prop = "")
        {

            PropertyChanged?.Invoke(this, new PropertyChangedEventArgs(prop));
        }

    }
}
