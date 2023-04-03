namespace kursovaya
{
    partial class zaprosotdel
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            this.components = new System.ComponentModel.Container();
            this.otdelBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.kursach1DataSet = new kursovaya.kursach1DataSet();
            this.label3 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.textBox2 = new System.Windows.Forms.TextBox();
            this.button1 = new System.Windows.Forms.Button();
            this.otdelTableAdapter = new kursovaya.kursach1DataSetTableAdapters.OtdelTableAdapter();
            this.zavedBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.magazinBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.label4 = new System.Windows.Forms.Label();
            this.zavedTableAdapter = new kursovaya.kursach1DataSetTableAdapters.zavedTableAdapter();
            this.magazintovBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.magazintovTableAdapter = new kursovaya.kursach1DataSetTableAdapters.magazintovTableAdapter();
            this.magazinTableAdapter = new kursovaya.kursach1DataSetTableAdapters.magazinTableAdapter();
            this.button2 = new System.Windows.Forms.Button();
            this.button3 = new System.Windows.Forms.Button();
            this.comboBox1 = new System.Windows.Forms.ComboBox();
            this.comboBox2 = new System.Windows.Forms.ComboBox();
            this.tovarBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.tovarTableAdapter = new kursovaya.kursach1DataSetTableAdapters.TovarTableAdapter();
            this.fKpriseКодотдел2D27B809BindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.priseTableAdapter = new kursovaya.kursach1DataSetTableAdapters.priseTableAdapter();
            this.otdelBindingSource1 = new System.Windows.Forms.BindingSource(this.components);
            this.otdelBindingSource2 = new System.Windows.Forms.BindingSource(this.components);
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.Column1 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column2 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.Column3 = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.zaprosotdelBindingSource = new System.Windows.Forms.BindingSource(this.components);
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.zavedBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.magazinBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.magazintovBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovarBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.fKpriseКодотдел2D27B809BindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.zaprosotdelBindingSource)).BeginInit();
            this.SuspendLayout();
            // 
            // otdelBindingSource
            // 
            this.otdelBindingSource.DataMember = "Otdel";
            this.otdelBindingSource.DataSource = this.kursach1DataSet;
            // 
            // kursach1DataSet
            // 
            this.kursach1DataSet.DataSetName = "kursach1DataSet";
            this.kursach1DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(205, 224);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(130, 16);
            this.label3.TabIndex = 44;
            this.label3.Text = "ФИО заведующего";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(205, 193);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(83, 16);
            this.label2.TabIndex = 43;
            this.label2.Text = "Имя отдела";
            this.label2.Click += new System.EventHandler(this.label2_Click);
            // 
            // textBox2
            // 
            this.textBox2.Location = new System.Drawing.Point(351, 190);
            this.textBox2.Name = "textBox2";
            this.textBox2.Size = new System.Drawing.Size(156, 22);
            this.textBox2.TabIndex = 40;
            this.textBox2.TextChanged += new System.EventHandler(this.textBox2_TextChanged);
            // 
            // button1
            // 
            this.button1.Location = new System.Drawing.Point(207, 278);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(300, 28);
            this.button1.TabIndex = 38;
            this.button1.Text = "Добавить";
            this.button1.UseVisualStyleBackColor = true;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // otdelTableAdapter
            // 
            this.otdelTableAdapter.ClearBeforeFill = true;
            // 
            // zavedBindingSource
            // 
            this.zavedBindingSource.DataMember = "zaved";
            this.zavedBindingSource.DataSource = this.kursach1DataSet;
            // 
            // magazinBindingSource
            // 
            this.magazinBindingSource.DataMember = "magazin";
            this.magazinBindingSource.DataSource = this.kursach1DataSet;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(205, 251);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(139, 16);
            this.label4.TabIndex = 48;
            this.label4.Text = "Название магазина";
            this.label4.Click += new System.EventHandler(this.label4_Click);
            // 
            // zavedTableAdapter
            // 
            this.zavedTableAdapter.ClearBeforeFill = true;
            // 
            // magazintovBindingSource
            // 
            this.magazintovBindingSource.DataMember = "magazintov";
            this.magazintovBindingSource.DataSource = this.kursach1DataSet;
            // 
            // magazintovTableAdapter
            // 
            this.magazintovTableAdapter.ClearBeforeFill = true;
            // 
            // magazinTableAdapter
            // 
            this.magazinTableAdapter.ClearBeforeFill = true;
            // 
            // button2
            // 
            this.button2.Location = new System.Drawing.Point(208, 346);
            this.button2.Name = "button2";
            this.button2.Size = new System.Drawing.Size(299, 28);
            this.button2.TabIndex = 52;
            this.button2.Text = "Удалить";
            this.button2.UseVisualStyleBackColor = true;
            this.button2.Click += new System.EventHandler(this.button2_Click);
            // 
            // button3
            // 
            this.button3.Location = new System.Drawing.Point(207, 312);
            this.button3.Name = "button3";
            this.button3.Size = new System.Drawing.Size(300, 28);
            this.button3.TabIndex = 54;
            this.button3.Text = "Изменить";
            this.button3.UseVisualStyleBackColor = true;
            this.button3.Click += new System.EventHandler(this.button3_Click);
            // 
            // comboBox1
            // 
            this.comboBox1.FormattingEnabled = true;
            this.comboBox1.Location = new System.Drawing.Point(351, 218);
            this.comboBox1.Name = "comboBox1";
            this.comboBox1.Size = new System.Drawing.Size(156, 24);
            this.comboBox1.TabIndex = 55;
            this.comboBox1.SelectedIndexChanged += new System.EventHandler(this.comboBox1_SelectedIndexChanged);
            // 
            // comboBox2
            // 
            this.comboBox2.FormattingEnabled = true;
            this.comboBox2.Location = new System.Drawing.Point(351, 248);
            this.comboBox2.Name = "comboBox2";
            this.comboBox2.Size = new System.Drawing.Size(156, 24);
            this.comboBox2.TabIndex = 56;
            this.comboBox2.SelectedIndexChanged += new System.EventHandler(this.comboBox2_SelectedIndexChanged);
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
            // fKpriseКодотдел2D27B809BindingSource
            // 
            this.fKpriseКодотдел2D27B809BindingSource.DataMember = "FK__prise__Код_отдел__2D27B809";
            this.fKpriseКодотдел2D27B809BindingSource.DataSource = this.otdelBindingSource;
            // 
            // priseTableAdapter
            // 
            this.priseTableAdapter.ClearBeforeFill = true;
            // 
            // otdelBindingSource1
            // 
            this.otdelBindingSource1.DataMember = "Otdel";
            this.otdelBindingSource1.DataSource = this.kursach1DataSet;
            // 
            // otdelBindingSource2
            // 
            this.otdelBindingSource2.DataMember = "Otdel";
            this.otdelBindingSource2.DataSource = this.kursach1DataSet;
            // 
            // dataGridView1
            // 
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.dataGridView1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.Column1,
            this.Column2,
            this.Column3});
            this.dataGridView1.Location = new System.Drawing.Point(-1, 0);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(801, 126);
            this.dataGridView1.TabIndex = 57;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // Column1
            // 
            this.Column1.DataPropertyName = "Имя_отдела";
            this.Column1.HeaderText = "Имя отдела";
            this.Column1.MinimumWidth = 6;
            this.Column1.Name = "Column1";
            this.Column1.Width = 125;
            // 
            // Column2
            // 
            this.Column2.HeaderText = "ФИО заведующего";
            this.Column2.MinimumWidth = 6;
            this.Column2.Name = "Column2";
            this.Column2.Width = 125;
            // 
            // Column3
            // 
            this.Column3.HeaderText = "Название магазина";
            this.Column3.MinimumWidth = 6;
            this.Column3.Name = "Column3";
            this.Column3.Width = 125;
            // 
            // zaprosotdelBindingSource
            // 
            this.zaprosotdelBindingSource.DataSource = typeof(kursovaya.zaprosotdel);
            // 
            // zaprosotdel
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.dataGridView1);
            this.Controls.Add(this.comboBox2);
            this.Controls.Add(this.comboBox1);
            this.Controls.Add(this.button3);
            this.Controls.Add(this.button2);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.textBox2);
            this.Controls.Add(this.button1);
            this.Name = "zaprosotdel";
            this.Text = "zaprosotdel";
            this.Load += new System.EventHandler(this.zaprosotdel_Load);
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.zavedBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.magazinBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.magazintovBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.tovarBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.fKpriseКодотдел2D27B809BindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.otdelBindingSource2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.zaprosotdelBindingSource)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.TextBox textBox2;
        private System.Windows.Forms.Button button1;
        private kursach1DataSet kursach1DataSet;
        private System.Windows.Forms.BindingSource otdelBindingSource;
        private kursach1DataSetTableAdapters.OtdelTableAdapter otdelTableAdapter;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.BindingSource zavedBindingSource;
        private kursach1DataSetTableAdapters.zavedTableAdapter zavedTableAdapter;
        private System.Windows.Forms.BindingSource magazintovBindingSource;
        private kursach1DataSetTableAdapters.magazintovTableAdapter magazintovTableAdapter;
        private System.Windows.Forms.BindingSource magazinBindingSource;
        private kursach1DataSetTableAdapters.magazinTableAdapter magazinTableAdapter;
        private System.Windows.Forms.Button button2;
        private System.Windows.Forms.Button button3;
        private System.Windows.Forms.ComboBox comboBox1;
        private System.Windows.Forms.ComboBox comboBox2;
        private System.Windows.Forms.BindingSource tovarBindingSource;
        private kursach1DataSetTableAdapters.TovarTableAdapter tovarTableAdapter;
        private System.Windows.Forms.BindingSource fKpriseКодотдел2D27B809BindingSource;
        private kursach1DataSetTableAdapters.priseTableAdapter priseTableAdapter;
        private System.Windows.Forms.BindingSource otdelBindingSource1;
        private System.Windows.Forms.BindingSource otdelBindingSource2;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column1;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column2;
        private System.Windows.Forms.DataGridViewTextBoxColumn Column3;
        private System.Windows.Forms.BindingSource zaprosotdelBindingSource;
    }
}