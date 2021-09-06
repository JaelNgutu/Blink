using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Accounts_Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            

            if (Request.Cookies["EML"] != null && Request.Cookies["USN"] != null)
            {
                Email.Text = Request.Cookies["EML"].Value;
                Username.Attributes["value"] = Request.Cookies["USN"].Value;
                CheckBox1.Checked = true;

                

            }
        }



    }

    protected void Login_Click(object sender, EventArgs e)
    {
        

        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("Login_Check_Sp", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@email", Email.Text.Trim());
            cmd.Parameters.AddWithValue("@usn", Username.Text.Trim());

            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0)
            {

                string userID;
                userID = dt.Rows[0][0].ToString().Trim();

                string countryID;
                countryID = dt.Rows[0][5].ToString().Trim();

                string userName;
                userName = dt.Rows[0][1].ToString().Trim();

                string me;
                me = dt.Rows[0][1].ToString().Trim();

                string Usertype;
                Usertype = dt.Rows[0][4].ToString().Trim();

                if (CheckBox1.Checked == true)
                {

                    Response.Cookies["EML"].Value = Email.Text;
                    Response.Cookies["USN"].Value = Username.Text;

                    Response.Cookies["EML"].Expires = DateTime.Now.AddDays(14);
                    Response.Cookies["USN"].Expires = DateTime.Now.AddDays(14);
                }

                else if(CheckBox1.Checked == false)
                {
                    Response.Cookies["EML"].Expires = DateTime.Now.AddDays(-1);
                    Response.Cookies["USN"].Expires = DateTime.Now.AddDays(-1);
                }


                if (Usertype=="User" &&  userID == 5.ToString())
                {

                   

                    Session["UserID"] = userID;
                    Session["CountryID"] = countryID;
                    Response.Redirect("~/Admin/Admin.aspx");

                    //lblMsg.Text = "Login Successfull";
                }

                if (Usertype == "User")
                {
                    //lblMsg.Text = "Correct Password";
                    //TextBox1.Text = userID;
                    //TextBox2.Text = countryID;
                    Session["UserID"] = userID;
                    Session["CountryID"] = countryID;
                    Session["UserName"] = userName;


                    Response.Redirect("~/Posts.aspx");
                    //Response.Redirect("~/Product/UploadProduct.aspx");
                }

               

                //Or in show messagebox using  ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Login Successfull');", true);
                //Or write using Response.Write("Login Successfull");
                //Or redirect using Response.Redirect("Mypanel.aspx");
            }
            else
            {
                lblError.Text = "Wrong Email/Username";
                //Or show in messagebox usingScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Wrong Username/Password');", true);
                //Or write using Response.Write("Wrong Username/Password");
            }
        }
        catch (Exception ex)
        {
            //ScriptManager.RegisterStartupScript(this, this.GetType(), "Message", "alert('Oops!! following error occured : " + ex.Message.ToString() + "');", true);
            Response.Write("Oops!! following error occured: " + ex.Message.ToString());
        }
        finally
        {
            //dt.Clear();
            dt.Dispose();
            adp.Dispose();
        }


    }
}