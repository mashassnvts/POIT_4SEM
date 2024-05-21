using Microsoft.Win32;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
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

namespace Lab08
{
    /// <summary>
    /// Interaction logic for Owner.xaml
    /// </summary>
    public partial class Owners : Window
    {
        public string path; 
        string script = "";
        string connectionString;
        SqlConnection connection;
        SqlCommand command;
        SqlDataAdapter adapter1;
        public Owners()
        {
            InitializeComponent();
            connectionString = MainWindow.connectionString;
        }
        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            try
            {
                List<string> bills = new List<string>();
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();

                    string sqlExpression = "SELECT NUMBER_BILL FROM BILLS";
                    command = new SqlCommand(sqlExpression, connection);
                    adapter1 = new SqlDataAdapter(command);
                    using (SqlDataReader reader = command.ExecuteReader())
                    {
                        if (reader.HasRows)
                        {
                            while (reader.Read())
                            {
                                object name = reader.GetValue(0);
                                bills.Add(name.ToString());
                            }
                        }
                    }
                    Bill.ItemsSource = bills;
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
            finally
            {
                connection.Close();
            }
        }
        private void Button_Click(object sender, RoutedEventArgs e)
        {
            try
            {
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "JPG Files (*.jpg)|*.jpg|JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png";
                if (openFileDialog.ShowDialog() == true)
                {
                    string filePath = openFileDialog.FileName;

                    string[] parts = filePath.Split('\\');

                    path = parts[parts.Length - 1];
                    var projectPath = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;

                    imgDynamic.Source = new BitmapImage(new Uri(projectPath + "/images/" + path));
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }

        }

        private void Button_Click1(object sender, RoutedEventArgs e)
        {
            SqlTransaction tx = null;
            script = "INSERT INTO OWNERS (ID_OWNER, NAME_OWNER, SECOND_NAME_OWNER, NUMBER_BILL, ADRESS_OWNER, PHONE_OWNER, Image) VALUES(@id, @name, @Second_name, @bill, @adress, @phone, @image)";

            try
            {
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    if (string.IsNullOrWhiteSpace(Id.Text) || string.IsNullOrWhiteSpace(Name.Text) ||
                    string.IsNullOrWhiteSpace(Second_name.Text) || string.IsNullOrWhiteSpace(Adress_number.Text) ||
                    string.IsNullOrWhiteSpace(Phone_number.Text) || Bill.SelectedItem == null)
                    {
                        MessageBox.Show("Ошибка: Заполните все поля.");
                        return;
                    }

                    SqlCommand command = new SqlCommand(script, connection);
                    SqlParameter idParam = new SqlParameter("@id", Id.Text);
                    SqlParameter nameParam = new SqlParameter("@name", Name.Text);
                    SqlParameter billParam = new SqlParameter("@bill", Bill.SelectedItem);
                    SqlParameter secondParam = new SqlParameter("@Second_name", Second_name.Text);
                    SqlParameter adressParam = new SqlParameter("@adress", Adress_number.Text);
                    SqlParameter phoneParam = new SqlParameter("@phone", Name.Text);
                    SqlParameter imageParam = new SqlParameter("@image", "E:\\уник\\c\\Lab08\\Lab08\\images\\" + path);
                    command.Parameters.Add(idParam);
                    command.Parameters.Add(nameParam);
                    command.Parameters.Add(secondParam);
                    command.Parameters.Add(adressParam);
                    command.Parameters.Add(billParam);
                    command.Parameters.Add(phoneParam);
                    command.Parameters.Add(imageParam);
                    tx = connection.BeginTransaction();
                    command.Transaction = tx;
                    try
                    {
                        command.ExecuteNonQuery();
                        tx.Commit();
                        Close();
                    }
                    catch (SqlException ex)
                    {
                        if (ex.Number == 2627) // Unique constraint violation error number
                        {
                            MessageBox.Show("Ошибка: Данные с таким идентификатором уже существуют.");
                        }
                        else
                        {
                            MessageBox.Show("Ошибка: " + ex.Message);
                        }
                        tx.Rollback();
                    }
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
                tx.Rollback();
            }
        }

        private bool IsNumeric(string text)
        {
            return int.TryParse(text, out _);
        }

        private bool IsValidCharacter(string text)
        {
            foreach (char c in text)
            {
                if (!char.IsLetter(c) && c != '-')
                {
                    return false;
                }
            }
            return true;
        }

        private void Id_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Id.Text;

            if (newText.Length > 10 || !IsNumeric(e.Text))
            {
                e.Handled = true;
            }
        }

        private void Name_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Name.Text;
            if (!IsValidCharacter(e.Text) && newText.Length > 30)
            {
                e.Handled = true;
            }
        }

        private void Second_name_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Second_name.Text;
            if (!IsValidCharacter(e.Text) && newText.Length > 30)
            {
                e.Handled = true;
            }
        }

        private void Phone_number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Phone_number.Text;
            if (!IsNumeric(e.Text) && newText.Length > 12)
            {
                e.Handled = true;
            }
        }
    }
}
