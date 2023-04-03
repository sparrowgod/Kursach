using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kursovaya
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Tovar". При необходимости она может быть перемещена или удалена.
            this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.OdinTovar". При необходимости она может быть перемещена или удалена.
            this.odinTovarTableAdapter.Fill(this.kursach1DataSet.OdinTovar);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Otdel". При необходимости она может быть перемещена или удалена.
            this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);

        }

        private void отделыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormOtdel myForm3 = new FormOtdel();
            myForm3.Show();
        }

        private void товарыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormTovar myForm4 = new FormTovar();
            myForm4.Show();
        }

        private void ценыToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormPrise myForm5 = new FormPrise();
            myForm5.Show();
        }

        private void заведующиеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormZaved myForm6 = new FormZaved();
            myForm6.Show();
        }

        private void магазиныToolStripMenuItem_Click(object sender, EventArgs e)
        {
            FormMagazin myForm1 = new FormMagazin();
            myForm1.Show();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Magaztovar myForm7 = new Magaztovar();
            myForm7.Show();
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            tovarivotdele myForm8 = new tovarivotdele();
            myForm8.Show();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            OdinTovar myForm9 = new OdinTovar();
            myForm9.Show();
        }

        private void button4_Click(object sender, EventArgs e)
        {
            zaveduyush myForm10 = new zaveduyush();
            myForm10.Show();
        }

        private void button5_Click(object sender, EventArgs e)
        {
            zaprostovar myForm11 = new zaprostovar();
            myForm11.Show();
        }

        private void button8_Click(object sender, EventArgs e)
        {
            zaproszaved myForm12 = new zaproszaved();
            myForm12.Show();
        }

        private void button7_Click(object sender, EventArgs e)
        {
            zaprosotdel myForm13 = new zaprosotdel();
            myForm13.Show(); 
        }

        private void button6_Click(object sender, EventArgs e)
        {
            zaprosmagazin myForm14 = new zaprosmagazin();
            myForm14.Show();
        }

        private void оставшиесяТоварыВОтделеToolStripMenuItem_Click(object sender, EventArgs e)
        {
            report1.Show();
        }

        private void отчётОЗаведующихToolStripMenuItem_Click(object sender, EventArgs e)
        {
            report2.Show();
        }

        private void toolStripMenuItem2_Click(object sender, EventArgs e)
        {
            report1.Show();
        }

        private void toolStripMenuItem3_Click(object sender, EventArgs e)
        {
            report2.Show();
        }
    }
}
