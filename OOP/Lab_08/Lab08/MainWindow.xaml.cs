using System;
using System.Configuration;
using System.Data;
using System.Data.OleDb;
using System.Data.Odbc;
using System.Windows;
using System.Data.SqlClient;
using System.IO;
using System.Windows.Input;
using Microsoft.Win32;
using System.Windows.Shapes;
using System.Collections.Generic;
using Path = System.IO.Path;
using System.Windows.Controls;
using System.Windows.Media.Imaging;
using System.Windows.Resources;

namespace Lab08
{
    /// <summary>
    /// Interaction logic for MainWindow.xaml
    /// </summary>
    public partial class MainWindow : Window
    {
        public static string str;
        string script = "";
        public static string connectionString;
        bool connectionChecked = false;
        DataTable billsTable;
        DataTable ownersTable;
        SqlConnection connection;
        SqlCommand command;
        SqlDataAdapter adapter1;
        SqlDataAdapter adapter2;
        public MainWindow()
        {
            InitializeComponent();
            Sort_Bills.Items.Add("Все строки и столбцы");
            Sort_Bills.Items.Add("По Id");
            Sort_Bills.Items.Add("По балансу (возрастанию)");
            Sort_Bills.Items.Add("По балансу (убыванию)");
            Sort_Bills.Items.Add("По типу (возрастанию)");
            Sort_Bills.Items.Add("По типу (убыванию)");

            Sort_Owners.Items.Add("Все строки и столбцы");
            Sort_Owners.Items.Add("По Id");
            Sort_Owners.Items.Add("По имени (возрастанию)");
            Sort_Owners.Items.Add("По имени (убыванию)");
            Sort_Owners.Items.Add("По телефону (возрастанию)");
            Sort_Owners.Items.Add("По телефону (убыванию)");
        }

        private void Window_Loaded(object sender, RoutedEventArgs e)
        {
            if(!connectionChecked)
                CheckConnection();
            try
            {
                connection = new SqlConnection(connectionString);
                connection.Open();

                string sqlExpression = "SELECT * FROM BILLS";
                billsTable = new DataTable();
                command = new SqlCommand(sqlExpression, connection);
                adapter1 = new SqlDataAdapter(command);
                adapter1.Fill(billsTable);
                PlanetsGrid.ItemsSource =billsTable.DefaultView;
                sqlExpression = "SELECT * FROM OWNERS";
                ownersTable = new DataTable();
                command = new SqlCommand(sqlExpression, connection);
                adapter2 = new SqlDataAdapter(command);
                adapter2.Fill(ownersTable);
                SatellitesGrid.ItemsSource = ownersTable.DefaultView;
                StreamResourceInfo sri = Application.GetResourceStream(
                new Uri("pack://application:,,,/images/kiko.cur", UriKind.Absolute));
                Cursor customCursor = new Cursor(sri.Stream);
                this.Cursor = customCursor;

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
        private void CheckConnection()
        {

            using (connection = new SqlConnection("Data Source=DESKTOP-F644G2I;Initial Catalog=BankLab;Integrated Security=True"))
            {
                try
                {
                    connection.Open();
                }
                catch (SqlException)
                {
                    using (connection = new SqlConnection("Data Source=DESKTOP-F644G2I;Integrated Security=True"))
                    {
                        try
                        {
                            connection.Open();
                            var projectPath = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
                            string createDBQuery = "CREATE DATABASE BankLab";
                            SqlCommand createDBCommand = new SqlCommand(createDBQuery, connection);
                            createDBCommand.ExecuteNonQuery();
                            string createTablesQuery = File.ReadAllText(projectPath + @"\CreateScripts\SQLQuery1.sql");
                            SqlCommand createTablesCommand = new SqlCommand(createTablesQuery, connection);
                            createTablesCommand.ExecuteNonQuery();
                            string insertDataTablesQuery = File.ReadAllText(projectPath + @"\CreateScripts\SQLQuery2.sql");
                            SqlCommand insertCommand = new SqlCommand(insertDataTablesQuery, connection);
                            insertCommand.ExecuteNonQuery();
                            string createProc1Query = File.ReadAllText(projectPath + @"\CreateScripts\SQLQuery3.sql");
                            SqlCommand createProc1Command = new SqlCommand(createProc1Query, connection);
                            createProc1Command.ExecuteNonQuery();
                            string createProc2Query = File.ReadAllText(projectPath + @"\CreateScripts\SQLQuery4.sql");
                            SqlCommand createProc2Command = new SqlCommand(createProc2Query, connection);
                            createProc2Command.ExecuteNonQuery();
                        }
                        catch (SqlException e)
                        {
                            MessageBox.Show(e.Message);
                        }
                    }
                }
                finally
                {
                    connection.Close();
                    connectionString = "Data Source=DESKTOP-F644G2I;Initial Catalog=BankLab;Integrated Security=True";
                    connectionChecked = true;
                }
            }
        }
        private void Procedure1_Click(object sender, RoutedEventArgs e)
        {
            string sqlExpression = "PROC_COUNT_BILLS";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    str = $"{reader.GetName(0)}\t\n";

                    while (reader.Read())
                    {
                        object count = reader.GetValue(0);
                        str += $"{count}\t\n";
                    }
                }
                MessageBox.Show(str);
                reader.Close();
                Window_Loaded(new object(), new RoutedEventArgs());
            }
        }
        private void Procedure2_Click(object sender, RoutedEventArgs e)
        {
            string sqlExpression = "PROC_COUNT_OWNERS";

            using (SqlConnection connection = new SqlConnection(connectionString))
            {
                connection.Open();
                SqlCommand command = new SqlCommand(sqlExpression, connection);
                command.CommandType = System.Data.CommandType.StoredProcedure;
                var reader = command.ExecuteReader();

                if (reader.HasRows)
                {
                    str = $"{reader.GetName(0)}\t\n";

                    while (reader.Read())
                    {
                        object count = reader.GetValue(0);
                        str += $"{count}\t\n";
                    }
                }
                MessageBox.Show(str);
                reader.Close();
                Window_Loaded(new object(), new RoutedEventArgs());
            }
        }

