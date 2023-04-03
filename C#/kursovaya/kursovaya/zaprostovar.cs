using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Data.SqlClient;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kursovaya
{
    public partial class zaprostovar : Form
    {
        public zaprostovar()
        {
            InitializeComponent();
        }

        private void zapros_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.prise". При необходимости она может быть перемещена или удалена.
            this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Otdel". При необходимости она может быть перемещена или удалена.
            this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Tovar". При необходимости она может быть перемещена или удалена.
            this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT * FROM Otdel", connection);
            DataTable tbl = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(tbl);
            comboBox1.DataSource = tbl;
            comboBox1.DisplayMember = "Имя_отдела";
            comboBox1.SelectedIndex = -1;
            connection.Open();
            string query = "SELECT Имя_товара, Сорт_товарва, Количество_товара, Цена_товара, Имя_отдела FROM Tovar, Otdel, prise" +
                " WHERE Tovar.Код_товара=prise.Код_товара AND prise.Код_отдела=Otdel.Код_отдела ORDER BY Код_магазина";
            SqlCommand command = new SqlCommand(query, connection);
            SqlDataReader reader = command.ExecuteReader();
            List<string[]> data = new List<string[]>();
            while (reader.Read())
            {
                data.Add(new string[5]);

                data[data.Count - 1][0] = reader[0].ToString();
                data[data.Count - 1][1] = reader[1].ToString();
                data[data.Count - 1][2] = reader[2].ToString();
                data[data.Count - 1][3] = reader[3].ToString();
                data[data.Count - 1][4] = reader[4].ToString();
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
                string query = "INSERT INTO Tovar (Имя_товара, Сорт_товарва, Количество_товара) VALUES " +
                    "('" +textBox2.Text.ToString()+"','" + textBox3.Text.ToString() + "','" + textBox4.Text.ToString() + "')" +
                    "INSERT INTO prise (Код_отдела, Код_товара, Цена_товара) VALUES ((SELECT Код_отдела FROM Otdel " +
                    "WHERE Имя_отдела='"+comboBox1.Text.ToString()+"'),(SELECT MAX(Код_товара) FROM Tovar),'"+textBox5.Text.ToString()+"')";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                dataGridView1.Update();
                connection.Close();
                MessageBox.Show("Товар успешно добавлен");
                this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
                this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "DELETE FROM prise WHERE Имя_товара='"+textBox2.Text.ToString()+"'" +
                    "WHERE Tovar.Код_товара=prise.Код_товара AND Otdel.Код_отдела=prise.Код_отдела " +
                    "AND Имя_отдела='" + dataGridView1.CurrentRow.Cells[4].Value.ToString() + "' AND Tovar.Имя_товара='" + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "'" +
                    " AND prise)" +
                    "DELETE FROM Tovar WHERE Код_товара=(SELECT Код_товара FROM Tovar, prise, Otdel" +
                    " WHERE Tovar.Код_товара=prise.Код_товара AND Otdel.Код_отдела=prise.Код_отдела " +
                    "AND Имя_отдела='"+ dataGridView1.CurrentRow.Cells[4].Value.ToString() + "' AND Tovar.Имя_товара='" + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "'" +
                    " AND prise)";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                dataGridView1.Update();
                connection.Close();
                MessageBox.Show("Товар успешно удален");
                this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
                this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "UPDATE Tovar SET Имя_товара='" + textBox2.Text.ToString() + "', Сорт_товарва='" + textBox3.Text.ToString() + "'," +
                    " Количество_товара='" + textBox4.Text.ToString() + "' WHERE Имя_товара='" + dataGridView1.CurrentRow.Cells[0].Value.ToString()+"' AND" +
                    " Код_товара=(SELECT Код_товара FROM prise, Otdel, Tovar WHERE Tovar.Код_товара=prise.Код_товара AND Otdel.Код_отдела=prise.Код_отдела AND Otdel.Имя_отдела='"+ dataGridView1.CurrentRow.Cells[4].Value.ToString() + "');" +
                    "UPDATE prise SET Код_отдела=(SELECT Код_отдела FROM Otdel WHERE Имя_отдела='" + dataGridView1.CurrentRow.Cells[4].Value.ToString() + "'), " +
                    "Цена_товара='" + textBox5.Text.ToString()+ "', Код_товара='"+ dataGridView1.CurrentRow.Cells[0].Value.ToString() + "' WHERE Код_товара=(SELECT Код_товара FROM Tovar, prise, Otdel " +
                    "WHERE Tovar.Имя_товара='" + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "' AND Tovar.Код_товара=prise.Код_товара AND prise.Код_отдела=Otdel.Код_отдела" +
                    " AND Otdel.Имя_отдела='"+ dataGridView1.CurrentRow.Cells[4].Value.ToString() + "')";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Товар успешно изменен");
                this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
                this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            textBox3.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            textBox4.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
            textBox5.Text = dataGridView1.CurrentRow.Cells[3].Value.ToString();
            comboBox1.Text = dataGridView1.CurrentRow.Cells[4].Value.ToString();
        }
    }
}
