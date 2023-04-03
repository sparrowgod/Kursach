using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kursovaya
{
    public partial class zaproszaved : Form
    {
        public zaproszaved()
        {
            InitializeComponent();
        }

        private void zaproszaved_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.zaved". При необходимости она может быть перемещена или удалена.
            this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            connection.Open();
            string query = "SELECT ФИО_заведующего, Телефон_заведующего FROM zaved ORDER BY Код_заведующего";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[2]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
            }

            reader.Close();

            connection.Close();

            foreach (string[] s in data)
                dataGridView2.Rows.Add(s);
        }

        private void button1_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "INSERT INTO zaved (ФИО_заведующего, Телефон_заведующего)" +
                    " VALUES ('" + textBox2.Text.ToString() + "','" + textBox3.Text.ToString() + "')";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Заведующий успешно добавлен");
                this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "DELETE FROM zaved WHERE ФИО_заведующего='"+textBox2.Text.ToString()+"'";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Заведующий успешно удален");
                this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "UPDATE zaved SET ФИО_заведующего='" + textBox2.Text.ToString() + "'," +
                    " Телефон_заведующего='" + textBox3.Text.ToString() + "' WHERE Код_заведующего=(SELECT Код_заведующего FROM zaved " +
                    "WHERE ФИО_заведующего='"+ dataGridView2.CurrentRow.Cells[0].Value.ToString() + "')";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Заведующий успешно изменен");
                this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            }
        }

        private void dataGridView2_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView2.CurrentRow.Cells[0].Value.ToString();
            textBox3.Text = dataGridView2.CurrentRow.Cells[1].Value.ToString();
        }
    }
}
