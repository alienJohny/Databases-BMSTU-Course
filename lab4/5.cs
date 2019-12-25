using System;  
using System.Data.SqlClient;  
using Microsoft.SqlServer.Server;  
using System.Transactions;  
  
public partial class Triggers  
{  
    // Enter existing table or view for the target and uncomment the attribute line  
    // [Microsoft.SqlServer.Server.SqlTrigger (Name="trig_InsertValidator", Target="Table1", Event="FOR INSERT")]  
    public static void trig_InsertValidator()  
    {  
        using (SqlConnection connection = new SqlConnection(@"context connection=true"))  
        {  
            SqlCommand command;  
            SqlDataReader reader;  
            int value;  
  
            // Open the connection.  
            connection.Open();  
  
            // Get the inserted value.  
            command = new SqlCommand(@"SELECT * FROM INSERTED", connection);  
            reader = command.ExecuteReader();  
            reader.Read();  
            value = (int)reader[0];
            reader.Close();  
  
            // Rollback the transaction if a value of 1 was inserted.  
            if (1 == value)
            {  
                try  
                {  
                    // Get the current transaction and roll it back.  
                    Transaction trans = Transaction.Current;  
                    trans.Rollback();                      
                }  
                catch (SqlException ex)  
                {  
                    // Catch the expected exception.                      
                }  
            }  
            else  
            {  
                // Perform other actions here.  
            }  
  
            // Close the connection.  
            connection.Close();              
        }  
    }  
}  