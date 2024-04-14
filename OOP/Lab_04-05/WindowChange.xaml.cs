using System;
using System.Collections.Generic;
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
using Lab_04_05.Models;
using Lab_04_05;
using System.Collections.ObjectModel;

namespace Lab_04_05
{
    /// <summary>
    /// Логика взаимодействия для WindowChange.xaml
    /// </summary>
    public partial class ChangeWindow : Window
    {
        public uint tovId { get; set; }
        private string imgFolderPath = @"D:\fourth_semester\university\OOP\Новая папка (2)\Lab_04-05\Lab_04-05\img\";

        public ChangeWindow(uint Id) : this()
        {
            InitializeComponent();
            tovId = Id;
            InitForm();
        }

        public ChangeWindow()
        {
        }

        private void InitForm()
        {
            Products tov = MainWindow.Tovars.GetItemById(tovId);
            TitleFiled.Text = tov.Title;
            CategoryFiled.Text = tov.Category;
            DescriptFiled.Text = tov.Description;
            ImageFiled.Text = tov.ImagePath;
            PriceFiled.Text = tov.Price.ToString();
        }
        public void ChangeElementCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            var canNullablePhone = MainWindow.Tovars.GetItemById(tovId);
            if (canNullablePhone == null) return;

            var tov = canNullablePhone;
            tov.Title = TitleFiled.Text;
            tov.Category = CategoryFiled.Text;
            tov.Description = DescriptFiled.Text;
            tov.ImagePath = System.IO.Path.Combine(imgFolderPath, ImageFiled.Text);
            tov.Price = decimal.Parse(PriceFiled.Text);


            MainWindow.Tovars.LocalCommit();
            MainWindow.Tovars.CommitData();
            MainWindow.story.Add(new ObservableCollection<Products>(MainWindow.Tovars.GetTovars()));
            MainWindow.count++;
            this.Close();
        }

    }
}
