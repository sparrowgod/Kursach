using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;
using Excel = Microsoft.Office.Interop.Excel;

namespace kursovaya
{
    public partial class FormMagazin : Form
    {
        public FormMagazin()
        {
            InitializeComponent();
        }

        private void FormMagazin_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.magazin". При необходимости она может быть перемещена или удалена.
            this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            connection.Open();
            string query = "SELECT Название_магазина, Класс_магазина, Номер_магазина FROM magazin ORDER BY Код_магазина";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[3]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
            }

            reader.Close();

            connection.Close();

            foreach (string[] s in data)
                dataGridView1.Rows.Add(s);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            Excel.Application exApp = new Excel.Application();

            exApp.Workbooks.Add();
            Excel.Worksheet wsh = (Excel.Worksheet)exApp.ActiveSheet;
            exApp.Cells[1, 1] = "Название магазина";
            exApp.Cells[1, 2] = "Класс_магазина";
            exApp.Cells[1, 3] = "Номер магазина";

            int i, j;
            for (i=0;i<dataGridView1.RowCount-1;i++)
            {
                for(j=0;j<dataGridView1.ColumnCount;j++)
                {
                    wsh.Cells[i + 2, j + 1] = dataGridView1[j, i].Value.ToString();
                }
            }
            exApp.Visible = true;
        }
    }
}
