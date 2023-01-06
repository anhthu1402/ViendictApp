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
                SqlCmd.Parameters.Add("@CurrentID", SqlDbType.Int).Direction = ParameterDirection.Output;
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
        public static UserAccount UserSignup(UserAccount user)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("UserLoginName", user.UserLoginName);
            param.Add("Password", user.Password);
            param.Add("Email", user.Email);
            int kq = int.Parse(Exec_Command("UserSignup", param).ToString());
            if (kq > -1)
                user.UserID = kq;
            return user;
        }
        public static int AddToFavorite(Favorite favorite)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("Word", favorite.Word);
            int kq = int.Parse(Exec_Command("Proc_AddToFavorite", param).ToString());
            return kq;
        }
        public static UserAccount UserSignin(string Email, string Password)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("Email", Email);
            param.Add("Password", Password);
            DataTable notify = ReadTable("UserSignin", param);
            UserAccount result = new UserAccount();
            if (notify.Rows.Count > 0)
            {
                result.UserID = int.Parse(notify.Rows[0]["UserID"].ToString());
                result.UserLoginName = notify.Rows[0]["UserLoginName"].ToString();
                result.Email = notify.Rows[0]["Email"].ToString();
                result.Password = notify.Rows[0]["Password"].ToString();
            }
            else
                result.UserID = 0;
            return result;
        }
        public static int UpdateAccount(UserAccount user)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("UserID", user.UserID);
            param.Add("UserLoginName", user.UserLoginName);
            param.Add("Email", user.Email);
            int kq = int.Parse(Exec_Command("UpdateAccount", param).ToString());
            return kq;
        }
        public static int ChangePassword(UserAccount user)
        {
            Dictionary<string, object> param = new Dictionary<string, object>();
            param.Add("UserID", user.UserID);
            param.Add("Email", user.Email);
            param.Add("Password", user.Password);
            int kq = int.Parse(Exec_Command("Proc_ChangePassword", param).ToString());
            return kq;
        }
    }
}