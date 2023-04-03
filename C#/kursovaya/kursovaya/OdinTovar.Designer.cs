namespace kursovaya
{
    partial class OdinTovar
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
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.имятовараDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.имяотделаDataGridViewTextBoxColumn = new System.Windows.Forms.DataGridViewTextBoxColumn();
            this.odinTovarBindingSource = new System.Windows.Forms.BindingSource(this.components);
            this.kursach1DataSet = new kursovaya.kursach1DataSet();
            this.odinTovarTableAdapter = new kursovaya.kursach1DataSetTableAdapters.OdinTovarTableAdapter();
            this.label1 = new System.Windows.Forms.Label();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.odinTovarBindingSource)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).BeginInit();
            this.SuspendLayout();
            // 
            // dataGridView1
            // 
            this.dataGridView1.AutoGenerateColumns = false;
            this.dataGridView1.BackgroundColor = System.Drawing.SystemColors.ActiveBorder;
            this.dataGridView1.BorderStyle = System.Windows.Forms.BorderStyle.None;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Columns.AddRange(new System.Windows.Forms.DataGridViewColumn[] {
            this.имятовараDataGridViewTextBoxColumn,
            this.имяотделаDataGridViewTextBoxColumn});
            this.dataGridView1.DataSource = this.odinTovarBindingSource;
            this.dataGridView1.Location = new System.Drawing.Point(4, 57);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(797, 395);
            this.dataGridView1.TabIndex = 0;
            this.dataGridView1.CellContentClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellContentClick);
            // 
            // имятовараDataGridViewTextBoxColumn
            // 
            this.имятовараDataGridViewTextBoxColumn.DataPropertyName = "Имя_товара";
            this.имятовараDataGridViewTextBoxColumn.HeaderText = "Имя_товара";
            this.имятовараDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.имятовараDataGridViewTextBoxColumn.Name = "имятовараDataGridViewTextBoxColumn";
            this.имятовараDataGridViewTextBoxColumn.Width = 125;
            // 
            // имяотделаDataGridViewTextBoxColumn
            // 
            this.имяотделаDataGridViewTextBoxColumn.DataPropertyName = "Имя_отдела";
            this.имяотделаDataGridViewTextBoxColumn.HeaderText = "Имя_отдела";
            this.имяотделаDataGridViewTextBoxColumn.MinimumWidth = 6;
            this.имяотделаDataGridViewTextBoxColumn.Name = "имяотделаDataGridViewTextBoxColumn";
            this.имяотделаDataGridViewTextBoxColumn.Width = 125;
            // 
            // odinTovarBindingSource
            // 
            this.odinTovarBindingSource.DataMember = "OdinTovar";
            this.odinTovarBindingSource.DataSource = this.kursach1DataSet;
            // 
            // kursach1DataSet
            // 
            this.kursach1DataSet.DataSetName = "kursach1DataSet";
            this.kursach1DataSet.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema;
            // 
            // odinTovarTableAdapter
            // 
            this.odinTovarTableAdapter.ClearBeforeFill = true;
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Microsoft Sans Serif", 13.8F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(74, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(638, 29);
            this.label1.TabIndex = 1;
            this.label1.Text = "Информация об одинаковых товарах в разных отделах";
            // 
            // OdinTovar
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.BackColor = System.Drawing.SystemColors.ActiveBorder;
            this.ClientSize = new System.Drawing.Size(800, 450);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.dataGridView1);
            this.Name = "OdinTovar";
            this.Text = "OdinTovar";
            this.Load += new System.EventHandler(this.OdinTovar_Load);
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.odinTovarBindingSource)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.kursach1DataSet)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.DataGridView dataGridView1;
        private kursach1DataSet kursach1DataSet;
        private System.Windows.Forms.BindingSource odinTovarBindingSource;
        private kursach1DataSetTableAdapters.OdinTovarTableAdapter odinTovarTableAdapter;
        private System.Windows.Forms.DataGridViewTextBoxColumn имятовараDataGridViewTextBoxColumn;
        private System.Windows.Forms.DataGridViewTextBoxColumn имяотделаDataGridViewTextBoxColumn;
        private System.Windows.Forms.Label label1;
    }
}