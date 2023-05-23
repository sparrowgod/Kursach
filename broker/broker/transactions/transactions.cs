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

    public partial class transactions : Form
    {
        DataBase database = new DataBase();

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

        DataTable table = new DataTable();

        public transactions()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void transactions_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата транзакции");
            dataGridView1.Columns.Add("client_id", "айди клиента");
            dataGridView1.Columns.Add("type", "тип транзакции");
            dataGridView1.Columns.Add("sum", "сумма");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            dgw.Rows.Add(
                         record.GetGuid(0),
                         record.GetDateTime(1),
                         record.GetGuid(2),
                         record.GetString(3),
                         record.GetDecimal(4),
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

            string queryString = $"select * from [transaction] order by [dadd] desc";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
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
                MessageBox.Show(ex.Message, "Ошибка!", MessageBoxButtons.OK, MessageBoxIcon.Warning);
                Application.Exit();
            }

            dgw.Rows.Clear();

            string searchString = $"select * from [transaction] where concat ([dadd], [type], [client_id], [sum]) like  '%" + textBox_search.Text + "%'";

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

        private void TypeTran(DataGridView dgw, string type)
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

            string queryString = $"select * from [transaction] where [type] = '{type}' order by [dadd] desc";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }


        private void btn_refill_Click(object sender, EventArgs e)
        {
            string type = "refill";
            TypeTran(dataGridView1, type);
        }

        private void btn_withdrawal_Click(object sender, EventArgs e)
        {
            string type = "withdrawal";
            TypeTran(dataGridView1, type);
        }

        private void btn_sub_data_Click(object sender, EventArgs e)
        {
            string type = "subscribe";
            TypeTran(dataGridView1, type);
        }

        private void btn_buy_stock_Click(object sender, EventArgs e)
        {
            string type = "buy_stock";
            TypeTran(dataGridView1, type);
        }

        private void btn_sell_stock_Click(object sender, EventArgs e)
        {
            string type = "sell_stock";
            TypeTran(dataGridView1, type);
        }
    }
}
