using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Net.Mail;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Accounts_ForgotUsername : System.Web.UI.Page
{

    string userName;
    protected void Page_Load(object sender, EventArgs e)
    {

    }




    private void CheckEmailAvailability()

    {
       

        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand command = new SqlCommand("EmailAvailability", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@Email", SqlDbType.VarChar, 200);
        command.Parameters["@Email"].Value = Email.Text;
        command.Parameters.Add("@EmailCount", SqlDbType.Int);
        command.Parameters["@EmailCount"].Direction = ParameterDirection.Output;

        int count = 0;

        try
        {
            con.Open();
            command.ExecuteNonQuery();
            count = Convert.ToInt32(command.Parameters["@EmailCount"].Value);
        }
        catch (Exception ex)
        {
            Response.Write(ex.Message);
        }
        finally
        {
            con.Close();
        }

        if (count >= 1)
        {

            LabelR.Text = "Registered";

            //send email
            //LabelEmail.Visible = true;
        }
        else
        {

            LabelR.Text = "Not registered";
        }
    }


   
    private void getUsername()
    {


        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("User_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
          

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                

                
                userName = dt.Rows[0][1].ToString().Trim();



            }
            else
            {
               
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
            }
        }
        catch (Exception ex)
        {
         
            Response.Write("Oops!! following error occured: " + ex.Message.ToString());
        }
        finally
        {
            //dt.Clear();
            dt.Dispose();
            adp.Dispose();
        }

    }



    protected void ButtonSend_Click(object sender, EventArgs e)
    {
      

            CheckEmailAvailability();

        if (LabelR.Text == "Registered")
        {
            getUsername();

            MailMessage mailMessage = new MailMessage();
            mailMessage.To.Add(Email.Text);
            mailMessage.From = new MailAddress("contact@14Blink.com", "14Blink");
            mailMessage.Subject = "UserName";
            mailMessage.Body = "Your username for 14blink.com is" + " " +  userName + " "  + "If you did not request this, ignore this email";
            SmtpClient smtpClient = new SmtpClient("14Blink.com");
            smtpClient.Credentials = new System.Net.NetworkCredential("contact@14Blink.com", "cpass14");
            smtpClient.Host=( "mail.14Blink.com");
            mailMessage.Priority = MailPriority.High;
            smtpClient.Send(mailMessage);
            Labelsent.Visible = true;
            Email.Text = string.Empty;

        }

        else
        {
            EmailCheck.Visible = true;
        }

           



    }
}


