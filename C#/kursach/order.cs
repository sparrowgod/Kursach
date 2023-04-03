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
    public partial class order : Form
    {

        DataBase database = new DataBase();

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

        public order()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void CreateColumns()
        {
            dataGridView1.Columns.Add("id", "id");
            dataGridView1.Columns.Add("dadd", "дата записи");
            dataGridView1.Columns.Add("name", "название");
            dataGridView1.Columns.Add("id_point", "id пункта");
            dataGridView1.Columns.Add("id_cust", "id заказчика");
            dataGridView1.Columns.Add("id_deliv", "id курьера");
            dataGridView1.Columns.Add("coordinate_x", "коорд х");
            dataGridView1.Columns.Add("coordinate_y", "коорд у");
            dataGridView1.Columns.Add("status", "статус");
        }

        private void ReadSingleRow(DataGridView dgw, IDataRecord record)
        {
            string row3;
            string row4;
            string row5;
            if (record.IsDBNull(3) is true)
            {
                row3 = "Пункт ещё не поставлен";
            }
            else
            {
                row3 = (record.GetGuid(3)).ToString();
            }

            if (record.IsDBNull(4) is true)
            {
                row4 = "Заказчик ещё не поставлен";
            }
            else
            {
                row4 = (record.GetGuid(4)).ToString();
            }

            if (record.IsDBNull(5) is true)
            {
                row5 = "Курьер ещё не поставлен";
            }
            else
            {
                row5 = (record.GetGuid(5)).ToString();
            }


            dgw.Rows.Add(record.GetGuid(0),
                         record.GetDateTime(1),
                         record.GetString(2),
                         row3,
                         row4,
                         row5,
                         record.GetInt32(6),
                         record.GetInt32(7),
                         record.GetString(8));
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

            string queryString = $"select * from [order]";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();

            while (reader.Read())
            {
                ReadSingleRow(dgw, reader);
            }
            reader.Close();
        }

        private void btn_new_Click(object sender, EventArgs e)
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

            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var cust_id = GetTextNullIfEmpty("'" + textBox_id_cust.Text + "'");
            var x = GetTextNullIfEmpty("'" + textBox_x.Text + "'");
            var y = GetTextNullIfEmpty("'" + textBox_y.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {name} [name]," +
                                                              $" {cust_id} [id_cust]," +
                                                              $" {x} [coordinate_x], {y} [coordinate_y] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.create', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n" +
                                               " id заказчика: {1},\n" +
                                               " координаты x/y: {2}/{3}", (string)response["response"]["id"],
                                                        (string)response["response"]["customer_id"],
                                                        (string)response["response"]["coordinate_x"],
                                                        (string)response["response"]["coordinate_y"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    database.openConnection();

                    var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

            RefreshDataGrid(dataGridView1);

            textBox_name.Text = "";
            textBox_id_cust.Text = "";
            textBox_x.Text = "";
            textBox_y.Text = "";

        }

        private void btn_point_search_Click(object sender, EventArgs e)
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

            var ID = GetTextNullIfEmpty("'" + textBox_id_search.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.search_point', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n id пункта: {1},\n Статус: {2}", (string)response["response"]["id"],
                                                        (string)response["response"]["id_point"],
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

        private void btn_deliv_search_Click(object sender, EventArgs e)
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

            var ID = GetTextNullIfEmpty("'" + textBox_id_search.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.searh_delivery', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n id курьера: {1},\n Статус: {2}", (string)response["response"]["id"],
                                                        (string)response["response"]["id_deliv"],
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

        private void order_Load(object sender, EventArgs e)
        {
            CreateColumns();
            RefreshDataGrid(dataGridView1);
        }

        private void btn_collected_Click(object sender, EventArgs e)
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

            var ID = GetTextNullIfEmpty("'" + textBox_id_search.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.wait_delivery', @js, @rp out select @rp as [result]";

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

        private void btn_on_way_Click(object sender, EventArgs e)
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

            var ID = GetTextNullIfEmpty("'" + textBox_id_search.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.on_way', @js, @rp out select @rp as [result]";

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

        private void btn_success_Click(object sender, EventArgs e)
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

            var ID = GetTextNullIfEmpty("'" + textBox_id_search.Text + "'");

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'order.success', @js, @rp out select @rp as [result]";

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

        private void dataGridView1_CellClick(object sender, DataGridViewCellEventArgs e)
        {
            selectRow = e.RowIndex;

            if (selectRow >= 0)
            {
                DataGridViewRow row = dataGridView1.Rows[selectRow];

                textBox_id_search.Text = row.Cells[0].Value.ToString();

            }
        }

        private void button1_Click(object sender, EventArgs e)
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

            string searchString = $"select * from [order] where concat (dadd, name, coordinate_x, coordinate_y, status) like  '%" + textBox_search.Text + "%'";

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

        private void panel2_Paint(object sender, PaintEventArgs e)
        {

        }
    }
}
