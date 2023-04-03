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
    public partial class FormPublish : Form
    {
        public FormPublish()
        {
            InitializeComponent();
        }

        private void FormPublish_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet4.Publishing_house". При необходимости она может быть перемещена или удалена.
            this.publishing_houseTableAdapter.Fill(this.dB_BOOKSDataSet4.Publishing_house);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.publishinghouseBindingSource.EndEdit();
            this.publishing_houseTableAdapter.Update(this.dB_BOOKSDataSet4.Publishing_house);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            publishinghouseBindingSource.Filter = $"Publish = '{dataGridView1[1, bb].Value}'";
        }

        private void label1_Click(object sender, EventArgs e)
        {

        }

        private void button4_Click(object sender, EventArgs e)
        {
            publishinghouseBindingSource.Filter = "";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            publishinghouseBindingSource.Filter = $"City = '{dataGridView1[2, bb].Value}'";
        }
    }
}
