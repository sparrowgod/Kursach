namespace broker
{
    partial class transactions
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(transactions));
            this.panel3 = new System.Windows.Forms.Panel();
            this.pictureBox3 = new System.Windows.Forms.PictureBox();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.label7 = new System.Windows.Forms.Label();
            this.textBox_search = new System.Windows.Forms.TextBox();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.btn_refill = new System.Windows.Forms.Button();
            this.btn_withdrawal = new System.Windows.Forms.Button();
            this.btn_buy_stock = new System.Windows.Forms.Button();
            this.btn_sub_data = new System.Windows.Forms.Button();
            this.btn_sell_stock = new System.Windows.Forms.Button();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.LightGray;
            this.panel3.Controls.Add(this.pictureBox3);
            this.panel3.Controls.Add(this.button1);
            this.panel3.Controls.Add(this.pictureBox2);
            this.panel3.Controls.Add(this.label7);
            this.panel3.Controls.Add(this.textBox_search);
            this.panel3.Location = new System.Drawing.Point(12, 3);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(896, 59);
            this.panel3.TabIndex = 36;
            // 
            // pictureBox3
            // 
            this.pictureBox3.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox3.Image")));
            this.pictureBox3.Location = new System.Drawing.Point(538, 9);
            this.pictureBox3.Name = "pictureBox3";
            this.pictureBox3.Size = new System.Drawing.Size(42, 36);
            this.pictureBox3.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox3.TabIndex = 16;
            this.pictureBox3.TabStop = false;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.DimGray;
            this.button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button1.BackgroundImage")));
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button1.Location = new System.Drawing.Point(830, 5);
            this.button1.Name = "button1";
            this.button1.Size = new System.Drawing.Size(51, 48);
            this.button1.TabIndex = 15;
            this.button1.UseVisualStyleBackColor = false;
            this.button1.Click += new System.EventHandler(this.button1_Click);
            // 
            // pictureBox2
            // 
            this.pictureBox2.Image = ((System.Drawing.Image)(resources.GetObject("pictureBox2.Image")));
            this.pictureBox2.Location = new System.Drawing.Point(3, 3);
            this.pictureBox2.Name = "pictureBox2";
            this.pictureBox2.Size = new System.Drawing.Size(63, 50);
            this.pictureBox2.SizeMode = System.Windows.Forms.PictureBoxSizeMode.Zoom;
            this.pictureBox2.TabIndex = 1;
            this.pictureBox2.TabStop = false;
            // 
            // label7
            // 
            this.label7.AutoSize = true;
            this.label7.Font = new System.Drawing.Font("Century Schoolbook", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label7.Location = new System.Drawing.Point(72, 16);
            this.label7.Name = "label7";
            this.label7.Size = new System.Drawing.Size(195, 25);
            this.label7.TabIndex = 0;
            this.label7.Text = "Журнал событий";
            // 
            // textBox_search
            // 
            this.textBox_search.Location = new System.Drawing.Point(600, 9);
            this.textBox_search.Multiline = true;
            this.textBox_search.Name = "textBox_search";
            this.textBox_search.Size = new System.Drawing.Size(224, 36);
            this.textBox_search.TabIndex = 13;
            this.textBox_search.TextChanged += new System.EventHandler(this.textBox_search_TextChanged);
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 68);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(896, 239);
            this.dataGridView1.TabIndex = 35;
            // 
            // btn_refill
            // 
            this.btn_refill.BackColor = System.Drawing.Color.DimGray;
            this.btn_refill.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_refill.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_refill.Location = new System.Drawing.Point(12, 334);
            this.btn_refill.Name = "btn_refill";
            this.btn_refill.Size = new System.Drawing.Size(158, 41);
            this.btn_refill.TabIndex = 37;
            this.btn_refill.Text = "Пополнение";
            this.btn_refill.UseVisualStyleBackColor = false;
            this.btn_refill.Click += new System.EventHandler(this.btn_refill_Click);
            // 
            // btn_withdrawal
            // 
            this.btn_withdrawal.BackColor = System.Drawing.Color.DimGray;
            this.btn_withdrawal.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_withdrawal.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_withdrawal.Location = new System.Drawing.Point(188, 334);
            this.btn_withdrawal.Name = "btn_withdrawal";
            this.btn_withdrawal.Size = new System.Drawing.Size(158, 41);
            this.btn_withdrawal.TabIndex = 38;
            this.btn_withdrawal.Text = "Вывод средств";
            this.btn_withdrawal.UseVisualStyleBackColor = false;
            this.btn_withdrawal.Click += new System.EventHandler(this.btn_withdrawal_Click);
            // 
            // btn_buy_stock
            // 
            this.btn_buy_stock.BackColor = System.Drawing.Color.DimGray;
            this.btn_buy_stock.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_buy_stock.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_buy_stock.Location = new System.Drawing.Point(539, 334);
            this.btn_buy_stock.Name = "btn_buy_stock";
            this.btn_buy_stock.Size = new System.Drawing.Size(158, 41);
            this.btn_buy_stock.TabIndex = 40;
            this.btn_buy_stock.Text = "Покупка акций";
            this.btn_buy_stock.UseVisualStyleBackColor = false;
            this.btn_buy_stock.Click += new System.EventHandler(this.btn_buy_stock_Click);
            // 
            // btn_sub_data
            // 
            this.btn_sub_data.BackColor = System.Drawing.Color.DimGray;
            this.btn_sub_data.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_sub_data.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_sub_data.Location = new System.Drawing.Point(363, 334);
            this.btn_sub_data.Name = "btn_sub_data";
            this.btn_sub_data.Size = new System.Drawing.Size(158, 41);
            this.btn_sub_data.TabIndex = 39;
            this.btn_sub_data.Text = "Подписки";
            this.btn_sub_data.UseVisualStyleBackColor = false;
            this.btn_sub_data.Click += new System.EventHandler(this.btn_sub_data_Click);
            // 
            // btn_sell_stock
            // 
            this.btn_sell_stock.BackColor = System.Drawing.Color.DimGray;
            this.btn_sell_stock.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_sell_stock.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_sell_stock.Location = new System.Drawing.Point(719, 334);
            this.btn_sell_stock.Name = "btn_sell_stock";
            this.btn_sell_stock.Size = new System.Drawing.Size(158, 41);
            this.btn_sell_stock.TabIndex = 41;
            this.btn_sell_stock.Text = "Продажа акций";
            this.btn_sell_stock.UseVisualStyleBackColor = false;
            this.btn_sell_stock.Click += new System.EventHandler(this.btn_sell_stock_Click);
            // 
            // transactions
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(998, 589);
            this.Controls.Add(this.btn_sell_stock);
            this.Controls.Add(this.btn_buy_stock);
            this.Controls.Add(this.btn_sub_data);
            this.Controls.Add(this.btn_withdrawal);
            this.Controls.Add(this.btn_refill);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.dataGridView1);
            this.Name = "transactions";
            this.Text = "transactions";
            this.Load += new System.EventHandler(this.transactions_Load);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox3)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.PictureBox pictureBox3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.TextBox textBox_search;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Button btn_refill;
        private System.Windows.Forms.Button btn_withdrawal;
        private System.Windows.Forms.Button btn_buy_stock;
        private System.Windows.Forms.Button btn_sub_data;
        private System.Windows.Forms.Button btn_sell_stock;
    }
}