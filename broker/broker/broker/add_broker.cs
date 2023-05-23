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
    public partial class add_broker : Form
    {
        DataBase database = new DataBase();

        private static Logger logger = LogManager.GetCurrentClassLogger();

        public add_broker()
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

            string metod = "broker.create";
            var name = GetTextNullIfEmpty("'" + textBox_name.Text + "'");
            var comsn = GetTextNullIfEmpty("'" + textBox_commission.Text + "'");

            select select = new select();
            string res = select.broker_add(metod, name, comsn);

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
                    string resp = string.Format(" id: {0},\n Название брокера: {1},\n Коммиссия: {2}", (string)response["response"]["id"],
                                                        (string)response["response"]["name"],
                                                        (string)response["response"]["commission"]);

                    MessageBox.Show(resp, "Успешно!", MessageBoxButtons.OK, MessageBoxIcon.Information);

                    journal journal = new journal();
                    string log = journal.resp(resp);
                }
            }
        }

        private void add_broker_Load(object sender, EventArgs e)
        {

        }
    }
}
