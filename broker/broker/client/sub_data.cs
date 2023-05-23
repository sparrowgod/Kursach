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
using NLog;


namespace broker
{
    public partial class sub_data : Form
    {

        DataBase database = new DataBase();

        DateTime dt = DateTime.MinValue;

        public sub_data()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("start_date", "начало подписки");
            dataGridView1.Columns.Add("end_date", "конец подписки");
            dataGridView1.Columns.Add("auto_sub", "автоподписка");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {


            dgw.Rows.Add(record.GetGuid(0),
                         record.GetDateTime(1),
                         record.GetDateTime(2),
                         record.GetDateTime(3),
                         record.GetString(4),
                         record.GetString(5));
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

            string queryString = $"select * from [sub_data] order by [dadd] desc";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void sub_data_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }
    }
}
