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
            this.btn_deliv = new System.Windows.Forms.Button();
            this.btn_cust = new System.Windows.Forms.Button();
            this.btn_point = new System.Windows.Forms.Button();
            this.btn_order = new System.Windows.Forms.Button();
            this.SuspendLayout();
            // 
            // btn_deliv
            // 
            this.btn_deliv.Location = new System.Drawing.Point(265, 40);
            this.btn_deliv.Name = "btn_deliv";
            this.btn_deliv.Size = new System.Drawing.Size(306, 57);
            this.btn_deliv.TabIndex = 0;
            this.btn_deliv.Text = "Курьеры";
            this.btn_deliv.UseVisualStyleBackColor = true;
            this.btn_deliv.Click += new System.EventHandler(this.btn_deliv_Click);
            // 
            // btn_cust
            // 
            this.btn_cust.Location = new System.Drawing.Point(265, 129);
            this.btn_cust.Name = "btn_cust";
            this.btn_cust.Size = new System.Drawing.Size(306, 61);
            this.btn_cust.TabIndex = 1;
            this.btn_cust.Text = "Заказчики";
            this.btn_cust.UseVisualStyleBackColor = true;
            this.btn_cust.Click += new System.EventHandler(this.btn_cust_Click);
            // 
            // btn_point
            // 
            this.btn_point.Location = new System.Drawing.Point(265, 223);
            this.btn_point.Name = "btn_point";
            this.btn_point.Size = new System.Drawing.Size(306, 66);
            this.btn_point.TabIndex = 2;
            this.btn_point.Text = "Пункты";
            this.btn_point.UseVisualStyleBackColor = true;
            this.btn_point.Click += new System.EventHandler(this.btn_point_Click);
            // 
            // btn_order
            // 
            this.btn_order.Location = new System.Drawing.Point(265, 318);
            this.btn_order.Name = "btn_order";
            this.btn_order.Size = new System.Drawing.Size(306, 66);
            this.btn_order.TabIndex = 3;
            this.btn_order.Text = "Заказы";
            this.btn_order.UseVisualStyleBackColor = true;
            this.btn_order.Click += new System.EventHandler(this.btn_order_Click);
            // 
            // Main
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(8F, 16F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(871, 502);
            this.Controls.Add(this.btn_order);
            this.Controls.Add(this.btn_point);
            this.Controls.Add(this.btn_cust);
            this.Controls.Add(this.btn_deliv);
            this.Name = "Main";
            this.Text = "Main";
            this.ResumeLayout(false);

        }

        #endregion

        private System.Windows.Forms.Button btn_deliv;
        private System.Windows.Forms.Button btn_cust;
        private System.Windows.Forms.Button btn_point;
        private System.Windows.Forms.Button btn_order;
    }
}