        private void Update_Click(object sender, RoutedEventArgs e)
        {
            SqlCommandBuilder comandbuilder = new SqlCommandBuilder(adapter1);
            adapter1.Update(billsTable);
            adapter1.Update(ownersTable);
            Window_Loaded(sender, e);
        }
        private void Delete_Bill_Click(object sender, RoutedEventArgs e)
        {
            if (PlanetsGrid.SelectedItems != null)
            {
                for (int i = 0; i < PlanetsGrid.SelectedItems.Count; i++)
                {
                    DataRowView datarowView = PlanetsGrid.SelectedItems[i] as DataRowView;
                    if (datarowView != null)
                    {
                        DataRow dataRow = (DataRow)datarowView.Row;
                        dataRow.Delete();
                    }
                }
            }
            SqlCommandBuilder comandbuilder = new SqlCommandBuilder(adapter1);
            adapter1.Update(billsTable);
            Window_Loaded(sender, e);
        }
        private void Delete_Owner_Click(object sender, RoutedEventArgs e)
        {
            if (SatellitesGrid.SelectedItems != null)
            {
                for (int i = 0; i < SatellitesGrid.SelectedItems.Count; i++)
                {
                    DataRowView datarowView = SatellitesGrid.SelectedItems[i] as DataRowView;
                    if (datarowView != null)
                    {
                        DataRow dataRow = (DataRow)datarowView.Row;
                        dataRow.Delete();
                    }
                }
            }
            SqlCommandBuilder comandbuilder = new SqlCommandBuilder(adapter2);
            adapter2.Update(ownersTable);
            Window_Loaded(sender, e);
        }
        private void Add_Bill_Click(object sender, RoutedEventArgs e)
        {
            var pl = new Bills();
            try
            {
                pl.ShowDialog();
                Window_Loaded(sender, e);
            }
            catch (InvalidOperationException ex)
            {
                MessageBox.Show(ex.Message);
                pl.Close();
            }
        }

        private void Add_Owner_Click(object sender, RoutedEventArgs e)
        {
            var sat = new Owners();
            try
            {
                sat.ShowDialog();
                Window_Loaded(sender, e);
            }
            catch(InvalidOperationException ex)
            {
                MessageBox.Show(ex.Message);
                sat.Close();
            }
        }

