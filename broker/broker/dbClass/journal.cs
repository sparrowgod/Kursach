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
using NLog;

namespace broker
{
    public class journal
    {
        DataBase database = new DataBase();

        public string resp(string resp)
        {
            database.openConnection();

            var query = $"insert into [log] values (getdate(),'{resp}', 'ok', @@spid)";

            var cmd = new SqlCommand(query, database.GetConnection());
            cmd.ExecuteNonQuery();

            database.closeConnection();

            return resp;
        }
    }
}
