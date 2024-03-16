using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace Lab_02
{
    public partial class Form3 : Form
    {
        private readonly List<book> _bookFiles = new List<book>();
        public Form3()
        {
            InitializeComponent();
        }
        public void GetBookFilesFromBaseListbox(ListBox.ObjectCollection items)
        {
            _bookFiles.Clear();
            foreach (object item in items) _bookFiles.Add(item as book);
        }



        private void Form3_FormClosing(object sender, FormClosingEventArgs e)
        {
            e.Cancel = true;
            (sender as Form3).Hide();
        }


        private void listBox11_SelectedIndexChanged(object sender, EventArgs e)
        {


            var selectedBookFile = ((ListBox)sender).SelectedItem as Form3;

            if (selectedBookFile == null) return;


            //foreach (var author in selectedBookFile.Authors) textBoxAuthors.Text += author + Environment.NewLine;
        }

        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || e.KeyChar == 8) return;
            e.Handled = true;
        }
        private void Form3_Load(object sender, EventArgs e)
        {

        }

        internal static void GetBookFilesFromBaseListbox(object items)
        {
            throw new NotImplementedException();
        }

        private void button1_Click_1(object sender, EventArgs e)
        {
            if (textBoxYear.Text == "") return;
            listBox11.Items.Clear();

            int year = int.Parse(textBoxYear.Text);

            foreach (var bookFile in _bookFiles.Where(bookFile => bookFile.Year == year))
            {
                listBox11.Items.Add(bookFile);
            }
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            if (textBoxRangeOfPages.Text == "") return;
            var regex = new Regex(@"^(\d+)-(\d+)$");
            if (regex.IsMatch(textBoxRangeOfPages.Text) == false)
            {
                MessageBox.Show("Неправильный формат ввода диапазона");
                return;
            }
            listBox11.Items.Clear();
            var separatedNumbers = textBoxRangeOfPages.Text.Split('-');
            var firstNumber = int.Parse(separatedNumbers[0]);
            var secondNumber = int.Parse(separatedNumbers[1]);

            foreach (var bookFile in _bookFiles.Where(bookFile => bookFile.Page >= firstNumber && bookFile.Page <= secondNumber))
            {
                listBox11.Items.Add(bookFile);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {

            string izd = textBox1.Text;

            listBox11.Items.Clear();

            List<book> searchedBooks = _bookFiles.Where(account => Regex.IsMatch(account.Izd, $@"{izd}\w*", RegexOptions.IgnoreCase)).ToList();
            foreach (book account in searchedBooks)
            {
                listBox11.Items.Add(account.ToString());
            }
        }
    }
}
