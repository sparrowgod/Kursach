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

namespace kursach
{

    public partial class customer : Form
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

        public customer()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("fio", "ФИО");
            dataGridView1.Columns.Add("address", "адрес");
            dataGridView1.Columns.Add("phone", "телефон");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetString(3), record.GetString(4), record.GetString(5));
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

            string queryString = $"select * from [customer]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            database.openConnection();

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void customer_Load(object sender, EventArgs e)
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

            RefreshDataGrid(dataGridView1);
        }

        private void btn_new_Click(object sender, EventArgs e)
        {
            add_customer add = new add_customer();
            add.Show();
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

            string searchString = $"select * from [customer] where concat (dadd, fio, address, phone, status) like  '%" + textBox_search.Text + "%'";

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
            var FIO = GetTextNullIfEmpty("'" + textBox_fio.Text + "'");
            var address = GetTextNullIfEmpty("'" + textBox_address.Text + "'");
            var phone = GetTextNullIfEmpty("'" + textBox_phone.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id]," +
                                                              $" {FIO} [fio]," +
                                                              $" {address} [address]," +
                                                              $" {phone} [phone] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'customer.edit', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n ФИО: {1},\n Дата рождения: {2},\n Телефон: {3},\n Статус: {4}", (string)response["response"]["id"],
                                                        (string)response["response"]["fio"],
                                                        (string)response["response"]["date_of_birth"],
                                                        (string)response["response"]["phone"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    database.openConnection();

                    var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_activate_Click(object sender, EventArgs e)
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
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'customer.activate', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n Статус: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                        database.openConnection();

                        var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                        var cmd = new SqlCommand(query, database.GetConnection());
                        cmd.ExecuteNonQuery();

                        database.closeConnection();
                }
            }
             
            RefreshDataGrid(dataGridView1);
        }

        private void btn_deactivate_Click(object sender, EventArgs e)
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
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'customer.deactivate', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n Статус: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    database.openConnection();

                    var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();

                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {

        }
    }
}
