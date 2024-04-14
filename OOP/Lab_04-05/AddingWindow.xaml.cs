using Lab_04_05.Models;
using Lab_04_05;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Shapes;
using System.IO;

namespace Lab_04_05
{
    /// <summary>
    /// Логика взаимодействия для AddingWindow.xaml
    /// </summary>
    public partial class AddingWindow : Window
    {
        private string imgFolderPath = @"D:\fourth_semester\university\OOP\Новая папка (2)\Lab_04-05\Lab_04-05\img\";
        public AddingWindow()
        {
            InitializeComponent();

        }

        public void NewElementCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            uint maxId = 0;

            var Tovarr = new Products();
            var list = MainWindow.Tovars.GetTovars();
            if (list != null)
                foreach (var t in list)
                {
                    if (t.Id > maxId)
                    {
                        maxId = t.Id;
                    }
                }
            try
            {
                Tovarr.Id = maxId + 1;

                Tovarr.Title = TitleFiled.Text;
                Tovarr.ImagePath = System.IO.Path.Combine(imgFolderPath, ImageFiled.Text);
                Tovarr.Category = CategoryFiled.Text;
                Tovarr.Price = decimal.Parse(PriceFiled.Text);
                Tovarr.Description = DescriptFiled.Text;
             
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            MainWindow.Tovars.AddItem(Tovarr);

            MainWindow.story.Add(new ObservableCollection<Products>(MainWindow.Tovars.GetTovars()));
            MainWindow.count++;

            this.Close();
        }

    }
}
