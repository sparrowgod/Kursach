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
    public partial class Company : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();
        journal journal = new journal();
        int selectRow;

        select select = new select();

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

        public Company()
        {
            InitializeComponent();
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("name", "Название брокера");
            dataGridView1.Columns.Add("industry", "Индустрии");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetString(3), record.GetString(4));
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

            string queryString = $"select * from [company]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
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
            add_company add = new add_company();
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

            string searchString = $"select * from [company] where concat ([dadd], [name], [industry], [status]) like  '%" + textBox_search.Text + "%'";

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
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var ind = GetTextNullIfEmpty("'" + textBox_industry.Text + "'");
            var metod = "company.edit";

            string res = select.company_edit(metod, ID, name, ind);

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
                   
                    string resp = string.Format(" id: {0},\n Название компании: {1},\n Индустрии: {2}, \n Статус: {3}", (string)response["response"]["id"],
                                                        (string)response["response"]["name"],
                                                        (string)response["response"]["industry"],
                                                        (string)response["response"]["status"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_activate_Click(object sender, EventArgs e)
        {
            var metod = "company.active";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");

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

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_deactivate_Click(object sender, EventArgs e)
        {
            var metod = "company.deactive";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");

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

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_stock_add_Click(object sender, EventArgs e)
        {
            var metod = "stock.create";
            var ID = GetTextNullIfEmpty("'" + textBox_id.Text + "'");
            var price = GetTextNullIfEmpty("'" + textBox_price.Text + "'");

            string res = select.stock_create(metod, ID, price);

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

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_stock_Click(object sender, EventArgs e)
        {
            stock stock = new stock();
            stock.Show();
        }

        private void Company_Load_1(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        
        }
    }

}