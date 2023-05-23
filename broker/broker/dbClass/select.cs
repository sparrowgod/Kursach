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
    public class select
    {
        DataBase database = new DataBase();
        private static Logger logger = LogManager.GetCurrentClassLogger();

        public string company_edit(string metod, string ID, string name, string industry)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id], {name} [name], {industry} [industry] for json path, without_array_wrapper)," +
                          $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string metod_active(string metod, string ID)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id] for json path, without_array_wrapper)," +
                          $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string stock_create(string metod, string ID, string price)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [comp_id], {price} [price] for json path, without_array_wrapper)," +
                          $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string broker_client(string id_client)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"select [broker_id] as 'result' from [broker_client] with (nolock) where [client_id] = {id_client}";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string port_client(string id_client)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"select [id] as 'result' from [portfolio] with (nolock) where [client_id] = {id_client}";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string buy_stock(string metod, string idclient, string idcomp, string idbroker, string idport, string quant)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {idclient} [client_id]," +
                                                                $" {idcomp} [comp_id], " +
                                                                $"'{idbroker}' [broker_id]," +
                                                                $" '{idport}' [port_id]," +
                                                                $" {quant} [quantity]   for json path, without_array_wrapper)," +
                          $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string id_deal(string id_comp)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"select top 1 [id] as 'result' from [port_company] with (nolock) where [comp_id] = {id_comp}";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string buy_stock(string metod, string idclient, string idbroker, string iddeal)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {idclient} [client_id]," +
                                                                $"'{idbroker}' [broker_id]," +
                                                                $" '{iddeal}' [id]   for json path, without_array_wrapper)," +
                          $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";

            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string broker_add(string metod, string name, string comsn)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {name} [name], {comsn} [commission] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string broker_edit(string metod, string ID, string name, string commsn)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id], {name} [name], {commsn} [commission] for json path, without_array_wrapper)," +
                                      $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string client_add(string metod, string fio, string dob, string pas)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {fio} [fio], {dob} [date_of_birthday], {pas} [passport] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string client_edit(string metod, string ID, string fio, string pas)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID} [id], {fio} [fio], {pas} [passport] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string client_line(string metod, string ID_client, string name_broker)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID_client} [client_id], (select [id] from [broker] with (nolock) where [name] = {name_broker}) [broker_id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }

        public string client_sub(string metod, string ID_client)
        {
            try
            {
                database.openConnection();
            }
            catch (Exception ex)
            {
                logger.Error($"Обработано исключение: {ex}");
            }

            var addQuery = $"declare @js nvarchar(max) = (select {ID_client} [client_id] for json path, without_array_wrapper)," +
                           $" @rp nvarchar(max) exec [dbo].[ms_api] '{metod}', @js, @rp out select @rp as [result]";


            var command = new SqlCommand(addQuery, database.GetConnection());

            SqlDataReader reader = command.ExecuteReader();
            string res = string.Empty;
            while (reader.Read())
            {
                res += reader["result"];
            }
            database.closeConnection();

            return res;
        }
    }
}
