using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class FoundItems : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

            if (Session["UserID"] == null)
            {
                userNameBtn.Visible = false;
                LogoutButton.Visible = false;



            }
            else
            {
                RegisterButton.Visible = false;
                LoginButton.Visible = false;
                LogoutButton.Visible = true;
                userNameBtn.Text = "MyPosts";
                //userNameBtn.Text = Convert.ToString(Session["UserName"]);

            }
        }

    }


    protected void LogoutButton_Click(object sender, EventArgs e)
    {
        Session.Clear();
        Response.Redirect("~/Posts.aspx");
    }
}