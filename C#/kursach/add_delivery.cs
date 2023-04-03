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
    public partial class add_delivery : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();
        public add_delivery()
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

            var FIO = GetTextNullIfEmpty("'" + textBox_fio.Text + "'");
            var dob = GetTextNullIfEmpty("'" + textBox_date_of_birth.Text + "'");
            var phone = GetTextNullIfEmpty("'" + textBox_phone.Text + "'");



            var addQuery = $"declare @js nvarchar(max) = (select {FIO} [fio], {dob} [date_of_birth], {phone} [phone] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'delivery.create', @js, @rp out select @rp as [result]";

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
                    string resp = string.Format(" id: {0},\n ФИО: {1},\n Дата рождения: {2},\n Телефон: {3}", (string)response["response"]["id"],
                                                        (string)response["response"]["fio"],
                                                        (string)response["response"]["date_of_birth"],
                                                        (string)response["response"]["phone"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    database.openConnection();

                    var query = $"insert into [log_table] values (getdate(),'{resp}', 'ok', @@spid)";

                    var cmd = new SqlCommand(query, database.GetConnection());
                    cmd.ExecuteNonQuery();

                    database.closeConnection();
                }
            }

        }

        private void add_delivery_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox_date_of_birth.Text = "";
            textBox_fio.Text = "";
            textBox_phone.Text = "";
        }
    }
}
