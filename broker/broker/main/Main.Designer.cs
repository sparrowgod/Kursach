namespace broker
{
    partial class Main
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
            this.btn_log = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btn_order = new System.Windows.Forms.Button();
            this.btn_point = new System.Windows.Forms.Button();
            this.btn_client = new System.Windows.Forms.Button();
            this.btn_broker = new System.Windows.Forms.Button();
            this.btn_tran = new System.Windows.Forms.Button();
            this.btn_buy_sell = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_log
            // 
            this.btn_log.Location = new System.Drawing.Point(12, 375);
            this.btn_log.Name = "btn_log";
            this.btn_log.Size = new System.Drawing.Size(139, 34);
            this.btn_log.TabIndex = 11;
            this.btn_log.Text = "Журнал событий";
            this.btn_log.UseVisualStyleBackColor = true;
            this.btn_log.Click += new System.EventHandler(this.btn_log_Click);
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(157, 9);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(1216, 860);
            this.panel1.TabIndex = 10;
            // 
            // btn_order
            // 
            this.btn_order.Location = new System.Drawing.Point(12, 171);
            this.btn_order.Name = "btn_order";
            this.btn_order.Size = new System.Drawing.Size(123, 34);
            this.btn_order.TabIndex = 9;
            this.btn_order.Text = "Компании";
            this.btn_order.UseVisualStyleBackColor = true;
            this.btn_order.Click += new System.EventHandler(this.btn_order_Click);
            // 
            // btn_point
            // 
            this.btn_point.Location = new System.Drawing.Point(12, 121);
            this.btn_point.Name = "btn_point";
            this.btn_point.Size = new System.Drawing.Size(123, 31);
            this.btn_point.TabIndex = 8;
            this.btn_point.Text = "Портфели";
            this.btn_point.UseVisualStyleBackColor = true;
            this.btn_point.Click += new System.EventHandler(this.btn_point_Click);
            // 
            // btn_client
            // 
            this.btn_client.Location = new System.Drawing.Point(12, 72);
            this.btn_client.Name = "btn_client";
            this.btn_client.Size = new System.Drawing.Size(123, 33);
            this.btn_client.TabIndex = 7;
            this.btn_client.Text = "Клиенты";
            this.btn_client.UseVisualStyleBackColor = true;
            this.btn_client.Click += new System.EventHandler(this.btn_client_Click);
            // 
            // btn_broker
            // 
            this.btn_broker.Location = new System.Drawing.Point(12, 23);
            this.btn_broker.Name = "btn_broker";
            this.btn_broker.Size = new System.Drawing.Size(123, 32);
            this.btn_broker.TabIndex = 6;
            this.btn_broker.Text = "Брокеры";
            this.btn_broker.UseVisualStyleBackColor = true;
            this.btn_broker.Click += new System.EventHandler(this.btn_broker_Click);
            // 
            // btn_tran
            // 
            this.btn_tran.Location = new System.Drawing.Point(12, 339);
            this.btn_tran.Name = "btn_tran";
            this.btn_tran.Size = new System.Drawing.Size(139, 30);
            this.btn_tran.TabIndex = 12;
            this.btn_tran.Text = "Транзакции";
            this.btn_tran.UseVisualStyleBackColor = true;
            this.btn_tran.Click += new System.EventHandler(this.btn_tran_Click);
            // 
            // btn_buy_sell
            // 
            this.btn_buy_sell.Location = new System.Drawing.Point(12, 228);
            this.btn_buy_sell.Name = "btn_buy_sell";
            this.btn_buy_sell.Size = new System.Drawing.Size(123, 34);
            this.btn_buy_sell.TabIndex = 13;
            this.btn_buy_sell.Text = "Куплепродажа";
            this.btn_buy_sell.UseVisualStyleBackColor = true;
            this.btn_buy_sell.Click += new System.EventHandler(this.btn_buy_sell_Click);
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1248, 766);
            this.Controls.Add(this.btn_buy_sell);
            this.Controls.Add(this.btn_tran);
            this.Controls.Add(this.btn_log);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btn_order);
            this.Controls.Add(this.btn_point);
            this.Controls.Add(this.btn_client);
            this.Controls.Add(this.btn_broker);
            this.Name = "Main";
            this.Text = "Main";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_log;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btn_order;
        private System.Windows.Forms.Button btn_point;
        private System.Windows.Forms.Button btn_client;
        private System.Windows.Forms.Button btn_broker;
        private System.Windows.Forms.Button btn_tran;
        private System.Windows.Forms.Button btn_buy_sell;
    }
}