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
    enum RowState
    {
        Existed,
        New,
        Modified,
        ModifiedNew,
        Deleted
    }

    public partial class delivery : Form
    {
        DataBase database = new DataBase();

        int selectRow;

        public delivery()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("fio", "ФИО");
            dataGridView1.Columns.Add("date_of_birth", "дата рождения");
            dataGridView1.Columns.Add("phone", "телефон");
            dataGridView1.Columns.Add("status", "статус");
            dataGridView1.Columns.Add("IsNew", String.Empty);
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetDateTime(3), record.GetString(4), record.GetString(5), RowState.ModifiedNew);
        }

        private void RefreshDataGrid(DataGridView dgw)
        {
            dgw.Rows.Clear();

            string queryString = $"select * from [delivery]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            database.openConnection();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void delivery_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectRow = e.RowIndex;

            if (selectRow >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[selectRow];

                textBox_id.Text = row.Cells[0].Value.ToString();

            }

        }

        private void btn_refresh_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }

        private void btn_new_Click(object sender, EventArgs e)
        {
            add_delivery add = new add_delivery();
            add.Show();
        }


        private void Search(DataGridView dgw)
        {
            dgw.Rows.Clear();

            string searchString = $"select * from [delivery] where concat (dadd, fio, date_of_birth, phone, status) like  '%" + textBox_search.Text + "%'";

            SqlCommand command = new SqlCommand(searchString, database.GetConnection());

            database.openConnection();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void textBox_search_TextChanged(object sender, EventArgs e)
        {
            Search(dataGridView1);  
        }

        private void btn_edit_Click(object sender, EventArgs e)
        {
            database.openConnection();

            var ID = textBox_id.Text;
            var FIO = textBox_fio.Text;
            var dob = textBox_date_of_birth.Text;
            var phone = textBox_phone.Text;

            var addQuery = $"declare @js nvarchar(max) = (select '{ID}' [id], '{FIO}' [fio], '{dob}' [date_of_birth], '{phone}' [phone] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'delivery.edit', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }

            MessageBox.Show(res, "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);

            database.closeConnection();
            RefreshDataGrid(dataGridView1);
        }

        private void btn_activate_Click(object sender, EventArgs e)
        {
            database.openConnection();

            var ID = textBox_id.Text;

            var addQuery = $"declare @js nvarchar(max) = (select '{ID}' [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'delivery.activate', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }

            MessageBox.Show(res, "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);

            database.closeConnection();
            RefreshDataGrid(dataGridView1);
        }

        private void btn_deactivate_Click(object sender, EventArgs e)
        {
            database.openConnection();

            var ID = textBox_id.Text;

            var addQuery = $"declare @js nvarchar(max) = (select '{ID}' [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'delivery.deactivate', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }

            MessageBox.Show(res, "Успех!", MessageBoxButtons.OK, MessageBoxIcon.Information);

            database.closeConnection();
            RefreshDataGrid(dataGridView1);
        }
    }
}
