using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;

namespace kursovaya
{
    public partial class zaveduyush : Form
    {
        public zaveduyush()
        {
            InitializeComponent();
        }

        private void zaveduyush_Load(object sender, EventArgs e)
        {
            // TODO: данная строка кода позволяет загрузить данные в таблицу "kursach1DataSet.zaveduyush". При необходимости она может быть перемещена или удалена.
            this.zaveduyushTableAdapter.Fill(this.kursach1DataSet.zaveduyush);

        }
    }
}
