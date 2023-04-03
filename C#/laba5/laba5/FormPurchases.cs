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
    public partial class FormPurchases : Form
    {
        public FormPurchases()
        {
            InitializeComponent();
        }

        private void FormPurchases_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet3.Deliveries". При необходимости она может быть перемещена или удалена.
            this.deliveriesTableAdapter.Fill(this.dB_BOOKSDataSet3.Deliveries);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet1.Books". При необходимости она может быть перемещена или удалена.
            this.booksTableAdapter.Fill(this.dB_BOOKSDataSet1.Books);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet.Purchases". При необходимости она может быть перемещена или удалена.
            this.purchasesTableAdapter.Fill(this.dB_BOOKSDataSet.Purchases);

        }

        private void Deliveries_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.purchasesBindingSource.EndEdit();
            this.purchasesTableAdapter.Update(this.dB_BOOKSDataSet.Purchases);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            purchasesBindingSource.Filter = $"Code_book = '{dataGridView1[1, bb].Value}'";
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button7_Click(object sender, EventArgs e)
        {
            purchasesBindingSource.Filter = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            purchasesBindingSource.Filter = $"Date_order = '{dataGridView1[2, bb].Value}'";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            purchasesBindingSource.Filter = $"Code_delivery = '{dataGridView1[3, bb].Value}'";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            purchasesBindingSource.Filter = $"Cost = '{dataGridView1[5, bb].Value}'";
        }

        private void button6_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            purchasesBindingSource.Filter = $"Amount = '{dataGridView1[6, bb].Value}'";
        }
    }
}
