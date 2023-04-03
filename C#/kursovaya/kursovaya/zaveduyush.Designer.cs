namespace kursovaya
{
    partial class zaveduyush
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
            this.label1 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.фИОзаведующегоDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.имяотделаDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.zaveduyushBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.kursach1DataSet = new kursovaya.kursach1DataSet();
            this.zaveduyushTableAdapter = new kursovaya.kursach1DataSetTableAdapters.zaveduyushTableAdapter();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.zaveduyushBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.BackColor = System.Drawing.SystemColors.AppWorkspace;
            this.label1.Font = new System.Drawing.Font("MS Reference Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label1.ForeColor = System.Drawing.SystemColors.ControlText;
            this.label1.Location = new System.Drawing.Point(155, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(465, 28);
            this.label1.TabIndex = 3;
            this.label1.Text = "Информация о заведующих отделами";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.dataGridView1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.фИОзаведующегоDataGridViewTextBoxColumn,
            this.имяотделаDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.zaveduyushBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(0, 52);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(801, 395);
            this.dataGridView1.TabIndex = 2;
            // 
            // фИОзаведующегоDataGridViewTextBoxColumn
            // 
            this.фИОзаведующегоDataGridViewTextBoxColumn.DataPropertyName = "ФИО_заведующего";
            this.фИОзаведующегоDataGridViewTextBoxColumn.HeaderText = "ФИО_заведующего";
            this.фИОзаведующегоDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.фИОзаведующегоDataGridViewTextBoxColumn.Name = "фИОзаведующегоDataGridViewTextBoxColumn";
            this.фИОзаведующегоDataGridViewTextBoxColumn.Width = 125;
            // 
            // имяотделаDataGridViewTextBoxColumn
            // 
            this.имяотделаDataGridViewTextBoxColumn.DataPropertyName = "Имя_отдела";
            this.имяотделаDataGridViewTextBoxColumn.HeaderText = "Имя_отдела";
            this.имяотделаDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.имяотделаDataGridViewTextBoxColumn.Name = "имяотделаDataGridViewTextBoxColumn";
            this.имяотделаDataGridViewTextBoxColumn.Width = 125;
            // 
            // zaveduyushBindingSource
            // 
            this.zaveduyushBindingSource.DataMember = "zaveduyush";
            this.zaveduyushBindingSource.DataSource = this.kursach1DataSet;
            // 
            // kursach1DataSet
            // 
            this.kursach1DataSet.DataSetName = "kursach1DataSet";
            this.kursach1DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // zaveduyushTableAdapter
            // 
            this.zaveduyushTableAdapter.ClearBeforeFill = true;
            // 
            // zaveduyush
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "zaveduyush";
            this.Text = "zaveduyush";
            this.Load += new System.EventHandler(this.zaveduyush_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.zaveduyushBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.DataGridView dataGridView1;
        private kursach1DataSet kursach1DataSet;
        private System.Windows.Forms.BindingSource zaveduyushBindingSource;
        private kursach1DataSetTableAdapters.zaveduyushTableAdapter zaveduyushTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn фИОзаведующегоDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn имяотделаDataGridViewTextBoxColumn;
    }
}