namespace kursach
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
            this.btn_order = new System.Windows.Forms.Button();
            this.btn_cust = new System.Windows.Forms.Button();
            this.btn_point = new System.Windows.Forms.Button();
            this.btn_deliv = new System.Windows.Forms.Button();
            this.panel1 = new System.Windows.Forms.Panel();
            this.btn_log = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_order
            // 
            this.btn_order.Location = new System.Drawing.Point(12, 174);
            this.btn_order.Name = "btn_order";
            this.btn_order.Size = new System.Drawing.Size(123, 34);
            this.btn_order.TabIndex = 3;
            this.btn_order.Text = "Заказы";
            this.btn_order.UseVisualStyleBackColor = true;
            this.btn_order.Click += new System.EventHandler(this.btn_order_Click);
            // 
            // btn_cust
            // 
            this.btn_cust.Location = new System.Drawing.Point(12, 75);
            this.btn_cust.Name = "btn_cust";
            this.btn_cust.Size = new System.Drawing.Size(123, 33);
            this.btn_cust.TabIndex = 1;
            this.btn_cust.Text = "Заказчики";
            this.btn_cust.UseVisualStyleBackColor = true;
            this.btn_cust.Click += new System.EventHandler(this.btn_cust_Click);
            // 
            // btn_point
            // 
            this.btn_point.Location = new System.Drawing.Point(12, 124);
            this.btn_point.Name = "btn_point";
            this.btn_point.Size = new System.Drawing.Size(123, 31);
            this.btn_point.TabIndex = 2;
            this.btn_point.Text = "Пункты";
            this.btn_point.UseVisualStyleBackColor = true;
            this.btn_point.Click += new System.EventHandler(this.btn_point_Click);
            // 
            // btn_deliv
            // 
            this.btn_deliv.Location = new System.Drawing.Point(12, 26);
            this.btn_deliv.Name = "btn_deliv";
            this.btn_deliv.Size = new System.Drawing.Size(123, 32);
            this.btn_deliv.TabIndex = 0;
            this.btn_deliv.Text = "Курьеры";
            this.btn_deliv.UseVisualStyleBackColor = true;
            this.btn_deliv.Click += new System.EventHandler(this.btn_deliv_Click);
            // 
            // panel1
            // 
            this.panel1.Location = new System.Drawing.Point(157, 12);
            this.panel1.Name = "panel1";
            this.panel1.Size = new System.Drawing.Size(958, 722);
            this.panel1.TabIndex = 4;
            this.panel1.Paint += new System.Windows.Forms.PaintEventHandler(this.panel1_Paint);
            // 
            // btn_log
            // 
            this.btn_log.Location = new System.Drawing.Point(12, 378);
            this.btn_log.Name = "btn_log";
            this.btn_log.Size = new System.Drawing.Size(139, 34);
            this.btn_log.TabIndex = 5;
            this.btn_log.Text = "Журнал событий";
            this.btn_log.UseVisualStyleBackColor = true;
            this.btn_log.Click += new System.EventHandler(this.btn_log_Click);
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(1127, 746);
            this.Controls.Add(this.btn_log);
            this.Controls.Add(this.panel1);
            this.Controls.Add(this.btn_order);
            this.Controls.Add(this.btn_point);
            this.Controls.Add(this.btn_cust);
            this.Controls.Add(this.btn_deliv);
            this.Name = "Main";
            this.Text = "Главная страница";
            this.Load += new System.EventHandler(this.Main_Load);
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_order;
        private System.Windows.Forms.Button btn_cust;
        private System.Windows.Forms.Button btn_point;
        private System.Windows.Forms.Button btn_deliv;
        private System.Windows.Forms.Panel panel1;
        private System.Windows.Forms.Button btn_log;
    }
}