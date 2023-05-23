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


namespace broker
{
    public partial class add_client : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();

        public add_client()
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

            string metod = "client.create";
            var fio = GetTextNullIfEmpty("'" + textBox_fio.Text + "'");
            var dob = GetTextNullIfEmpty("'" + textBox_dob.Text + "'");
            var pas = GetTextNullIfEmpty("'" + textBox_pas.Text + "'");



            select select = new select();
            string res = select.client_add(metod, fio, dob, pas);

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
                    string resp = string.Format(" id: {0},\n ФИО: {1},\n Дата рождения: {2}, \n Паспорт: {3}, \n id портфеля: {4}", (string)response["response"]["id"],
                                                        (string)response["response"]["fio"],
                                                        (string)response["response"]["date_of_birthiday"],
                                                        (string)response["response"]["passport"],
                                                        (string)response["response"]["port_id"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }
        }

        private void add_broker_Load(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            textBox_fio.Text = "";
            textBox_dob.Text = "";
            textBox_pas.Text = "";
        }

        private void add_client_Load(object sender, EventArgs e)
        {

        }
    }
}