        private void SortBills(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            switch (Sort_Bills.SelectedIndex)
            {
                case 0:
                    script = "id_bill ASC";
                    break;
                case 1:
                    script = "id_bill DESC";
                    break;
                case 2:
                    script = "balance_bill ASC";
                    break;
                case 3:
                    script = "balance_bill DESC";
                    break;
                case 4:
                    script = "type_bill ASC";
                    break;
                case 5:
                    script = "type_bill DESC";
                    break;
            }
            billsTable.DefaultView.Sort = script;
            PlanetsGrid.ItemsSource = billsTable.DefaultView;
        }

        private void SortOwners(object sender, System.Windows.Controls.SelectionChangedEventArgs e)
        {
            switch (Sort_Owners.SelectedIndex)
            {
                case 0:
                    script = "id_owner ASC";
                    break;
                case 1:
                    script = "id_owner DESC";
                    break;
                case 2:
                    script = "name_owner ASC";
                    break;
                case 3:
                    script = "name_owner DESC";
                    break;
                case 4:
                    script = "phone_owner ASC";
                    break;
                case 5:
                    script = "phone_owner DESC";
                    break;
            }
            ownersTable.DefaultView.Sort = script;
            SatellitesGrid.ItemsSource = ownersTable.DefaultView;
        }

        private void DataGridTextColumn_PastingCellClipboardContent(object sender, System.Windows.Controls.DataGridCellClipboardEventArgs e)
        {
        }

        private void PlanetsGrid_PreviewKeyDown(object sender, KeyEventArgs e)
        {
            if (Keyboard.Modifiers == ModifierKeys.Control && e.Key == Key.V)
            {
                e.Handled = true;
                Clipboard.Clear();
            }
        }

        public string path;

        private void ReplaceImage_Click(object sender, RoutedEventArgs e)
        {
            if (SatellitesGrid.SelectedCells.Count > 0)
            {
                //var projectPath2 = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;
                //MessageBox.Show(projectPath2);
                if (SatellitesGrid.SelectedItems.Count == 0) return;
                var img = ((DataRowView)SatellitesGrid.SelectedItems[0]).Row["Image"]; // тут путь к картинке полный, ебать ебля пиздец я в рот ебала
                //MessageBox.Show(img);
                OpenFileDialog openFileDialog = new OpenFileDialog();
                openFileDialog.Filter = "JPG Files (*.jpg)|*.jpg|JPEG Files (*.jpeg)|*.jpeg|PNG Files (*.png)|*.png";
                openFileDialog.InitialDirectory = @"E:\уник\c\Lab08\Lab08\images\";
                if (openFileDialog.ShowDialog() == true)
                {
                    string filePath = openFileDialog.FileName;

                    string[] parts = filePath.Split('\\');

                    path = parts[parts.Length - 1];
                    var projectPath = Directory.GetParent(Directory.GetCurrentDirectory()).Parent.Parent.FullName;

                    img = new BitmapImage(new Uri(projectPath + "/images/" + path));

                    int rowIndex = SatellitesGrid.SelectedIndex;
                    string relativeImagePath = "/images/" + path;
                    UpdateDatabaseImage(rowIndex, relativeImagePath);
                }
            }
        }
        private void UpdateDatabaseImage(int rowIndex, string relativeImagePath)
        {
            try
            {
                using (connection = new SqlConnection(connectionString))
                {
                    connection.Open();
                    SqlCommand command = new SqlCommand("UPDATE OWNERS SET Image=@image WHERE ID_OWNER=@id", connection);
                    SqlParameter imageParam = new SqlParameter("@image", relativeImagePath);
                    SqlParameter idParam = new SqlParameter("@id", rowIndex + 1); 
                    command.Parameters.Add(imageParam);
                    command.Parameters.Add(idParam);
                    command.ExecuteNonQuery();
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);
            }
        }

        private void OpenBillsTab_Click(object sender, RoutedEventArgs e)
        {
            LabTab.SelectedIndex = 0;
        }

        private void OpenOwnersTab_Click(object sender, RoutedEventArgs e)
        {
            LabTab.SelectedIndex = 1;
        }
    }
}
