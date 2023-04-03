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
    public partial class FormZaved : Form
    {
        public FormZaved()
        {
            InitializeComponent();
        }

        private void FormZaved_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.zaved". При необходимости она может быть перемещена или удалена.
            this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            connection.Open();
            string query = "SELECT Имя_товара, Сорт_товарва, Количество_товара FROM Tovar ORDER BY Код_товара";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[2]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
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
            exApp.Cells[1, 1] = "ФИО заведующего";
            exApp.Cells[1, 2] = "Телефон заведующего";
            int i, j;
            for (i = 0; i < dataGridView1.RowCount - 1; i++)
            {
                for (j = 0; j < dataGridView1.ColumnCount; j++)
                {
                    wsh.Cells[i + 2, j + 1] = dataGridView1[j, i].Value.ToString();
                }
            }
            exApp.Visible = true;
        }
    }
}
