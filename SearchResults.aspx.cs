using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using Website.BusinessLayer;

public partial class SearchResults : System.Web.UI.Page
{
    private int i;
    private string comcount;
    protected void Page_Load(object sender, EventArgs e)
    {

       
            GetData(Master.SearchTerm);
       

    }

    protected void Page_Init(object sender, EventArgs e)
    {
        Master.SearchButton.Click += new EventHandler(SearchButton_Click);
    }

    protected void SearchButton_Click(object sender, EventArgs e)
    {

        GetData(Master.SearchTerm);
        
    }

    private void GetData(string searchTerm)
    {
        string cs = ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
        using (SqlConnection con = new SqlConnection(cs))
        {
            SqlCommand cmd = new SqlCommand("spSearch", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlParameter searchParameter = new SqlParameter("@SearchTerm", searchTerm ?? string.Empty);
            cmd.Parameters.Add(searchParameter);
            con.Open();
            Repeater1.DataSource = cmd.ExecuteReader();
            Repeater1.DataBind();
        }
    }


    protected void Repeater1_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        var lbl = e.Item.FindControl("lblcount") as Label;
        var lbl2 = e.Item.FindControl("Label2") as Label;
        string name = lbl.Text;

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);
        SqlCommand cmnd = new SqlCommand("select count (*) from Likes where ProductID='" + name + "' ", conn);

        conn.Open();

        int returnValue = (int)cmnd.ExecuteScalar();

        lbl.Text = returnValue.ToString();





        var proID = e.Item.FindControl("HiddenField1") as HiddenField;
        int postNo = Convert.ToInt32(proID.Value);


        SqlCommand comnd = new SqlCommand("select count (*) from Comments where ProductID='" + postNo + "' ", conn);



        int rValue = (int)comnd.ExecuteScalar();

        lbl2.Text = rValue.ToString();

        conn.Close();


        //highlighting previously liked posts

        if ((Session["UserID"]) != null)
        {




            DataTable dt = new DataTable();
            SqlDataAdapter adp = new SqlDataAdapter();
            try
            {
                var postID = e.Item.FindControl("HiddenField1") as HiddenField;

                SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString);

                con.Open();
                SqlCommand cmd = new SqlCommand("SP_likeCheck", con);

                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@Pid", Convert.ToInt64(postID.Value));
                cmd.Parameters.AddWithValue("@Uid", (Session["UserID"]));


                adp.SelectCommand = cmd;
                adp.Fill(dt);
                cmd.Dispose();
                con.Close();
                if (dt.Rows.Count > 0 || (string)Session["UserID"] == 5.ToString())
                {

                    var lbtn = e.Item.FindControl("LinkButton1") as LinkButton;
                    var lblc = e.Item.FindControl("lblcount") as Label;

                    lbtn.BackColor = System.Drawing.Color.FromArgb(37, 178, 176);


                }
                else
                {


                }

            }
            catch (Exception ex)
            {
                Response.Write("Oops!! following error occured: " + ex.Message.ToString());

            }

            finally
            {

                conn.Close();
                //dt.Clear();
                dt.Dispose();
                adp.Dispose();
            }

        }






    }



    protected void LikeButtonCommandEvent(object source, RepeaterCommandEventArgs e)
    {
        var lbl = e.Item.FindControl("lblcount") as Label;
        var lbtn = e.Item.FindControl("LinkButton1") as LinkButton;
        if ((Session["UserID"]) == null)
        {
            Response.Redirect("/Accounts/Login.aspx");
        }

        else if (lbtn.BackColor == System.Drawing.Color.FromArgb(37, 178, 176))
        {
            lbtn.BackColor = System.Drawing.Color.White;
            //remove like
            Cart k = new Cart()
            {
                UserID = Convert.ToInt32(Session["UserID"]),
                ProductID = Convert.ToInt32(e.CommandArgument)
            };
            k.RemoveLike();



            i = Int32.Parse(lbl.Text);
            i--;
            lbl.Text = i.ToString();
        }

        else
        {
            //adding like

            lbtn.BackColor = System.Drawing.Color.FromArgb(37, 178, 176);

            i = Convert.ToInt32(lbl.Text);
            i++;
            lbl.Text = i.ToString();





            Cart k = new Cart()
            {

                UserID = Convert.ToInt32(Session["UserID"]),
                ProductID = Convert.ToInt32(e.CommandArgument)
                //ProductID = Convert.ToInt32((source as LinkButton).CommandArgument)

            };
            k.AddLike();




        }



    }




}
        
