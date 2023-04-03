namespace kursovaya
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
            this.components = new System.ComponentModel.Container();
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.kursach1DataSet = new kursovaya.kursach1DataSet();
            this.otdelBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.otdelTableAdapter = new kursovaya.kursach1DataSetTableAdapters.OtdelTableAdapter();
            this.odinTovarBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.odinTovarTableAdapter = new kursovaya.kursach1DataSetTableAdapters.OdinTovarTableAdapter();
            this.tovariBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tovariTableAdapter = new kursovaya.kursach1DataSetTableAdapters.tovariTableAdapter();
            this.tovarBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tovarTableAdapter = new kursovaya.kursach1DataSetTableAdapters.TovarTableAdapter();
            this.menuStrip1 = new System.Windows.Forms.MenuStrip();
            this.таблицыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.магазиныToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.отделыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.товарыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.ценыToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.заведующиеToolStripMenuItem = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem1 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem2 = new System.Windows.Forms.ToolStripMenuItem();
            this.toolStripMenuItem3 = new System.Windows.Forms.ToolStripMenuItem();
            this.button1 = new System.Windows.Forms.Button();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.button4 = new System.Windows.Forms.Button();
            this.button5 = new System.Windows.Forms.Button();
            this.button6 = new System.Windows.Forms.Button();
            this.button7 = new System.Windows.Forms.Button();
            this.button8 = new System.Windows.Forms.Button();
            this.report1 = new FastReport.Report();
            this.report2 = new FastReport.Report();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.odinTovarBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovariBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovarBindingSource)).BeginInit();
            this.menuStrip1.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.report1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.report2)).BeginInit();
            this.SuspendLayout();
            // 
            // kursach1DataSet
            // 
            this.kursach1DataSet.DataSetName = "kursach1DataSet";
            this.kursach1DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // otdelBindingSource
            // 
            this.otdelBindingSource.DataMember = "Otdel";
            this.otdelBindingSource.DataSource = this.kursach1DataSet;
            // 
            // otdelTableAdapter
            // 
            this.otdelTableAdapter.ClearBeforeFill = true;
            // 
            // odinTovarBindingSource
            // 
            this.odinTovarBindingSource.DataMember = "OdinTovar";
            this.odinTovarBindingSource.DataSource = this.kursach1DataSet;
            // 
            // odinTovarTableAdapter
            // 
            this.odinTovarTableAdapter.ClearBeforeFill = true;
            // 
            // tovariBindingSource
            // 
            this.tovariBindingSource.DataMember = "tovari";
            this.tovariBindingSource.DataSource = this.kursach1DataSet;
            // 
            // tovariTableAdapter
            // 
            this.tovariTableAdapter.ClearBeforeFill = true;
            // 
            // tovarBindingSource
            // 
            this.tovarBindingSource.DataMember = "Tovar";
            this.tovarBindingSource.DataSource = this.kursach1DataSet;
            // 
            // tovarTableAdapter
            // 
            this.tovarTableAdapter.ClearBeforeFill = true;
            // 
            // menuStrip1
            // 
            this.menuStrip1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("menuStrip1.BackgroundImage")));
            this.menuStrip1.ImageScalingSize = new System.Drawing.Size(20, 20);
            this.menuStrip1.Items.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.таблицыToolStripMenuItem,
            this.toolStripMenuItem1});
            this.menuStrip1.Location = new System.Drawing.Point(0, 0);
            this.menuStrip1.Name = "menuStrip1";
            this.menuStrip1.Size = new System.Drawing.Size(1079, 30);
            this.menuStrip1.TabIndex = 0;
            this.menuStrip1.Text = "menuStrip1";
            // 
            // таблицыToolStripMenuItem
            // 
            this.таблицыToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("таблицыToolStripMenuItem.BackgroundImage")));
            this.таблицыToolStripMenuItem.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.магазиныToolStripMenuItem,
            this.отделыToolStripMenuItem,
            this.товарыToolStripMenuItem,
            this.ценыToolStripMenuItem,
            this.заведующиеToolStripMenuItem});
            this.таблицыToolStripMenuItem.Font = new System.Drawing.Font("Old English Text MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.таблицыToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.таблицыToolStripMenuItem.Name = "таблицыToolStripMenuItem";
            this.таблицыToolStripMenuItem.Size = new System.Drawing.Size(96, 26);
            this.таблицыToolStripMenuItem.Text = "Таблицы";
            // 
            // магазиныToolStripMenuItem
            // 
            this.магазиныToolStripMenuItem.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.магазиныToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("магазиныToolStripMenuItem.BackgroundImage")));
            this.магазиныToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.магазиныToolStripMenuItem.Name = "магазиныToolStripMenuItem";
            this.магазиныToolStripMenuItem.Size = new System.Drawing.Size(203, 26);
            this.магазиныToolStripMenuItem.Text = "Магазины";
            this.магазиныToolStripMenuItem.Click += new System.EventHandler(this.магазиныToolStripMenuItem_Click);
            // 
            // отделыToolStripMenuItem
            // 
            this.отделыToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("отделыToolStripMenuItem.BackgroundImage")));
            this.отделыToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.отделыToolStripMenuItem.Name = "отделыToolStripMenuItem";
            this.отделыToolStripMenuItem.Size = new System.Drawing.Size(203, 26);
            this.отделыToolStripMenuItem.Text = "Отделы";
            this.отделыToolStripMenuItem.Click += new System.EventHandler(this.отделыToolStripMenuItem_Click);
            // 
            // товарыToolStripMenuItem
            // 
            this.товарыToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("товарыToolStripMenuItem.BackgroundImage")));
            this.товарыToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.товарыToolStripMenuItem.Name = "товарыToolStripMenuItem";
            this.товарыToolStripMenuItem.Size = new System.Drawing.Size(203, 26);
            this.товарыToolStripMenuItem.Text = "Товары";
            this.товарыToolStripMenuItem.Click += new System.EventHandler(this.товарыToolStripMenuItem_Click);
            // 
            // ценыToolStripMenuItem
            // 
            this.ценыToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("ценыToolStripMenuItem.BackgroundImage")));
            this.ценыToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.ценыToolStripMenuItem.Name = "ценыToolStripMenuItem";
            this.ценыToolStripMenuItem.Size = new System.Drawing.Size(203, 26);
            this.ценыToolStripMenuItem.Text = "Цены";
            this.ценыToolStripMenuItem.Click += new System.EventHandler(this.ценыToolStripMenuItem_Click);
            // 
            // заведующиеToolStripMenuItem
            // 
            this.заведующиеToolStripMenuItem.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("заведующиеToolStripMenuItem.BackgroundImage")));
            this.заведующиеToolStripMenuItem.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.заведующиеToolStripMenuItem.Name = "заведующиеToolStripMenuItem";
            this.заведующиеToolStripMenuItem.Size = new System.Drawing.Size(203, 26);
            this.заведующиеToolStripMenuItem.Text = "Заведующие";
            this.заведующиеToolStripMenuItem.Click += new System.EventHandler(this.заведующиеToolStripMenuItem_Click);
            // 
            // toolStripMenuItem1
            // 
            this.toolStripMenuItem1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("toolStripMenuItem1.BackgroundImage")));
            this.toolStripMenuItem1.DropDownItems.AddRange(new System.Windows.Forms.ToolStripItem[] {
            this.toolStripMenuItem2,
            this.toolStripMenuItem3});
            this.toolStripMenuItem1.Font = new System.Drawing.Font("Old English Text MT", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.toolStripMenuItem1.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.toolStripMenuItem1.Name = "toolStripMenuItem1";
            this.toolStripMenuItem1.Size = new System.Drawing.Size(89, 26);
            this.toolStripMenuItem1.Text = "Отчеты";
            // 
            // toolStripMenuItem2
            // 
            this.toolStripMenuItem2.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.toolStripMenuItem2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("toolStripMenuItem2.BackgroundImage")));
            this.toolStripMenuItem2.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.toolStripMenuItem2.Name = "toolStripMenuItem2";
            this.toolStripMenuItem2.Size = new System.Drawing.Size(269, 26);
            this.toolStripMenuItem2.Text = "Отчёт о товарах";
            this.toolStripMenuItem2.Click += new System.EventHandler(this.toolStripMenuItem2_Click);
            // 
            // toolStripMenuItem3
            // 
            this.toolStripMenuItem3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("toolStripMenuItem3.BackgroundImage")));
            this.toolStripMenuItem3.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.toolStripMenuItem3.Name = "toolStripMenuItem3";
            this.toolStripMenuItem3.Size = new System.Drawing.Size(269, 26);
            this.toolStripMenuItem3.Text = "Отчёт о заведующих";
            this.toolStripMenuItem3.Click += new System.EventHandler(this.toolStripMenuItem3_Click);
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.LightGray;
            this.button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button1.BackgroundImage")));
            this.button1.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button1.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button1.Location = new System.Drawing.Point(53, 112);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(428, 58);
            this.button1.TabIndex = 1;
            this.button1.Text = "Информация о товарах в магазине";
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // button2
            // 
            this.button2.BackColor = System.Drawing.Color.LightGray;
            this.button2.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button2.BackgroundImage")));
            this.button2.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button2.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button2.Location = new System.Drawing.Point(53, 191);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(428, 58);
            this.button2.TabIndex = 2;
            this.button2.Text = "Информация о товарах в отделе";
            this.button2.UseVisualStyleBackColor = false;
            this.button2.Click += new System.EventHandler(this.button2_Click_1);
            // 
            // button3
            // 
            this.button3.BackColor = System.Drawing.Color.LightGray;
            this.button3.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button3.BackgroundImage")));
            this.button3.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button3.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button3.Location = new System.Drawing.Point(53, 270);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(428, 58);
            this.button3.TabIndex = 3;
            this.button3.Text = "Информация об одинаковых товарах";
            this.button3.UseVisualStyleBackColor = false;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // button4
            // 
            this.button4.BackColor = System.Drawing.Color.LightGray;
            this.button4.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button4.BackgroundImage")));
            this.button4.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button4.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button4.Location = new System.Drawing.Point(53, 348);
            this.button4.Name = "button4";
            this.button4.Size = new System.Drawing.Size(428, 58);
            this.button4.TabIndex = 4;
            this.button4.Text = "Информация о заведующих отделами";
            this.button4.UseVisualStyleBackColor = false;
            this.button4.Click += new System.EventHandler(this.button4_Click);
            // 
            // button5
            // 
            this.button5.BackColor = System.Drawing.Color.LightGray;
            this.button5.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button5.BackgroundImage")));
            this.button5.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button5.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button5.Location = new System.Drawing.Point(584, 348);
            this.button5.Name = "button5";
            this.button5.Size = new System.Drawing.Size(428, 58);
            this.button5.TabIndex = 5;
            this.button5.Text = "Добавление/удаление товара";
            this.button5.UseVisualStyleBackColor = false;
            this.button5.Click += new System.EventHandler(this.button5_Click);
            // 
            // button6
            // 
            this.button6.BackColor = System.Drawing.Color.LightGray;
            this.button6.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button6.BackgroundImage")));
            this.button6.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button6.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button6.Location = new System.Drawing.Point(584, 112);
            this.button6.Name = "button6";
            this.button6.Size = new System.Drawing.Size(428, 58);
            this.button6.TabIndex = 6;
            this.button6.Text = "Добавление/удаление магазина";
            this.button6.UseVisualStyleBackColor = false;
            this.button6.Click += new System.EventHandler(this.button6_Click);
            // 
            // button7
            // 
            this.button7.BackColor = System.Drawing.Color.LightGray;
            this.button7.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button7.BackgroundImage")));
            this.button7.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button7.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button7.Location = new System.Drawing.Point(584, 270);
            this.button7.Name = "button7";
            this.button7.Size = new System.Drawing.Size(428, 58);
            this.button7.TabIndex = 7;
            this.button7.Text = "Добавление/удаление отдела";
            this.button7.UseVisualStyleBackColor = false;
            this.button7.Click += new System.EventHandler(this.button7_Click);
            // 
            // button8
            // 
            this.button8.BackColor = System.Drawing.Color.LightGray;
            this.button8.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button8.BackgroundImage")));
            this.button8.Font = new System.Drawing.Font("Old English Text MT", 10.8F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.button8.ForeColor = System.Drawing.Color.DarkOliveGreen;
            this.button8.Location = new System.Drawing.Point(584, 191);
            this.button8.Name = "button8";
            this.button8.Size = new System.Drawing.Size(428, 58);
            this.button8.TabIndex = 7;
            this.button8.Text = "Добавление/удаление заведующего";
            this.button8.UseVisualStyleBackColor = false;
            this.button8.Click += new System.EventHandler(this.button8_Click);
            // 
            // report1
            // 
            this.report1.NeedRefresh = false;
            this.report1.ReportResourceString = resources.GetString("report1.ReportResourceString");
            this.report1.Tag = null;
            this.report1.RegisterData(this.kursach1DataSet, "kursach1DataSet");
            // 
            // report2
            // 
            this.report2.NeedRefresh = false;
            this.report2.ReportResourceString = resources.GetString("report2.ReportResourceString");
            this.report2.Tag = null;
            this.report2.RegisterData(this.kursach1DataSet, "kursach1DataSet");
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("$this.BackgroundImage")));
            this.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.ClientSize = new System.Drawing.Size(1079, 496);
            this.Controls.Add(this.button8);
            this.Controls.Add(this.button7);
            this.Controls.Add(this.button6);
            this.Controls.Add(this.button5);
            this.Controls.Add(this.button4);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.button1);
            this.Controls.Add(this.menuStrip1);
            this.MainMenuStrip = this.menuStrip1;
            this.Name = "Form1";
            this.Text = " Главная";
            this.Load += new System.EventHandler(this.Form1_Load);
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.odinTovarBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovariBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovarBindingSource)).EndInit();
            this.menuStrip1.ResumeLayout(false);
            this.menuStrip1.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.report1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.report2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private kursach1DataSet kursach1DataSet;
        private System.Windows.Forms.BindingSource otdelBindingSource;
        private kursach1DataSetTableAdapters.OtdelTableAdapter otdelTableAdapter;
        private System.Windows.Forms.BindingSource odinTovarBindingSource;
        private kursach1DataSetTableAdapters.OdinTovarTableAdapter odinTovarTableAdapter;
        private System.Windows.Forms.BindingSource tovariBindingSource;
        private kursach1DataSetTableAdapters.tovariTableAdapter tovariTableAdapter;
        private System.Windows.Forms.BindingSource tovarBindingSource;
        private kursach1DataSetTableAdapters.TovarTableAdapter tovarTableAdapter;
        private System.Windows.Forms.MenuStrip menuStrip1;
        private System.Windows.Forms.ToolStripMenuItem таблицыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem магазиныToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem отделыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem товарыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem ценыToolStripMenuItem;
        private System.Windows.Forms.ToolStripMenuItem заведующиеToolStripMenuItem;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.Button button4;
        private System.Windows.Forms.Button button5;
        private System.Windows.Forms.Button button6;
        private System.Windows.Forms.Button button7;
        private System.Windows.Forms.Button button8;
        private FastReport.Report report1;
        private FastReport.Report report2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem1;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem2;
        private System.Windows.Forms.ToolStripMenuItem toolStripMenuItem3;
    }
}

