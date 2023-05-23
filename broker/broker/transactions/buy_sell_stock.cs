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
    public partial class buy_sell_stock : Form
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

        public buy_sell_stock()
        {
            InitializeComponent();
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

            dataGridView2.Columns.Add("id", "id");
            dataGridView2.Columns.Add("dadd", "дата записи");
            dataGridView2.Columns.Add("name", "Название брокера");
            dataGridView2.Columns.Add("industry", "Индустрии");
            dataGridView2.Columns.Add("status", "статус");
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


        private void ReadSingleRow1(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(record.GetGuid(0), record.GetDateTime(1), record.GetString(2), record.GetString(3), record.GetString(4));
        }

        private void RefreshDataGrid1(DataGridView dgw)
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
                ReadSingleRow1(dgw, reader);
            }
            reader.Close();
        }

        private void buy_sell_stock_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
            RefreshDataGrid1(dataGridView2);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            RefreshDataGrid(dataGridView1);
            RefreshDataGrid1(dataGridView2);
        }

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectRow = e.RowIndex;

            if (selectRow >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[selectRow];

                textBox_idclient.Text = row.Cells[0].Value.ToString();

            }
        }

        private void dataGridView2_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectRow = e.RowIndex;

            if (selectRow >= 0)
            {
                DataGridViewRow row = dataGridView2.Rows[selectRow];

                textBox_idcomp.Text = row.Cells[0].Value.ToString();

            }
        }

        private void btn_buy_stock_Click(object sender, EventArgs e)
        {
            var metod = "port_company.buy_stock";
            var idclient = GetTextNullIfEmpty("'" + textBox_idclient.Text + "'");
            var idcomp = GetTextNullIfEmpty("'" + textBox_idcomp.Text + "'");
            string idbroker = select.broker_client(idclient);
            string idport = select.port_client(idclient);
            var quant = GetTextNullIfEmpty("'" + textBox_quant.Text + "'");

            string res = select.buy_stock(metod, idclient, idcomp, idbroker, idport, quant);

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
                    string resp = string.Format(" id портфеля: {0}, \n id компании: {1}, \n Цена акции: {2}, \n Количество купленных акций: {3}, \n Баланс клиента: {4}", (string)response["response"]["port_id"],
                                                        (string)response["response"]["comp_id"],
                                                        (string)response["response"]["price_of_buy"],
                                                        (string)response["response"]["quantity"],
                                                        (string)response["response"]["balance"]);   

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }

        private void btn_sell_stock_Click(object sender, EventArgs e)
        {
            var metod = "port_company.sell_stock";
            var idclient = GetTextNullIfEmpty("'" + textBox_idclient.Text + "'");
            var idcomp = GetTextNullIfEmpty("'" + textBox_idcomp.Text + "'");
            string iddeal = select.id_deal(idcomp);
            string idbroker = select.broker_client(idclient);

            string res = select.buy_stock(metod, idclient, idbroker, iddeal);

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
                    string resp = string.Format(" Прибыль: {0}", (string)response["response"]["price_now"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    string log = journal.resp(resp);
                }
            }

            RefreshDataGrid(dataGridView1);
        }
    }
}
