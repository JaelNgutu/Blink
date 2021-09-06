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

public partial class Product_ProductDetails : System.Web.UI.Page
{

    
    int ProductID = 0;
    protected void Page_Load(object sender, EventArgs e)
    {
        
        
        
        

        if (!IsPostBack)
        {




            (FormView1.FindControl("ButtonDPost") as Button).Visible = false;

            



            Label err = (FormView1.FindControl("LabelRSub") as Label);
            err.Visible = false;


            if (Session["UserID"] != null)
            {
                (FormView1.FindControl("Label1") as Label).Visible = false;
                userCheck();
            }

            





        }







    }








    protected void AddCommnet_Btn_Click(object sender, EventArgs e)
    {
        //(FormView1.FindControl("LabelDate") as TextBox).Text = DateTime.Now.ToString();

        if (Session["UserID"] == null)
        {

            Label err = (FormView1.FindControl("Label1") as Label);
            err.Visible = true;

        }

        else
        {
            Cart k = new Cart()
            {


                ProductID = Int32.Parse(Request["pID"].ToString()),

                UserComment = (FormView1.FindControl("UserCommentTB") as TextBox).Text,

                UserID = Convert.ToInt32(Session["UserID"]),

                Link = (FormView1.FindControl("link") as TextBox).Text,


            };
            k.AddNewCommennt();
            ClearText();
            Response.Redirect(Request.RawUrl);

        }




    }

    private void ClearText()
    {

        TextBox txt = (TextBox)FormView1.FindControl("UserCommentTB");

        txt.Text = string.Empty;
    }






    public void ButtonDPost_Click(object sender, EventArgs e)
    {

        Cart k = new Cart()
        {
            ProductID = Int32.Parse(Request["pID"].ToString()),
        };
        k.DeleteProduct();

    }

    protected void userCheck()
    {
        DataTable dt = new DataTable();
        SqlDataAdapter adp = new SqlDataAdapter();
        try
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
            SqlCommand cmd = new SqlCommand("SP_userCheck", con);

            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@Pid", int.Parse(Request["pID"]));
            cmd.Parameters.AddWithValue("@Uid", (Session["UserID"]));


            adp.SelectCommand = cmd;
            adp.Fill(dt);
            cmd.Dispose();
            if (dt.Rows.Count > 0 || (string)Session["UserID"] == 5.ToString())
            {

                (FormView1.FindControl("ButtonDPost") as Button).Visible = true;


            }
            else
            {
                (FormView1.FindControl("ButtonDPost") as Button).Visible = false;

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

    protected void ButtonRPost_Click(object sender, EventArgs e)
    {

        Cart k = new Cart()
        {


            RProductID = Int32.Parse(Request["pID"].ToString()),


        };

        k.AddNewReport();

        (FormView1.FindControl("LabelRSub") as Label).Visible = true;
        (FormView1.FindControl("ButtonRPost") as Button).Visible = false;
        //handlercode

    }

   
    protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
    {
       
        try
        {

            if ((string)Session["UserID"] == 5.ToString())
            {

                e.Item.FindControl("LabelCID").Visible = true;

            }
            else
            {
                e.Item.FindControl("LabelCID").Visible = false;

            }
        }
        catch (Exception ex)
        {
            Response.Write("Oops!! following error occured: " + ex.Message.ToString());

        }

        finally
        {
           
        }

    }
}

   