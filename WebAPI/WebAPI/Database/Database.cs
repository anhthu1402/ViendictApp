using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using WebAPI.Controllers;

namespace WebAPI.Database
{
    public class Database
    {
        public static DataTable ReadTable(string StoredProcedureName, Dictionary<string, object> para = null)
        {
            string SQLConnectionString = ConfigurationManager.ConnectionStrings["ViendictConnectionString"].ConnectionString;
            DataTable resultTable = new DataTable("table1");
            using (SqlConnection connection = new SqlConnection(SQLConnectionString))
            {
                connection.Open();
                SqlCommand Cmd = connection.CreateCommand();
                Cmd.Connection = connection;
                Cmd.CommandText = StoredProcedureName;
                Cmd.CommandType = CommandType.StoredProcedure;
                if (para != null)
                {
                    foreach (KeyValuePair<string, object> data in para)
                    {
                        if (data.Value == null)
                        {
                            Cmd.Parameters.AddWithValue("@" + data.Key, DBNull.Value);
                        }
                        else
                        {
                            Cmd.Parameters.AddWithValue("@" + data.Key, data.Value);
                        }
                    }
                }
                try
                {
                    SqlDataAdapter sqlDA = new SqlDataAdapter();
                    sqlDA.SelectCommand = Cmd;
                    sqlDA.Fill(resultTable);
                }
                catch (Exception ex)
                {

                }
            }
            return resultTable;
        }
        public static object Exec_Command(string StoredProcedureName, Dictionary<string, object> para = null)
        {
            string SQLConnectionString = ConfigurationManager.ConnectionStrings["ViendictConnectionString"].ConnectionString;
            object result = null;
            using (SqlConnection connection=new SqlConnection(SQLConnectionString))
            {
                connection.Open();
                SqlCommand SqlCmd = connection.CreateCommand();

                // Start a local transaction

                SqlCmd.Connection = connection;
                SqlCmd.CommandText = StoredProcedureName;
                SqlCmd.CommandType = CommandType.StoredProcedure;

                if(para !=null)
                {
                    foreach(KeyValuePair<string,object> data in para)
                    {
                        if(data.Value==null)
                        {
                            SqlCmd.Parameters.AddWithValue("@" + data.Key, DBNull.Value);
                        }
                        else
                        {
                            SqlCmd.Parameters.AddWithValue("@" + data.Key, data.Value);
                        }
                    }
                }
                SqlCmd.Parameters.AddWithValue("@CurrentID", SqlDbType.Int).Direction = ParameterDirection.Output;
                try
                {
                    SqlCmd.ExecuteNonQuery();
                    result = SqlCmd.Parameters["@CurrentID"].Value;
                    // Attempt to commit the transaction.
                }
                catch (Exception ex)
                {
                    result = null;
                }
            }
            return result;
        }
    }
}