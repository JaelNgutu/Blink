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

public partial class MyPosts : System.Web.UI.Page
{

   
    private string comcount;
    protected void Page_Load(object sender, EventArgs e)
    {
        GetData();
       
    }


    private void GetData()
    {
        int UserID;
        UserID = Convert.ToInt32(Session["UserID"]);

        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("SP_UserPosts", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter searchParameter = new SqlParameter("@user", UserID);
            cmd.Parameters.Add(searchParameter);
            con.Open();
            RepeaterMy.DataSource = cmd.ExecuteReader();
            RepeaterMy.DataBind();
            con.Close();
        }
    }

            protected void LikeButtonCommandEvent(object source, RepeaterCommandEventArgs e)
    {
        
        var lbtn = e.Item.FindControl("LinkButton1") as LinkButton;
        if ((Session["UserID"]) == null)
        {
            Response.Redirect("/Accounts/Login.aspx");
        }

        else 
        {
            lbtn.BackColor = System.Drawing.Color.White;
            //remove like
            Cart k = new Cart()
            {
                UserID = Convert.ToInt32(Session["UserID"]),
                ProductID = Convert.ToInt32(e.CommandArgument)
            };
            k.RemoveLike();

            

         }

        Response.Redirect("~/MyPosts.aspx");
       
    }

    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lbl = e.Item.FindControl("lblcounot") as Label;
        var lbl2 = e.Item.FindControl("Label0") as Label;
        string name = lbl.Text;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmnd = new SqlCommand("select count (*) from Likes where ProductID='" + name + "' ", conn);

        conn.Open();

        int returnValue = (int)cmnd.ExecuteScalar();

        lbl.Text = returnValue.ToString();
        var proID = e.Item.FindControl("HiddenField4") as HiddenField;
        int postNo = Convert.ToInt32(proID.Value);
        SqlCommand comnd = new SqlCommand("select count (*) from Comments where ProductID='" + postNo + "' ", conn);
        int rValue = (int)comnd.ExecuteScalar();
        lbl2.Text = rValue.ToString();
        conn.Close();

    }


    }







