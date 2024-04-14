using Lab_04_05.Models;
using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;

namespace Lab_04_05
{
    /// <summary>
    /// Логика взаимодействия для MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static int count { get; set; } = 0;
        public static ProductsRepository Tovars { get; set; } = new ProductsRepository();//товары
        private ObservableCollection<Products> filter = new ObservableCollection<Products>();//отфильтрованные
        private ObservableCollection<Products> deleted = new ObservableCollection<Products>();//удаленные
        public static List<ObservableCollection<Products>> story { get; set; } = new List<ObservableCollection<Products>>();//для повторения

        public List<string> Langs = new List<string>() { "ru-RU", "en-US" };
        public MainWindow()
        {
            InitializeComponent();

            Tovars.OutputData();
            Tovars.OutputFilter();
            tovarList.ItemsSource = Tovars.GetTovars();
            Filter.ItemsSource = Tovars.GetFilter();
            story.Add(new ObservableCollection<Products>(Tovars.GetTovars()));
            InitLangsBox();

            List<string> styles = new List<string> { "Light", "Dark" };
            StyleBox.SelectionChanged += ThemeChange;
            StyleBox.ItemsSource = styles;
            StyleBox.SelectedItem = "Dark";
        }


        private void Button2_Click(object sender, RoutedEventArgs e)
        {
            Window window = new Window();
            Grid grid = new Grid();

            UserControl2 userControl2 = new UserControl2();
            UserControl3 userControl3 = new UserControl3();

            grid.Children.Add(userControl2);
            grid.Children.Add(userControl3);

            window.Content = grid;
            window.Show();
        }

        private void Button3_Click(object sender, RoutedEventArgs e)
        {
            Window eventWindow = new Window();
           Events events = new Events();
            eventWindow.Content = events;
            eventWindow.Show();

        }

        private void PriceSlider_ValueChanged(object sender, RoutedPropertyChangedEventArgs<double> e)
        {
            // Обновление значений фильтрации цены на основе значения ползунка
            int minValue = (int)PriceSlider.Value;
            int maxValue = (int)PriceSlider.Maximum;
            // Далее используйте minValue и maxValue для фильтрации ваших данных
            // Например, обновите текст в TextBox'ах:
            Text_From.Text = minValue.ToString();
            Text_To.Text = maxValue.ToString();
        }

        private void EnableButton_Click(object sender, RoutedEventArgs e)
        {
            // Выполнить действия при нажатии на кнопку "Enable"
        }

        private void DisableButton_Click(object sender, RoutedEventArgs e)
        {
            // Выполнить действия при нажатии на кнопку "Disable"
        }

        private void ThemeChange(object sender, SelectionChangedEventArgs e)
        {
            string style = StyleBox.SelectedItem as string;
            // определяем путь к файлу ресурсов
            var uri = new Uri("Resources/" + style + "Theme" + ".xaml", UriKind.Relative);
            // загружаем словарь ресурсов
            ResourceDictionary resourceDict = Application.LoadComponent(uri) as ResourceDictionary;
            // очищаем коллекцию ресурсов приложения
            Application.Current.Resources.Clear();
            // добавляем загруженный словарь ресурсов
            Application.Current.Resources.MergedDictionaries.Add(resourceDict);
        }

        private void InitLangsBox()
        {
            LanguageComboBox.ItemsSource = Langs;
        }
        private void SetCursor()
        {

            Cursor customCursor = new Cursor("D:\\fourth_semester\\university\\OOP\\Новая папка (2)\\Lab_04-05\\Lab_04-05\\img\\is2tank.ani");
            this.Cursor = customCursor;
        }

