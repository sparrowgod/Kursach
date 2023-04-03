using System;
using System.IO;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace labaKURS1
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
        }

        private void tableLayoutPanel1_Paint(object sender, PaintEventArgs e)
        {

        }

        private void Form1_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "dBDataSet.Table". При необходимости она может быть перемещена или удалена.
            this.tableTableAdapter.Fill(this.dBDataSet.Table);

        }

        private void toolStripButton1_Click(object sender, EventArgs e)
        {
            this.tableTableAdapter.Update(this.dBDataSet.Table);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {
            int i = this.tableBindingSource.Find("FIO", textBox1.Text);
            if (i==-1)
            {
                DataView dv = new DataView(this.dBDataSet.Table as DataTable);
                dv.RowFilter = String.Format("FIO LIKE '{0}*'", this.textBox1.Text);
                if (dv.Count!=0)
                {
                    i = this.tableBindingSource.Find("FIO", dv[0]["FIO"]);
                }
                dv.Dispose();
                this.tableBindingSource.Position = i;
            }
            this.tableBindingSource.Position = i;
        }

        private void button1_Click(object sender, EventArgs e)
        {
            this.tableBindingSource.Filter = "adres='" + textBox2.Text + "'";
        }

        private void button2_Click(object sender, EventArgs e)
        {
            this.tableBindingSource.Filter = "";
        }

        private void toolStripButton2_Click(object sender, EventArgs e)
        {
            if (saveFileDialog1.ShowDialog() == DialogResult.OK)
            {
                string fn = saveFileDialog1.FileName;
                StreamWriter sw = new StreamWriter(fn, false, System.Text.Encoding.GetEncoding(1251));
                DataView dv = new DataView(this.dBDataSet.Table as DataTable);
                sw.WriteLine("<html>");
                sw.WriteLine("<head>");
                sw.WriteLine("<title>Список студентов</title>");
                sw.WriteLine("<head>");
                sw.WriteLine("<body>");
                sw.WriteLine("<h1>Список студентов</h1>");
                sw.WriteLine("<table border=1>");
                sw.WriteLine("<tr>");
                sw.WriteLine("<td><h3>#</h3></td>");
                sw.WriteLine("<td><h3>ФИО</h3></td>");
                sw.WriteLine("<td><h3>Дата рожд.</h3></td>");
                sw.WriteLine("<td><h3>Адрес</h3></td>");
                sw.WriteLine("<td><h3>Телефон</h3></td>");
                sw.WriteLine("</tr>");
                for (int i = 0; i < dv.Count; i++)
                {
                    sw.WriteLine("<tr>");
                    sw.WriteLine("<td>" + (i + 1) + "</td>");
                    sw.WriteLine("<td>" + dv[i]["FIO"] + "</td>");
                    sw.WriteLine("<td>" + String.Format("{0:d}", dv[i]["Dat_rog"]) + "</td>");
                    sw.WriteLine("<td>" + dv[i]["adres"] + "</td>");
                    sw.WriteLine("<td>" + dv[i]["telefon"] + "</td>");
                    sw.WriteLine("</tr>");
                }
                sw.WriteLine("</table>");
                sw.WriteLine("</body>");
                sw.WriteLine("</html>");
                sw.Close();
            }
        }
    }
}
