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

namespace kursovaya
{
    public partial class zaprosmagazin : Form
    {
        public zaprosmagazin()
        {
            InitializeComponent();
        }

        private void zaprosmagazin_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.magazin". При необходимости она может быть перемещена или удалена.
            this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            connection.Open();
            string query = "SELECT Название_магазина, Класс_магазина, Номер_магазина FROM magazin ORDER BY Код_магазина";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[3]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
            }

            reader.Close();

            connection.Close();

            foreach (string[] s in data)
                dataGridView1.Rows.Add(s);

        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "INSERT INTO magazin (Название_магазина, Класс_магазина, Номер_магазина)" +
                    " VALUES ('"+textBox2.Text.ToString()+"','"+textBox3.Text.ToString()+"','"+textBox4.Text.ToString()+"')";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Магазин успешно добавлен");
                this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "DELETE FROM magazin WHERE Название_магазина='"+ textBox2.Text.ToString()+"'";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Магазин успешно удален");
                this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "UPDATE magazin SET Название_магазина='"+textBox2.Text.ToString()+"', Класс_магазина='"+textBox3.Text.ToString()+"'," +
                    " Номер_магазина='"+textBox4.Text.ToString()+"' WHERE Название_магазина='"+ dataGridView1.CurrentRow.Cells[0].Value.ToString() + "'";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Магазин успешно изменен");
                this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            textBox3.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            textBox4.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
        }
    }
}
