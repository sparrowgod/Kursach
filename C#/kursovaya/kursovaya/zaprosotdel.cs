using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Data.SqlClient;
using System.Windows.Forms;

namespace kursovaya
{
    public partial class zaprosotdel : Form
    {
        public zaprosotdel()
        {
            InitializeComponent();
        }

        private void zaprosotdel_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.prise". При необходимости она может быть перемещена или удалена.
            this.priseTableAdapter.Fill(this.kursach1DataSet.prise);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Tovar". При необходимости она может быть перемещена или удалена.
            this.tovarTableAdapter.Fill(this.kursach1DataSet.Tovar);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.magazin". При необходимости она может быть перемещена или удалена.
            this.magazinTableAdapter.Fill(this.kursach1DataSet.magazin);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.zaved". При необходимости она может быть перемещена или удалена.
            this.zavedTableAdapter.Fill(this.kursach1DataSet.zaved);
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.Otdel". При необходимости она может быть перемещена или удалена.
            this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);
            SqlConnection connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True");
            SqlCommand cmd = new SqlCommand("SELECT * FROM zaved", connection);
            DataTable tbl = new DataTable();
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(tbl);
            comboBox1.DataSource = tbl;
            comboBox1.DisplayMember = "ФИО_заведующего";
            comboBox1.SelectedIndex = -1;
            SqlCommand cmd1 = new SqlCommand("SELECT * FROM magazin", connection);
            DataTable tbl1 = new DataTable();
            SqlDataAdapter da1 = new SqlDataAdapter(cmd1);
            da1.Fill(tbl1);
            comboBox2.DataSource = tbl1;
            comboBox2.DisplayMember = "Название_магазина";
            comboBox2.SelectedIndex = -1;

            connection.Open();
            string query = "SELECT Имя_отдела, ФИО_заведующего, Название_магазина FROM Otdel, magazin, zaved WHERE Otdel.Код_магазина=magazin.Код_магазина " +
                "AND Otdel.Код_заведующего=zaved.Код_заведующего ORDER BY Код_отдела";
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
                string query = "INSERT INTO Otdel VALUES ('" + textBox2.Text.ToString() + "',(SELECT " +
                    "Код_заведующего FROM zaved WHERE ФИО_заведующего='" + comboBox1.Text.ToString() + "'),(SELECT Код_магазина FROM magazin " +
                    "WHERE Название_магазина='" + comboBox2.Text.ToString() + "'))";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Отдел успешно добавлен");
                this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "DELETE FROM Otdel WHERE Имя_отдела='"+textBox2.Text.ToString()+"'";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Отдел успешно удален");
                this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);
            }
        }

        private void button3_Click(object sender, EventArgs e)
        {
            using (var connection = new SqlConnection("Data Source=(localdb)\\MSSQLLocalDB;Initial Catalog=kursach1;Integrated Security=True"))
            {
                connection.Open();
                string query = "UPDATE Otdel SET Имя_отдела='" + textBox2.Text.ToString() + "', " +
                    "Код_заведующего=(SELECT Код_заведующего FROM zaved WHERE ФИО_заведующего='" + comboBox1.Text.ToString() + "'), " +
                    "Код_магазина=(SELECT Код_магазина FROM magazin WHERE Название_магазина='" + comboBox2.Text.ToString() + "') " +
                    "WHERE Имя_отдела='" + dataGridView1.CurrentRow.Cells[0].Value.ToString() + "'";
                SqlCommand command = new SqlCommand(query, connection);
                command.ExecuteNonQuery();
                connection.Close();
                MessageBox.Show("Отдел успешно изменен");
                this.otdelTableAdapter.Fill(this.kursach1DataSet.Otdel);
            }
        }

        private void dataGridView1_CellContentClick(object sender, DataGridViewCellEventArgs e)
        {
            textBox2.Text = dataGridView1.CurrentRow.Cells[0].Value.ToString();
            comboBox1.Text = dataGridView1.CurrentRow.Cells[1].Value.ToString();
            comboBox2.Text = dataGridView1.CurrentRow.Cells[2].Value.ToString();
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void label4_Click(object sender, EventArgs e)
        {

        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void label2_Click(object sender, EventArgs e)
        {

        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}
