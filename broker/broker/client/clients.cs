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
    public partial class clients : Form
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


        public clients()
        {
            InitializeComponent();
        }

        private void LoadComboBox()
        {
            database.openConnection();
            string sql = "select * from [dbo].[broker]";
            using (SqlCommand cmd = new SqlCommand(sql, database.GetConnection()))
            {
                cmd.CommandType = CommandType.Text;
                DataTable table = new DataTable();
                SqlDataAdapter adapter = new SqlDataAdapter(cmd);
                adapter.Fill(table);

                comboBox1.DisplayMember = "name";
                comboBox1.ValueMember = "id";
                comboBox1.DataSource = table;
            }    

            database.closeConnection();
            
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "Дата записи");
            dataGridView1.Columns.Add("fio", "ФИО");
            dataGridView1.Columns.Add("date_of_birthday", "Дата рождения");
            dataGridView1.Columns.Add("passport", "Паспорт");
            dataGridView1.Columns.Add("balance", "Баланс");
            dataGridView1.Columns.Add("sub_id", "Подписка");
            dataGridView1.Columns.Add("d_clos", "дата закрытия");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            string row7;
            string row6;
            if (record.IsDBNull(7) is true)
            {
                row7 = "Клиент активен";
            }
            else
            {
                row6 = (record.GetGuid(6)).ToString();
                row7 = (record.GetDateTime(7)).ToString();
            }

            if (record.IsDBNull(7) is true)
            {
                row6 = "Нет подписки";
            }
            else
            {
                row6 = (record.GetGuid(6)).ToString();
            }

            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetDateTime(3), record.GetInt64(4), record.GetDecimal(5),
                row6, row7, record.GetString(8));
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

            string queryString = $"select * from [client]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }

        private void clients_Load_1(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);

            LoadComboBox();
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
            add_client add = new add_client();
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

            string searchString = $"select * from [client] where concat ([dadd], [fio], [date_of_birthday], [passport], [sub_id], [d_close], [status]) like  '%" + textBox_search.Text + "%'";

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

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
        }

        private void btn_edit_Click(object sender, EventArgs e)
        {

            string metod = "client.edit";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var fio = GetTextNullIfEmpty("'" + textBox_fio.Text + "'");
            var pas = GetTextNullIfEmpty("'" + textBox_pas.Text + "'");

            select select = new select();
            string res = select.client_edit(metod, ID, fio, pas);

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
                    string resp = string.Format(" id: {0},\n ФИО: {1},\n Дата рождения: {2}, \n Паспорт: {3}, \n Статус: {4}", (string)response["response"]["id"],
                                                        (string)response["response"]["fio"],
                                                        (string)response["response"]["date_of_birthiday"],
                                                        (string)response["response"]["passport"],
                                                        (string)response["response"]["status"]);   

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_activate_Click(object sender, EventArgs e)
        {
            string metod = "client.close";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");

            select select = new select();
            string res = select.metod_active(metod, ID);

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
                    string resp = string.Format(" id: {0}, \n Статус: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_deactivate_Click(object sender, EventArgs e)
        {

            string metod = "broker_client.create";
            var ID_client = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var name_broker = GetTextNullIfEmpty("'" + comboBox1.Text + "'");

            select select = new select();
            string res = select.client_line(metod, ID_client, name_broker);

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
                    string resp = string.Format(" id связи: {0}, \n id клиента: {1}, \n id брокера: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["client_id"],
                                                        (string)response["response"]["broker_id"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_sub_data_create_Click(object sender, EventArgs e)
        {

            string metod = "sub_data.create";
            var ID_client = GetTextNullIfEmpty("'" + textBox_id.Text + "'");

            select select = new select();
            string res = select.client_sub(metod, ID_client);

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
                    string resp = string.Format(" id подписки: {0}, \n id клиента: {1}", (string)response["response"]["id"],
                                                        (string)response["response"]["client_id"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_sub_datas_Click(object sender, EventArgs e)
        {
            sub_data add = new sub_data();
            add.Show();
        }
    }

}