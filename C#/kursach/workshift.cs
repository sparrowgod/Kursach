using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.Data.SqlClient;

namespace kursach
{
    public partial class workshift : Form
    {

        DataBase database = new DataBase();

        DateTime dt = DateTime.MinValue;

        public workshift()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("id_deliv", "id курьера");
            dataGridView1.Columns.Add("coordinate_x", "коорд х");
            dataGridView1.Columns.Add("coordinate_y", "коорд у");
            dataGridView1.Columns.Add("da_end", "дата закрытия смены");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            string row5;
            if (record.IsDBNull(5) is true)
            {
                row5 = "Смена активна";
            }
            else
            {
                row5 = (record.GetDateTime(5)).ToString();
            }    


            dgw.Rows.Add(record.GetGuid(0),
                         record.GetDateTime(1),
                         record.GetGuid(2),
                         record.GetInt32(3),
                         record.GetInt32(4),
                         row5,
                         record.GetString(6));
        }

        private void RefreshDataGrid(DataGridView dgw)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            dgw.Rows.Clear();

            string queryString = $"select * from [workshift] order by [status] desc";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }

        private void workshift_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void button1_Click(object sender, EventArgs e)
        {

        }
    }
}
