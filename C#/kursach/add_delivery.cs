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

namespace kursach
{
    public partial class add_delivery : Form
    {
        DataBase database = new DataBase();

        public add_delivery()
        {
            InitializeComponent();
        }

        private void btn_add_Click(object sender, EventArgs e)
        {
            database.openConnection();

            var FIO = textBox_fio.Text;
            var dob = textBox_date_of_birth.Text;
            var phone = textBox_phone.Text;



            var addQuery = $"declare @js nvarchar(max) = (select '{FIO}' [fio], '{dob}' [date_of_birth], '{phone}' [phone] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] 'delivery.create', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
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
                        string ok = string.Format("{0}", (string)response["status"]);
                        string resp = string.Format("id: {0},\n ФИО: {1},\n Дата рождения: {2},\n Телефон: {3}",  (string)response["response"]["id"], 
                                                            (string)response["response"]["fio"], 
                                                            (string)response["response"]["date_of_birth"],
                                                            (string)response["response"]["phone"]);

                        MessageBox.Show(resp, ok, MessageBoxButtons.OK, MessageBoxIcon.Information);
                    }
            }

            database.closeConnection();

        }

        private void add_delivery_Load(object sender, EventArgs e)
        {

        }
    }
}
