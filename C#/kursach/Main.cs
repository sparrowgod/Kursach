using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace kursach
{
    public partial class Main : Form
    {
        public Main()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void btn_deliv_Click(object sender, EventArgs e)
        {
            delivery deliv = new delivery();
            this.Hide();
            deliv.ShowDialog();
        }

        private void btn_cust_Click(object sender, EventArgs e)
        {
            customer cust = new customer();
            this.Hide();
            cust.ShowDialog();
        }

        private void btn_point_Click(object sender, EventArgs e)
        {
            point pnt = new point();
            this.Hide();
            pnt.ShowDialog();
        }

        private void btn_order_Click(object sender, EventArgs e)
        {
            order ord = new order();
            this.Hide();
            ord.ShowDialog();
        }
    }
}
