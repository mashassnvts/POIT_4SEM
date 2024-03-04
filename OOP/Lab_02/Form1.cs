using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Windows.Forms;
using System.Text;
using System.Threading.Tasks;
using Newtonsoft.Json;
using System.Drawing;
using static System.Windows.Forms.VisualStyles.VisualStyleElement;

namespace Lab_02
{
    public partial class Form1 : Form
    {

        //экземпляр второй формы
        public readonly Form2 _authorsForm = new Form2();

        public Form1()
        {
            InitializeComponent();
            //скрытие формы
            _authorsForm.Hide();
        }

        List<book> books = new List<book>();
        private void MaskedTextBo1_MaskInputRejected(object sender, MaskInputRejectedEventArgs e) { }
        //для открытия второй формы
        private void button4_Click(object sender, EventArgs e)
        {
            _authorsForm.ShowDialog();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            // Создание списка книг (BookFilesList), взятых из элементов списка listBox11
            var BookFilesList = (from object item in listBox11.Items select item as book).ToList();

            using (var reader = new StreamWriter(@"D:\new\Lab_02\JSON\Lab2.json"))
            {
                string jsonString = JsonConvert.SerializeObject(BookFilesList);
                reader.Write(jsonString);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            var BookFilesList = books;
            using (var reader = new StreamReader(@"D:\new\Lab_02\JSON\Lab2.json"))
            {
                BookFilesList = JsonConvert.DeserializeObject<List<book>>(reader.ReadToEnd());
            }

            foreach (var bookFile in BookFilesList)
                listBox11.Items.Add(books);
        }


        private Author.Pages selectedPageSize = Author.Pages.Small;
       private void HScrollBarSize_Scroll_Scroll(object sender, ScrollEventArgs e)
        {
            var amount = hScrollBarSize_Scroll.Value;
            label6.Text = $"количество страниц: {hScrollBarSize_Scroll.Value}";
        }


        private void textBox1_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || e.KeyChar == 8) return;
            e.Handled = true;
        }
        private void textBox3_KeyPress(object sender, KeyPressEventArgs e)
        {
            if (char.IsDigit(e.KeyChar) || e.KeyChar == 8 || e.KeyChar == 46) return;
            e.Handled = true;
        }

        //private void textBox4_KeyPress(object sender, KeyPressEventArgs e)
        //{
        //    if (char.IsDigit(e.KeyChar) || e.KeyChar == 8) return;
        //    e.Handled = true;
        //}


        private void label2_Click(object sender, EventArgs e)
        {
        }
        private void radioButton1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void udcMaskedTextBox_KeyPress(object sender, KeyPressEventArgs e)
        {
            if(char.IsDigit(e.KeyChar) || char.IsControl(e.KeyChar))
            {
                e.Handled= true;
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            
            if (_authorsForm.CurrentAuthorsList == null) return;
            //if (Controls.OfType<RadioButton>().Any(r => r.Checked) == false) return;


            var name = "";
            var sizee = 0;
            var page = 0;
            //var numberOfPages = 0;
            var udc = udcMaskedTextBox.Text;
            var format = Format.FB2;
            int year = DateTime.Now.Year;



            try
            {
                if (!Controls.OfType<RadioButton>().Any(r => r.Checked) || textBox2.Text == "" || textBox1.Text == "" || udcMaskedTextBox.Text == "")
                    throw new Exception("Заполните поля!");
                if (textBox2.Text.Length > 30 || textBox1.Text.Length > 30/* || textBox4.Text.Length > 30 */)
                    throw new Exception("Превышен размер входных данных");

                name = textBox2.Text;
                sizee = int.Parse(textBox1.Text);

                //numberOfPages = int.Parse(textBox4.Text);
                udc = udcMaskedTextBox.Text;
                year = dateTimePickerYear.Value.Year;

                var checkedRadioButton = Controls.OfType<RadioButton>().First(r => r.Checked);
                switch (checkedRadioButton.Name)
                {
                    case "radioButton1":
                        format = Format.TXT;
                        break;
                    case "radioButton2":
                        format = Format.PDF;
                        break;
                    case "radioButtonF3":
                        format = Format.FB2;
                        break;
                    case "radioButton4":
                        format = Format.EPUB;
                        break;
                }
                page = hScrollBarSize_Scroll.Value;
            }
            catch (OverflowException)
            {
                MessageBox.Show("Числа великоваты");
                return;
            }
            catch (Exception exception)
            {
                MessageBox.Show(exception.Message);
                return;
            }

            var authorsList = new List<Author>(_authorsForm.CurrentAuthorsList);
            if (_authorsForm.TextBoxName.Text == "" && _authorsForm.ComboBox1.Text == "" && _authorsForm.TextBoxID.Text == "")
            {
                MessageBox.Show("Пожалуйста, заполните информацию об авторе!");
                return;
            }
            var bookFile = new book(format, sizee, name, udc, page, year, _authorsForm.TextBoxName.Text, _authorsForm.ComboBox1.Text, Convert.ToInt32(_authorsForm.TextBoxID.Text));
            listBox11.Items.Add(bookFile);


            _authorsForm.Clear();
        }
    }
}