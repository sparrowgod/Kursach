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
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void dataGridView3_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet6.Books". При необходимости она может быть перемещена или удалена.
            this.booksTableAdapter2.Fill(this.dB_BOOKSDataSet6.Books);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet5.Books". При необходимости она может быть перемещена или удалена.
            this.booksTableAdapter1.Fill(this.dB_BOOKSDataSet5.Books);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet4.Publishing_house". При необходимости она может быть перемещена или удалена.
            this.publishing_houseTableAdapter.Fill(this.dB_BOOKSDataSet4.Publishing_house);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet3.Deliveries". При необходимости она может быть перемещена или удалена.
            this.deliveriesTableAdapter.Fill(this.dB_BOOKSDataSet3.Deliveries);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet2.Authors". При необходимости она может быть перемещена или удалена.
            this.authorsTableAdapter.Fill(this.dB_BOOKSDataSet2.Authors);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet1.Books". При необходимости она может быть перемещена или удалена.
            this.booksTableAdapter.Fill(this.dB_BOOKSDataSet1.Books);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dB_BOOKSDataSet.Purchases". При необходимости она может быть перемещена или удалена.
            this.purchasesTableAdapter.Fill(this.dB_BOOKSDataSet.Purchases);

        }

        private void Books_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            FormAuthors myForm2 = new FormAuthors();
            myForm2.Show();

        }

        private void авторыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAuthors myForm2 = new FormAuthors();
            myForm2.Show();
        }

        private void книгиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormBooks myForm4 = new FormBooks();
            myForm4.Show();

        }

        private void издательстваToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormPublish myForm6 = new FormPublish();
            myForm6.Show();
        }

        private void поставщикиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormDeliveries myForm5 = new FormDeliveries();
            myForm5.Show();
        }

        private void поставкиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormPurchases myForm3 = new FormPurchases();
            myForm3.Show();
        }

        private void Purchases_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void работаСПроцедурамиToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormProcedure myForm1 = new FormProcedure();
            myForm1.Show();
        }

        private void работаСТабицамиToolStripMenuItem_Click(object sender, EventArgs e)
        {

        }

        private void администрированиеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormAdmin myForm2 = new FormAdmin();
            myForm2.Show();
        }
    }
}
