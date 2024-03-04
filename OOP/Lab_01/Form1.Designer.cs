namespace Lab_01
{
    partial class Form1
    {
        /// <summary>
        /// Обязательная переменная конструктора.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Освободить все используемые ресурсы.
        /// </summary>
        /// <param name="disposing">истинно, если управляемый ресурс должен быть удален; иначе ложно.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Код, автоматически созданный конструктором форм Windows

        /// <summary>
        /// Требуемый метод для поддержки конструктора — не изменяйте 
        /// содержимое этого метода с помощью редактора кода.
        /// </summary>
        private void InitializeComponent()
        {
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.textBoxWeight = new System.Windows.Forms.TextBox();
            this.textBoxHeight = new System.Windows.Forms.TextBox();
            this.textBoxAge = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.comboBoxTarget = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.labelHiddenWeight = new System.Windows.Forms.Label();
            this.labelHiddenTime = new System.Windows.Forms.Label();
            this.textBoxHiddenWeight = new System.Windows.Forms.TextBox();
            this.textBoxHiddenTime = new System.Windows.Forms.TextBox();
            this.label6 = new System.Windows.Forms.Label();
            this.label8 = new System.Windows.Forms.Label();
            this.radioButton1 = new System.Windows.Forms.RadioButton();
            this.radioButton2 = new System.Windows.Forms.RadioButton();
            this.textBox1 = new System.Windows.Forms.TextBox();
            this.textBox3 = new System.Windows.Forms.TextBox();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(34, 40);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(109, 16);
            this.label1.TabIndex = 0;
            this.label1.Text = "пол какой у вас";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(31, 100);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(30, 16);
            this.label2.TabIndex = 2;
            this.label2.Text = "вес";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(31, 150);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(37, 16);
            this.label3.TabIndex = 3;
            this.label3.Text = "рост";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(34, 190);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(61, 16);
            this.label4.TabIndex = 4;
            this.label4.Text = "возраст";
            // 
            // textBoxWeight
            // 
            this.textBoxWeight.Location = new System.Drawing.Point(179, 100);
            this.textBoxWeight.Name = "textBoxWeight";
            this.textBoxWeight.Size = new System.Drawing.Size(100, 22);
            this.textBoxWeight.TabIndex = 5;
            // 
            // textBoxHeight
            // 
            this.textBoxHeight.Location = new System.Drawing.Point(179, 150);
            this.textBoxHeight.Name = "textBoxHeight";
            this.textBoxHeight.Size = new System.Drawing.Size(100, 22);
            this.textBoxHeight.TabIndex = 6;
            // 
            // textBoxAge
            // 
            this.textBoxAge.Location = new System.Drawing.Point(179, 190);
            this.textBoxAge.Name = "textBoxAge";
            this.textBoxAge.Size = new System.Drawing.Size(100, 22);
            this.textBoxAge.TabIndex = 7;
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(377, 402);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(154, 36);
            this.button1.TabIndex = 8;
            this.button1.Text = "рассчитать";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // comboBoxTarget
            // 
            this.comboBoxTarget.Items.AddRange(new object[] {
            "Сжигание веса",
            "Набор веса",
            "Поддержание веса"});
            this.comboBoxTarget.Location = new System.Drawing.Point(179, 260);
            this.comboBoxTarget.Name = "comboBoxTarget";
            this.comboBoxTarget.Size = new System.Drawing.Size(121, 24);
            this.comboBoxTarget.TabIndex = 28;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(31, 268);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(38, 16);
            this.label5.TabIndex = 10;
            this.label5.Text = "цель";
            // 
            // labelHiddenWeight
            // 
            this.labelHiddenWeight.AutoSize = true;
            this.labelHiddenWeight.Location = new System.Drawing.Point(31, 330);
            this.labelHiddenWeight.Name = "labelHiddenWeight";
            this.labelHiddenWeight.Size = new System.Drawing.Size(100, 16);
            this.labelHiddenWeight.TabIndex = 11;
            this.labelHiddenWeight.Text = "желаемый вес";
            this.labelHiddenWeight.Click += new System.EventHandler(this.labelHiddenWeight_Click);
            // 
            // labelHiddenTime
            // 
            this.labelHiddenTime.AutoSize = true;
            this.labelHiddenTime.Location = new System.Drawing.Point(31, 374);
            this.labelHiddenTime.Name = "labelHiddenTime";
            this.labelHiddenTime.Size = new System.Drawing.Size(98, 16);
            this.labelHiddenTime.TabIndex = 12;
            this.labelHiddenTime.Text = "за скок ДНЕЙ";
            this.labelHiddenTime.Click += new System.EventHandler(this.labelHiddenTime_Click);
            // 
            // textBoxHiddenWeight
            // 
            this.textBoxHiddenWeight.Location = new System.Drawing.Point(179, 323);
            this.textBoxHiddenWeight.Name = "textBoxHiddenWeight";
            this.textBoxHiddenWeight.Size = new System.Drawing.Size(100, 22);
            this.textBoxHiddenWeight.TabIndex = 13;
            // 
            // textBoxHiddenTime
            // 
            this.textBoxHiddenTime.Location = new System.Drawing.Point(179, 374);
            this.textBoxHiddenTime.Name = "textBoxHiddenTime";
            this.textBoxHiddenTime.Size = new System.Drawing.Size(100, 22);
            this.textBoxHiddenTime.TabIndex = 14;
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(562, 37);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(89, 16);
            this.label6.TabIndex = 15;
            this.label6.Text = "ваш диагноз";
            // 
            // label8
            // 
            this.label8.AutoSize = true;
            this.label8.Location = new System.Drawing.Point(525, 176);
            this.label8.Name = "label8";
            this.label8.Size = new System.Drawing.Size(93, 16);
            this.label8.TabIndex = 17;
            this.label8.Text = "норма в день";
            // 
            // radioButton1
            // 
            this.radioButton1.AutoSize = true;
            this.radioButton1.Location = new System.Drawing.Point(179, 40);
            this.radioButton1.Name = "radioButton1";
            this.radioButton1.Size = new System.Drawing.Size(39, 20);
            this.radioButton1.TabIndex = 23;
            this.radioButton1.TabStop = true;
            this.radioButton1.Text = "М";
            this.radioButton1.UseVisualStyleBackColor = true;
            // 
            // radioButton2
            // 
            this.radioButton2.AutoSize = true;
            this.radioButton2.Location = new System.Drawing.Point(238, 40);
            this.radioButton2.Name = "radioButton2";
            this.radioButton2.Size = new System.Drawing.Size(41, 20);
            this.radioButton2.TabIndex = 24;
            this.radioButton2.TabStop = true;
            this.radioButton2.Text = "Ж";
            this.radioButton2.UseVisualStyleBackColor = true;
            // 
            // textBox1
            // 
            this.textBox1.Location = new System.Drawing.Point(467, 73);
            this.textBox1.Multiline = true;
            this.textBox1.Name = "textBox1";
            this.textBox1.Size = new System.Drawing.Size(250, 64);
            this.textBox1.TabIndex = 25;
            // 
            // textBox3
            // 
            this.textBox3.Location = new System.Drawing.Point(467, 226);
            this.textBox3.Multiline = true;
            this.textBox3.Name = "textBox3";
            this.textBox3.Size = new System.Drawing.Size(250, 58);
            this.textBox3.TabIndex = 27;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.InactiveCaption;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.textBox3);
            this.Controls.Add(this.textBox1);
            this.Controls.Add(this.radioButton2);
            this.Controls.Add(this.radioButton1);
            this.Controls.Add(this.label8);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.textBoxHiddenTime);
            this.Controls.Add(this.textBoxHiddenWeight);
            this.Controls.Add(this.labelHiddenTime);
            this.Controls.Add(this.labelHiddenWeight);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.comboBoxTarget);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.textBoxAge);
            this.Controls.Add(this.textBoxHeight);
            this.Controls.Add(this.textBoxWeight);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.label1);
            this.Name = "Form1";
            this.Text = "Form1";
            this.Load += new System.EventHandler(this.Form1_Load);
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.TextBox textBoxWeight;
        private System.Windows.Forms.TextBox textBoxHeight;
        private System.Windows.Forms.TextBox textBoxAge;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.ComboBox comboBoxTarget;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label labelHiddenWeight;
        private System.Windows.Forms.Label labelHiddenTime;
        private System.Windows.Forms.TextBox textBoxHiddenWeight;
        private System.Windows.Forms.TextBox textBoxHiddenTime;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label label8;
        private System.Windows.Forms.RadioButton radioButton1;
        private System.Windows.Forms.RadioButton radioButton2;
        private System.Windows.Forms.TextBox textBox1;
        private System.Windows.Forms.TextBox textBox3;
    }
}

