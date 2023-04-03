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

namespace laba5
{
    public partial class FormAdmin : Form
    {
        public FormAdmin()
        {
            InitializeComponent();
        }

        private void button1_Click(object sender, EventArgs e)
        {
            try
            {
                sqlCommand1.Parameters["@login_"].Value = textBox1.Text;
                sqlCommand1.Parameters["@password1"].Value = textBox2.Text;
                sqlConnection1.Open();
                sqlCommand1.ExecuteNonQuery();
                sqlConnection1.Close();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Невозможно добавить пользователя!");
            }
        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                sqlCommand2.Parameters["@text1"].Value = "GRANT" +
                comboBox1.Text + "ON" + comboBox2.Text + "TO" +textBox3.Text;
                sqlConnection1.Open();
                sqlCommand1.ExecuteNonQuery();
                sqlConnection1.Close();
            }
            catch (SqlException ex)
            {
                MessageBox.Show("Невозможно добавление разрешения!");
            }
        }
    }
}
