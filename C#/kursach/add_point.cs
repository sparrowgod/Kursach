using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Newtonsoft.Json;
using System.Data.SqlClient;
using System.IO;
using NLog;

namespace kursach
{
    public partial class add_point : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();

        public add_point()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

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

        private void btn_add_Click(object sender, EventArgs e)
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

            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var address = GetTextNullIfEmpty("'" + textBox_address.Text + "'");
            var phone = GetTextNullIfEmpty("'" + textBox_phone.Text + "'");
            var x = GetTextNullIfEmpty("'" + textBox_x.Text + "'");
            var y = GetTextNullIfEmpty("'" + textBox_y.Text + "'");



            var addQuery = $"declare @js nvarchar(max) = (select {name} [name], " +
                                                               $"{address} [address], " +
                                                               $"{phone} [phone], " +
                                                               $"{x} [coordinate_x], " +
                                                               $"{y} [coordinate_y] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'point.create', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0}," +
                                                "\n Название: {1}," +
                                                "\n Адрес: {2}," +
                                                "\n Телефон: {3}," +
                                                "\n X: {4}," +
                                                "\n Y: {5}",
                                                        (string)response["response"]["id"],
                                                        (string)response["response"]["name"],
                                                        (string)response["response"]["address"],
                                                        (string)response["response"]["phone"],
                                                        (string)response["response"]["coordinate_x"],
                                                        (string)response["response"]["coordinate_y"]
                                               );

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    database.openConnection();

                    var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

        }

        private void add_point_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox_address.Text = "";
            textBox_name.Text = "";
            textBox_phone.Text = "";
            textBox_x.Text = "";
            textBox_y.Text = "";
        }

        private void add_point_Load_1(object sender, EventArgs e)
        {

        }
    }
}
