using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace taskAjax28_12
{
    public partial class taskAjax : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            SqlConnection connection = new SqlConnection("data source=DESKTOP-HDRIDJ6\\SQLEXPRESS; database=ajax; integrated security=SSPI");
            connection.Open();
            SqlCommand command = new SqlCommand($"insert into ajax values('{TextBox1.Text}')", connection);
            command.ExecuteNonQuery();



            SqlCommand sqlCommand = new SqlCommand("select * from ajax", connection);

            SqlDataReader reader = sqlCommand.ExecuteReader();

            while (reader.Read())
            {
                Label1.Text = reader[1].ToString();

                
                //Response.Write("");

            }

            connection.Close();


            ScriptManager.RegisterClientScriptBlock(this.Page, this.Page.GetType(), "alert",
               "swal('Good job!', 'Message added seccessfully ')", true);
        }
    }
    }