        //добавление
        private void CreateButton_Click(object sender, RoutedEventArgs e)
        {
            var newWindow = new AddingWindow();
            newWindow.Owner = this;
            newWindow.Show();
        }
        private void MainWindow_Loaded(object sender, EventArgs e)
        {
            SetCursor();
        }
        private void Filter_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            //создание коллекции  для хранения отфильтрованных товаров
            filter = new ObservableCollection<Products>();
            foreach (var item in Tovars.GetTovars())
            {
                //получение выбранной категории
                var selectedCategory = Filter.SelectedItem.ToString();
                //если категория товара совпадает с выбранной категорией, добавляем товар в коллекцию filter
                if (selectedCategory == item.Category)
                {
                    filter.Add(item);
                }
            }
            //установка отфильтрованных товаров в качестве источника данных для списка товаров (tovarList)
            tovarList.ItemsSource = filter;
        }

        //сброс фильтра и поиска
        private void Button_Click(object sender, RoutedEventArgs e)
        {//очистика
            Text_From.Text = "";
            Text_To.Text = "";
            tovarList.ItemsSource = Tovars.GetTovars();
        }

        //изменение
        private void Change_button_click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedItem = (Products)tovarList.SelectedItem;
                var newWindow = new ChangeWindow(selectedItem.Id);
                newWindow.Owner = this;
                newWindow.Show();
            }
            catch (Exception er)
            {
                MessageBox.Show("Выберите элемент, который хотите изменить.");
            }
        }

        //удаление
        private void Delete_button_click(object sender, RoutedEventArgs e)
        {
            try
            {
                var selectedItem = (Products)tovarList.SelectedItem;
                Tovars.Deletetover(selectedItem.Id);
                deleted.Add(selectedItem);

                story.Add(new ObservableCollection<Products>(Tovars.GetTovars()));
                count++;
            }
            catch (Exception er)
            {
                MessageBox.Show("Выберите элемент, который хотите удалить.");

            }

        }

        //поиск
        private void Search_button_click(object sender, RoutedEventArgs e)
        {
            string searchString = SearchField.Text;
            Regex regex = new Regex(searchString, RegexOptions.IgnoreCase);
            var filter = new List<Products>();
            foreach (var phone in Tovars.GetTovars())
            {
                if (regex.IsMatch(phone.Title) || regex.IsMatch(phone.Category))
                    filter.Add(phone);
            }
            tovarList.ItemsSource = filter;

        }

        //фильтрация по цене
        public void PriceFilter()
        {
            var list = new List<Products>();
            decimal from, to;
            try
            {
                if (Text_To.Text == "" && Text_From.Text == "")
                {
                    tovarList.ItemsSource = Tovars.GetTovars();

                }
                else
                {
                    foreach (var item in Tovars.GetTovars())
                    {

                        if (Text_To.Text == "")
                        {
                            to = Decimal.MaxValue;
                            if (item.Price >= Convert.ToDecimal(Text_From.Text) && item.Price <= Convert.ToDecimal(to))
                            {
                                list.Add(item);
                            }
                        }
                        else if (Text_From.Text == "")
                        {
                            from = -1;
                            if (item.Price >= Convert.ToDecimal(from) && item.Price <= Convert.ToDecimal(Text_To.Text))
                            {
                                list.Add(item);
                            }
                        }

                        else if (item.Price >= Convert.ToDecimal(Text_From.Text) && item.Price <= Convert.ToDecimal(Text_To.Text))
                        {
                            list.Add(item);
                        }

                    }
                    tovarList.ItemsSource = list;

                }
            }
            catch (Exception er)
            {

            }

        }

        //нижний
        private void Block_from_changed(object sender, TextChangedEventArgs e)
        {
            PriceFilter();
        }

        //верхний
        private void Block_to_changed(object sender, TextChangedEventArgs e)
        {
            PriceFilter();
        }

        //обработчик изменения выбранного языка в комбобоксе
        private void LanguageComboBox_SelectionChanged(object sender, SelectionChangedEventArgs e)
        {
            App.SetLanguageDictionary(this, LanguageComboBox.SelectedItem.ToString());
        }

        //назад
        public void UndoCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            tovarList.ItemsSource = story[--count];

            if (deleted.Count > 0)
                Tovars.AddItem(deleted[0]);
        }
        
        //вперед
        private void RedoCommand_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            tovarList.ItemsSource = story[++count];

        }

        private void Button_Click_1(object sender, RoutedEventArgs e)
        {

        }

    

        private void Exit_Executed(object sender, ExecutedRoutedEventArgs e)
        {
            using (System.IO.StreamWriter writer = new System.IO.StreamWriter("log.txt", true))
            {
                writer.WriteLine("Выход из приложения: " + DateTime.Now.ToShortDateString() + " " +
                DateTime.Now.ToLongTimeString());
                writer.Flush();
            }

            this.Close();
        }

       
        private void Button_Click_2(object sender, RoutedEventArgs e)
        {

        }

        private void Button1_Click(object sender, RoutedEventArgs e)
        {

        }
    }
}
