using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.BusinessLayer;
using System.Globalization;

public partial class Accounts_Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
       


        if (!IsPostBack)
        {
            GetCountries();
            LabelUser.Visible = false;
            LabelEmail.Visible = false;

        }

        
    }


    private void GetCountries()

    {


        Cart K = new Cart();
        DataTable dt = K.GetCountries();
        if (dt.Rows.Count > 0)
        {
            ddlCountry.DataValueField = "CountryID";
            ddlCountry.DataTextField = "Country Name";
            ddlCountry.DataSource = dt;
            ddlCountry.DataBind();


        }
    }

    protected void btReg_Click(object sender, EventArgs e)
    {


        try
        {

            CheckUserNameAvailability();
            CheckEmailAvailability();

            if(LabelEmail.Text == "Available" && LabelUser.Text== "Available")
            {

                regUSer();
            }

            else
            {

                
            }

        }

       
        catch (Exception ex)
        {
            Response.Write("Error:" + ex.ToString());
        }

    }

  public void CheckUserNameAvailability()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand command = new SqlCommand("UserNameAvailability", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@UserName", SqlDbType.VarChar, 100);
        command.Parameters["@UserName"].Value = tbUsername.Text;
        command.Parameters.Add("@UserNameCount", SqlDbType.Int);
        command.Parameters["@UserNameCount"].Direction = ParameterDirection.Output;

        int count = 0;

        try
        {
            con.Open();
            command.ExecuteNonQuery();
            count = Convert.ToInt32(command.Parameters["@UserNameCount"].Value);
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

            LabelUser.Visible = true;
           LabelUser.Text = "Username already in use";

        }
        else
        {
            LabelUser.Visible = false;
            LabelUser.Text = "Available";
            
        }
    }



    private void CheckEmailAvailability()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand command = new SqlCommand("EmailAvailability", con);
        command.CommandType = CommandType.StoredProcedure;
        command.Parameters.Add("@Email", SqlDbType.VarChar, 200);
        command.Parameters["@Email"].Value = tbEmail.Text;
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
           
            LabelEmail.Text = "Email already in use";
            LabelEmail.Visible = true;
        }
        else
        {
           
            LabelEmail.Text = "Available";
            LabelEmail.Visible = false;
        }
    }


    public void regUSer()
    {

        TextInfo textInfo = new CultureInfo("en-US",false).TextInfo;

        string gender = string.Empty;
        if (RadioButtonListGender.SelectedItem.Value == "Male")
        {
            gender = "Male";
        }
        else if (RadioButtonListGender.SelectedItem.Value == "Female")
        {
            gender = "Female";
        }

       

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        conn.Open();
        string insertQuery = "INSERT INTO [Userdata] ([Username],[Email],[Gender],[Type],[CountryID]) VALUES (@Uname ,@email ,@gnd , @type ,@country)";
        SqlCommand com = new SqlCommand(insertQuery, conn);
        com.Parameters.AddWithValue("@Uname", textInfo.ToTitleCase(tbUsername.Text));
        com.Parameters.AddWithValue("@email", tbEmail.Text);
        com.Parameters.AddWithValue("@gnd", gender);
        com.Parameters.AddWithValue("@type", "User");
        com.Parameters.AddWithValue("@country", Convert.ToInt32(ddlCountry.SelectedValue));

        

        com.ExecuteNonQuery();



        
        conn.Close();

        tbEmail.Text= string.Empty;
        tbUsername.Text = string.Empty;
        

        lblScs.Visible = true;


    }



}