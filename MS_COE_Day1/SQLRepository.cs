using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace MS_COE_Day1
{
    public class SQLRepository
    {
        public void AddCandidate(string name, string email)
        {
            using(SqlConnection connection = new SqlConnection("Mycon"))
            {
                using(SqlCommand command = new SqlCommand("AddCandidate"))
                {
                    connection.Open();
                    command.Parameters.AddWithValue("@Name", name);
                    command.Parameters.AddWithValue("@Email", email);
                    command.ExecuteNonQuery();
                }
            }
        }

        //update
        //delete
        //get
    }
}