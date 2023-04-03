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
    public partial class FormBooks : Form
    {
        public FormBooks()
        {
            InitializeComponent();
        }

        private void FormBooks_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet4.Publishing_house". При необходимости она может быть перемещена или удалена.
            this.publishing_houseTableAdapter.Fill(this.dB_BOOKSDataSet4.Publishing_house);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet2.Authors". При необходимости она может быть перемещена или удалена.
            this.authorsTableAdapter.Fill(this.dB_BOOKSDataSet2.Authors);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet1.Books". При необходимости она может быть перемещена или удалена.
            this.booksTableAdapter.Fill(this.dB_BOOKSDataSet1.Books);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.Validate();
            this.booksBindingSource.EndEdit();
            this.booksTableAdapter.Update(this.dB_BOOKSDataSet1.Books);
        }

        private void button2_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            booksBindingSource.Filter = $"Code_Publish = '{dataGridView1[4, bb].Value}'";
        }

        private void button3_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            booksBindingSource.Filter = $"Title_book = '{dataGridView1[1, bb].Value}'";
        }

        private void button4_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            booksBindingSource.Filter = $"Code_Author = '{dataGridView1[0, bb].Value}'";
        }

        private void button5_Click(object sender, EventArgs e)
        {
            int bb = dataGridView1.CurrentCell.RowIndex;
            booksBindingSource.Filter = $"Pages = '{dataGridView1[3, bb].Value}'";
        }

        private void button6_Click(object sender, EventArgs e)
        {
            booksBindingSource.Filter = "";
        }
    }
}
