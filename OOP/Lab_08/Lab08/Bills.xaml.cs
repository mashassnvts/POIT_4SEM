using Microsoft.Win32;
using System;
using System.Collections.Generic;
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
    /// Interaction logic for Planet.xaml
    /// </summary>
    public partial class Bills : Window
    {
        public string path;
        string script = "";
        string connectionString;
        SqlConnection connection;
        public Bills()
        {
            InitializeComponent();
            connectionString = MainWindow.connectionString;
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

                    File.Copy(filePath, projectPath + "/images/" + path, true);

                    // imgDynamic.Source = new BitmapImage(new Uri(projectPath + "/images/" + path));
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
            script = "INSERT INTO BILLS (ID_BILL, NUMBER_BILL, BALANCE_BILL, TYPE_BILL) VALUES(@Id, @Number, @Balance, @Type)";

            try
            {
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    if (string.IsNullOrEmpty(Id.Text) || string.IsNullOrEmpty(Number.Text) || string.IsNullOrEmpty(Balance.Text) || string.IsNullOrEmpty(Type.Text)){
                        MessageBox.Show("Заполните все поля");
                        return;
                    }

                    SqlCommand command = new SqlCommand(script, connection);
                    SqlParameter idParam = new SqlParameter("@Id", Id.Text);
                    SqlParameter numParam = new SqlParameter("@Number", Number.Text);
                    SqlParameter balanceParam = new SqlParameter("@Balance", Balance.Text);
                    SqlParameter typeParam = new SqlParameter("@Type", Type.Text);
                    command.Parameters.Add(idParam);
                    command.Parameters.Add(numParam);
                    command.Parameters.Add(balanceParam);
                    command.Parameters.Add(typeParam);
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

        private void Id_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Id.Text;

            if (newText.Length > 10 || !IsNumeric(e.Text))
            {
                e.Handled = true;
            }
        }
        private bool IsNumeric(string text)
        {
            return int.TryParse(text, out _);
        }

        private void Number_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Number.Text;

            if (newText.Length > 16 || !IsNumeric(e.Text))
            {
                e.Handled = true;
            }
        }

        private void Balance_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Balance.Text;

            if (!(Char.IsDigit(e.Text, 0) || (e.Text == ".")
            && (!newText.Contains(".")
            && newText.Length != 0)) || newText.Length > 16)
            {
                e.Handled = true;
                return;
            }
            if (newText.Contains(".") && newText.Split('.').Length == 2)
            {
                string decimalPart = newText.Split('.')[1];
                /*if (decimalPart.Length > 1)
                {
                    e.Handled = true;
                    return;
                }*/
            }
        }

        private void Type_PreviewTextInput(object sender, TextCompositionEventArgs e)
        {
            string newText = Type.Text;
            if (!Char.IsLetter(e.Text, 0) || newText.Length > 20)
            {
                e.Handled = true;
                return;
            }
        }
    }
}
