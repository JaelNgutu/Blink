using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin_Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserID"] == null)
        {

            LogoutButton.Visible = false;
            Response.Redirect("~/Posts.aspx");






        }

        if ((string)Session["UserID"] != 5.ToString())
        {
            Response.Redirect("~/Posts.aspx");

        }

        else
        {

            LoginButton.Visible = false;
            LogoutButton.Visible = true;


        }
    }




    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Posts.aspx");
    }
}
