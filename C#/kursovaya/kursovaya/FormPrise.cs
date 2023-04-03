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
    public partial class FormPrise : Form
    {
        public FormPrise()
        {
            InitializeComponent();
        }

        private void FormPrise_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.prise". При необходимости она может быть перемещена или удалена.
            this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            connection.Open();
            string query = "SELECT Имя_отдела, Имя_товара, Цена_товара FROM prise, Otdel, Tovar " +
                "WHERE Tovar.Код_товара=prise.Код_товара AND prise.Код_отдела=Otdel.Код_отдела";
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
            exApp.Cells[1, 1] = "Название отдела";
            exApp.Cells[1, 2] = "Наименование товара";
            exApp.Cells[1, 3] = "Цена товара";
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
