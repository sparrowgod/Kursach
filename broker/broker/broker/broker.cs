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
    public partial class broker : Form
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

        public broker()
        {
            InitializeComponent();
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("name", "Название брокера");
            dataGridView1.Columns.Add("commission", "Комиссия");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetDecimal(3), record.GetString(4));
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

            string queryString = $"select * from [broker]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }

        private void broker_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void dataGridView1_CellClick_1(object sender, DataGridViewCellEventArgs e)
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

        private void btn_new_Click_1(object sender, EventArgs e)
        {
            add_broker add = new add_broker();
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

            string searchString = $"select * from [broker] where concat (dadd, name, commission, status) like  '%" + textBox_search.Text + "%'";

            SqlCommand command = new SqlCommand(searchString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void textBox_search_TextChanged_1(object sender, EventArgs e)
        {
            Search(dataGridView1);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
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

            string metod = "broker.edit";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var commsn = GetTextNullIfEmpty("'" + textBox_commission.Text + "'");

            select select = new select();
            string res = select.broker_edit(metod, ID, name, commsn);

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
                    string resp = string.Format(" id: {0},\n Название брокера: {1},\n Комиссия: {2}, \n Статус: {3}", (string)response["response"]["id"],
                                                        (string)response["response"]["name"],
                                                        (string)response["response"]["commission"],
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

            string metod = "broker.active";
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

            string metod = "broker.deactive";
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
    }

}