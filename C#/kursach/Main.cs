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
        private Form active;


        public Main()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void btn_deliv_Click(object sender, EventArgs e)
        {
            PanelForm(new delivery());
        }

        private void btn_cust_Click(object sender, EventArgs e)
        {
            PanelForm(new customer());
        }

        private void btn_point_Click(object sender, EventArgs e)
        {
            PanelForm(new point());
        }

        private void btn_order_Click(object sender, EventArgs e)
        {
            PanelForm(new order());
        }

        private void btn_workshift_Click(object sender, EventArgs e)
        {
            PanelForm(new workshift());
        }

        private void btn_log_Click(object sender, EventArgs e)
        {
            PanelForm(new logform());
        }


        private void Main_Load(object sender, EventArgs e)
        {

        }

        private void PanelForm(Form fm)
        {
            if (active != null)
                active.Close();

            active = fm;
            fm.TopLevel = false;
            fm.FormBorderStyle = FormBorderStyle.None;
            fm.Dock = DockStyle.Fill;
            this.panel1.Controls.Add(fm);
            this.panel1.Tag = fm;
            fm.BringToFront();
            fm.Show();
        }
    }
}
