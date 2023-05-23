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
    public partial class Porfolio : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();

        int selectRow;

        public static string GetTextNullIfEmpty(string input)
        {
            if (input == "''")
            {
                return ("null");
            }
            else
            {
                return input;
            }
        }

        public Porfolio()
        {
            InitializeComponent();
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "Дата записи");
            dataGridView1.Columns.Add("client_id", "id клиента");
            dataGridView1.Columns.Add("name", "название портфеля");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
          

            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetGuid(2), record.GetString(3), record.GetString(4));
        }

        private void RefreshDataGrid(DataGridView dgw)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");

                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            dgw.Rows.Clear();

            string queryString = $"select * from [portfolio]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }

        private void Porfolio_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }

        private void Search(DataGridView dgw)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");

                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            dgw.Rows.Clear();

            string searchString = $"select * from [portfolio] where concat ([dadd], [client_id], [name], [status]) like  '%" + textBox_search.Text + "%'";

            SqlCommand command = new SqlCommand(searchString, database.GetConnection());

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


        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectRow = e.RowIndex;

            if (selectRow >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[selectRow];

                textBox_id.Text = row.Cells[0].Value.ToString();

            }
        }

        private void btn_edit_Click(object sender, EventArgs e)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");

                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id], {name} [name] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'portfolio.edit', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();
            if (res.Contains("failed when converting"))
            {
                MessageBox.Show("Данные введены некорректно!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                var response = Newtonsoft.Json.Linq.JObject.Parse(res);
                string err = string.Format("{0}", (string)response["err"]);
                if (err.Contains("err"))
                {
                    string errmsg = string.Format("{0}", (string)response["errdesc"]);

                    MessageBox.Show(errmsg, err, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    database.openConnection();
                    string resp = string.Format(" id: {0},\n Название: {1},\n id клиента: {2}, \n Статус: {3}", (string)response["response"]["id"],
                                                        (string)response["response"]["name"],
                                                        (string)response["response"]["client_id"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    var query = $"insert into [log] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_close_Click(object sender, EventArgs e)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");

                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'portfolio_close', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();
            if (res.Contains("failed when converting"))
            {
                MessageBox.Show("Данные введены некорректно!", "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
            }
            else
            {
                var response = Newtonsoft.Json.Linq.JObject.Parse(res);
                string err = string.Format("{0}", (string)response["err"]);
                if (err.Contains("err"))
                {
                    string errmsg = string.Format("{0}", (string)response["errdesc"]);

                    MessageBox.Show(errmsg, err, MessageBoxButtons.OK, MessageBoxIcon.Warning);
                }
                else
                {
                    database.openConnection();
                    string resp = string.Format(" id портфеля: {0}, \n статус: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    var query = $"insert into [log] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

            RefreshDataGrid(dataGridView1);
        }
    }
}
