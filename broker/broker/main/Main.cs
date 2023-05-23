using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace broker
{
    public partial class Main : Form
    {
        private Form active;


        public Main()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void btn_broker_Click(object sender, EventArgs e)
        {
            PanelForm(new broker());
        }

        private void btn_log_Click(object sender, EventArgs e)
        {
            PanelForm(new log_form());
        }

        private void btn_tran_Click(object sender, EventArgs e)
        {
            PanelForm(new transactions());
        }

        private void btn_client_Click(object sender, EventArgs e)
        {
            PanelForm(new clients());
        }
        private void btn_point_Click(object sender, EventArgs e)
        {
            PanelForm(new Porfolio());
        }

        private void btn_order_Click(object sender, EventArgs e)
        {
            PanelForm(new Company());
        }

        private void btn_buy_sell_Click(object sender, EventArgs e)
        {
            PanelForm(new buy_sell_stock());
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
