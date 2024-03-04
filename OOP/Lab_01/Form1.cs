using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using static System.Windows.Forms.VisualStyles.VisualStyleElement.Button;

namespace Lab_01
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }
        private void button1_Click(object sender, EventArgs e)
        {
            string ves = textBoxWeight.Text;
            bool containsOnlyDigits1 = ves.All(char.IsDigit);
            string rost = textBoxHeight.Text;
            bool containsOnlyDigits2 = rost.All(char.IsDigit);
            string vozrast = textBoxAge.Text;
            bool containsOnlyDigits3 = vozrast.All(char.IsDigit);
            string zhelVes = textBoxHiddenWeight.Text;
            bool containsOnlyDigits4 = zhelVes.All(char.IsDigit);
            string srok = textBoxHiddenTime.Text;
            bool containsOnlyDigits5 = srok.All(char.IsDigit); 
            try
            {
                if (!((radioButton1.Checked || radioButton2.Checked) && containsOnlyDigits1 == true && containsOnlyDigits2 == true && containsOnlyDigits3 == true && containsOnlyDigits4 == true && containsOnlyDigits5 == true))
                {
                    throw new Exception();
                }

                double ves1 = Convert.ToDouble(ves);
                double rost1 = Convert.ToDouble(rost);
                double vozrast1 = Convert.ToDouble(vozrast);
                double zhelVes1 = Convert.ToDouble(zhelVes);
                double srok1 = Convert.ToDouble(srok);
                int fl = 0;

                double imt = ves1 / (rost1 * rost1 / 10000);
                if (radioButton2.Checked)
                {
                    imt *= 0.95;
                }
                double BOV = 0;


                if (radioButton1.Checked)
                {
                    BOV = 88.362 + (13.397 * zhelVes1) + (4.799 * rost1) - (5.677 * vozrast1);
                }
                else if (radioButton2.Checked)
                {
                    BOV = 447.593 + (9.247 * zhelVes1) + (3.098 * rost1) - (4.330 * vozrast1);
                }

                double normKal = 0;
                if (imt < 18.5 && fl == 0)
                {
                    textBox1.Text = "Низкий вес";
                    normKal = BOV * 1.2;
                }
                else if (imt < 25 && fl == 0)
                {
                    textBox1.Text = "Нормальный вес";
                    normKal = BOV;
                }
                else if (fl == 0)
                {
                    textBox1.Text = "Ожирение";
                    normKal = BOV * 0.8;
                }

                int ind = comboBoxTarget.SelectedIndex;
                if (ind == 0 && ves1 > zhelVes1)//сжигание
                {
                    zhelVes1 = ves1 * 0.9;
                    normKal = (srok1 - 1) / srok1 * normKal;

                }
                else if (ind == 1 && ves1 < zhelVes1)//набор
                {
                    normKal = srok1 / (srok1 - 1) * normKal;

                }
                else if (ind == 2 && zhelVes1 == ves1)//поддержание
                {
                    normKal = normKal;
                }
                else
                {
                    textBox1.Text = "Все поля должны быть";
                    textBox3.Text = "заполнены правильно!";
                    fl = 1;
                }

                string kalDZhelVes1 = Convert.ToString(normKal);
                if (fl == 0) textBox3.Text = kalDZhelVes1;
                else textBox3.Text = "заполнены правильно!";
            }
            catch
            {
                textBox1.Text = "Все поля должны быть";
                textBox3.Text = "заполнены правильно!";
            }
        }

       

        private void label7_Click(object sender, EventArgs e)
        {

        }

        private void textBoxHiddenWeight_TextChanged(object sender, EventArgs e)
        {

        }

        private void labelHiddenWeight_Click(object sender, EventArgs e)
        {

        }

        private void labelHiddenTime_Click(object sender, EventArgs e)
        {

        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }
    }
}
