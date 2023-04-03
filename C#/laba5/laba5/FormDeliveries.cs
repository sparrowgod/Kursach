using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace laba5
{
    public partial class FormDeliveries : Form
    {
        public FormDeliveries()
        {
            InitializeComponent();
        }

        private void FormDeliveries_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet3.Deliveries". При необходимости она может быть перемещена или удалена.
            this.deliveriesTableAdapter.Fill(this.dB_BOOKSDataSet3.Deliveries);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.deliveriesBindingSource.EndEdit();
            this.deliveriesTableAdapter.Update(this.dB_BOOKSDataSet3.Deliveries);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            deliveriesBindingSource.Filter = $"Name_delivery = '{dataGridView1[1, bb].Value}'";
        }

        private void button7_Click(object sender, EventArgs e)
        {
            deliveriesBindingSource.Filter = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            deliveriesBindingSource.Filter = $"Name_company = '{dataGridView1[2, bb].Value}'";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            deliveriesBindingSource.Filter = $"Address = '{dataGridView1[3, bb].Value}'";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            deliveriesBindingSource.Filter = $"Phone = '{dataGridView1[4, bb].Value}'";
        }

        private void button6_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            deliveriesBindingSource.Filter = $"INN = '{dataGridView1[5, bb].Value}'";
        }
    }
}
