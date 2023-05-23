namespace broker
{
    partial class buy_sell_stock
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
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(buy_sell_stock));
            this.panel3 = new System.Windows.Forms.Panel();
            this.button1 = new System.Windows.Forms.Button();
            this.pictureBox2 = new System.Windows.Forms.PictureBox();
            this.label7 = new System.Windows.Forms.Label();
            this.dataGridView1 = new System.Windows.Forms.DataGridView();
            this.label1 = new System.Windows.Forms.Label();
            this.label2 = new System.Windows.Forms.Label();
            this.dataGridView2 = new System.Windows.Forms.DataGridView();
            this.textBox_idclient = new System.Windows.Forms.TextBox();
            this.label3 = new System.Windows.Forms.Label();
            this.textBox_idcomp = new System.Windows.Forms.TextBox();
            this.label4 = new System.Windows.Forms.Label();
            this.btn_sell_stock = new System.Windows.Forms.Button();
            this.btn_buy_stock = new System.Windows.Forms.Button();
            this.textBox_quant = new System.Windows.Forms.TextBox();
            this.label5 = new System.Windows.Forms.Label();
            this.panel3.SuspendLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).BeginInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).BeginInit();
            this.SuspendLayout();
            // 
            // panel3
            // 
            this.panel3.BackColor = System.Drawing.Color.LightGray;
            this.panel3.Controls.Add(this.button1);
            this.panel3.Controls.Add(this.pictureBox2);
            this.panel3.Controls.Add(this.label7);
            this.panel3.Location = new System.Drawing.Point(12, 5);
            this.panel3.Name = "panel3";
            this.panel3.Size = new System.Drawing.Size(1033, 59);
            this.panel3.TabIndex = 23;
            // 
            // button1
            // 
            this.button1.BackColor = System.Drawing.Color.DimGray;
            this.button1.BackgroundImage = ((System.Drawing.Image)(resources.GetObject("button1.BackgroundImage")));
            this.button1.BackgroundImageLayout = System.Windows.Forms.ImageLayout.Zoom;
            this.button1.Location = new System.Drawing.Point(967, 7);
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
            this.label7.Size = new System.Drawing.Size(351, 25);
            this.label7.TabIndex = 0;
            this.label7.Text = "Страница куплепродажи акций";
            // 
            // dataGridView1
            // 
            this.dataGridView1.AllowUserToAddRows = false;
            this.dataGridView1.AllowUserToDeleteRows = false;
            this.dataGridView1.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView1.Location = new System.Drawing.Point(12, 95);
            this.dataGridView1.Name = "dataGridView1";
            this.dataGridView1.ReadOnly = true;
            this.dataGridView1.RowHeadersWidth = 51;
            this.dataGridView1.RowTemplate.Height = 24;
            this.dataGridView1.Size = new System.Drawing.Size(1033, 124);
            this.dataGridView1.TabIndex = 22;
            this.dataGridView1.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView1_CellClick);
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Font = new System.Drawing.Font("Century Schoolbook", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label1.Location = new System.Drawing.Point(12, 225);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(123, 25);
            this.label1.TabIndex = 16;
            this.label1.Text = "Компании";
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Font = new System.Drawing.Font("Century Schoolbook", 12F, ((System.Drawing.FontStyle)((System.Drawing.FontStyle.Bold | System.Drawing.FontStyle.Underline))), System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label2.Location = new System.Drawing.Point(12, 67);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(108, 25);
            this.label2.TabIndex = 24;
            this.label2.Text = "Клиенты";
            // 
            // dataGridView2
            // 
            this.dataGridView2.AllowUserToAddRows = false;
            this.dataGridView2.AllowUserToDeleteRows = false;
            this.dataGridView2.ColumnHeadersHeightSizeMode = System.Windows.Forms.DataGridViewColumnHeadersHeightSizeMode.AutoSize;
            this.dataGridView2.Location = new System.Drawing.Point(12, 253);
            this.dataGridView2.Name = "dataGridView2";
            this.dataGridView2.ReadOnly = true;
            this.dataGridView2.RowHeadersWidth = 51;
            this.dataGridView2.RowTemplate.Height = 24;
            this.dataGridView2.Size = new System.Drawing.Size(1033, 124);
            this.dataGridView2.TabIndex = 25;
            this.dataGridView2.CellClick += new System.Windows.Forms.DataGridViewCellEventHandler(this.dataGridView2_CellClick);
            // 
            // textBox_idclient
            // 
            this.textBox_idclient.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.textBox_idclient.Location = new System.Drawing.Point(137, 401);
            this.textBox_idclient.Multiline = true;
            this.textBox_idclient.Name = "textBox_idclient";
            this.textBox_idclient.Size = new System.Drawing.Size(198, 30);
            this.textBox_idclient.TabIndex = 26;
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label3.Location = new System.Drawing.Point(30, 408);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(101, 20);
            this.label3.TabIndex = 27;
            this.label3.Text = "id клиента:";
            // 
            // textBox_idcomp
            // 
            this.textBox_idcomp.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.textBox_idcomp.Location = new System.Drawing.Point(832, 398);
            this.textBox_idcomp.Multiline = true;
            this.textBox_idcomp.Name = "textBox_idcomp";
            this.textBox_idcomp.Size = new System.Drawing.Size(198, 30);
            this.textBox_idcomp.TabIndex = 28;
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label4.Location = new System.Drawing.Point(713, 405);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(113, 20);
            this.label4.TabIndex = 29;
            this.label4.Text = "id компании:";
            // 
            // btn_sell_stock
            // 
            this.btn_sell_stock.BackColor = System.Drawing.Color.DimGray;
            this.btn_sell_stock.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_sell_stock.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_sell_stock.Location = new System.Drawing.Point(331, 465);
            this.btn_sell_stock.Name = "btn_sell_stock";
            this.btn_sell_stock.Size = new System.Drawing.Size(190, 41);
            this.btn_sell_stock.TabIndex = 30;
            this.btn_sell_stock.Text = "Продажа акций";
            this.btn_sell_stock.UseVisualStyleBackColor = false;
            this.btn_sell_stock.Click += new System.EventHandler(this.btn_sell_stock_Click);
            // 
            // btn_buy_stock
            // 
            this.btn_buy_stock.BackColor = System.Drawing.Color.DimGray;
            this.btn_buy_stock.Font = new System.Drawing.Font("Microsoft Sans Serif", 9F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.btn_buy_stock.ForeColor = System.Drawing.SystemColors.ControlLightLight;
            this.btn_buy_stock.Location = new System.Drawing.Point(527, 465);
            this.btn_buy_stock.Name = "btn_buy_stock";
            this.btn_buy_stock.Size = new System.Drawing.Size(190, 41);
            this.btn_buy_stock.TabIndex = 31;
            this.btn_buy_stock.Text = "Покупка акций";
            this.btn_buy_stock.UseVisualStyleBackColor = false;
            this.btn_buy_stock.Click += new System.EventHandler(this.btn_buy_stock_Click);
            // 
            // textBox_quant
            // 
            this.textBox_quant.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.textBox_quant.Location = new System.Drawing.Point(486, 429);
            this.textBox_quant.Multiline = true;
            this.textBox_quant.Name = "textBox_quant";
            this.textBox_quant.Size = new System.Drawing.Size(198, 30);
            this.textBox_quant.TabIndex = 32;
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Font = new System.Drawing.Font("Microsoft Sans Serif", 10.2F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(204)));
            this.label5.Location = new System.Drawing.Point(367, 436);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(114, 20);
            this.label5.TabIndex = 33;
            this.label5.Text = "Количество:";
            // 
            // buy_sell_stock
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1066, 619);
            this.Controls.Add(this.textBox_quant);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.btn_buy_stock);
            this.Controls.Add(this.btn_sell_stock);
            this.Controls.Add(this.textBox_idcomp);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.textBox_idclient);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.dataGridView2);
            this.Controls.Add(this.label1);
            this.Controls.Add(this.panel3);
            this.Controls.Add(this.dataGridView1);
            this.Name = "buy_sell_stock";
            this.Text = "buy_sell_stock";
            this.Load += new System.EventHandler(this.buy_sell_stock_Load);
            this.panel3.ResumeLayout(false);
            this.panel3.PerformLayout();
            ((System.ComponentModel.ISupportInitialize)(this.pictureBox2)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView1)).EndInit();
            ((System.ComponentModel.ISupportInitialize)(this.dataGridView2)).EndInit();
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Panel panel3;
        private System.Windows.Forms.Button button1;
        private System.Windows.Forms.PictureBox pictureBox2;
        private System.Windows.Forms.Label label7;
        private System.Windows.Forms.DataGridView dataGridView1;
        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.DataGridView dataGridView2;
        private System.Windows.Forms.TextBox textBox_idclient;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.TextBox textBox_idcomp;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.Button btn_sell_stock;
        private System.Windows.Forms.Button btn_buy_stock;
        private System.Windows.Forms.TextBox textBox_quant;
        private System.Windows.Forms.Label label5;
    }
}