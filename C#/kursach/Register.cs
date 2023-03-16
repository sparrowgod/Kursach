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
    public partial class Register : Form
    {
        DataBase database = new DataBase();
        public Register()
        {
            InitializeComponent();
            StartPosition = FormStartPosition.CenterScreen;
        }

        private void Register_Load(object sender, EventArgs e)
        {
            textBox_password.PasswordChar = '*';
            textBox_login.MaxLength = 50;
            textBox_password.MaxLength = 50;
        }

        private void btnRegister_Click(object sender, EventArgs e)
        {
            var login = textBox_login.Text;
            var password = textBox_password.Text;

            string queryString = $"insert into [users] ([id], [login], [password]) values (newid(), '{login}', '{password}')";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            database.openConnection();

            if (command.ExecuteNonQuery() == 1)
            {
                MessageBox.Show("Аккант успешно создан!", "Успешно!");
                Form1 frm1 = new Form1();
                this.Hide();
                frm1.ShowDialog();

            }
            else
            {
                MessageBox.Show("Аккаунт не создан!");
            }
            database.closeConnection();
        }

        private Boolean checkuser()
        {
            var loginUser = textBox_login.Text;
            var passUser = textBox_password.Text;
            
            SqlDataAdapter adapter = new SqlDataAdapter();
            DataTable table = new DataTable();
            string queryString = $"select * from [users] where [login] = '{loginUser}' and [password] = '{passUser}'";

            SqlCommand command = new SqlCommand(queryString, database.GetConnection());

            adapter.SelectCommand = command;
            adapter.Fill(table);

            if(table.Rows.Count > 0)
            {
                MessageBox.Show("Пользователь уже существует!");
                return true;
            }
            else
            {
                return false;
            }
        }


    }
}
