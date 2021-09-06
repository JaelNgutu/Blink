using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Website.BusinessLayer;

public partial class Product_UploadProduct : System.Web.UI.Page
{

   string filename;
    protected void Page_Load(object sender, EventArgs e)
    {

        //if (Session["UserID"] == null && !Request.Path.EndsWith("Login.aspx"))
        //{


        //    Response.Redirect("~/Accounts/Login.aspx");


        //}



        if (!IsPostBack)
        {

            if(Session["UserID"] == null)
            {
                LabelPost.Visible = true;

            }

            else if( Session["UserID"] != null)
            {
                LabelPost.Visible = false;
            }


            GetCategories();
        }
    }


    private void GetCategories()

    {


        Cart K = new Cart();
        DataTable dt = K.GetCategories();
        if (dt.Rows.Count > 0)
        {
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataTextField = "Category Name";
            ddlCategory.DataSource = dt;
            ddlCategory.DataBind();


        }
    }


    protected void ProductAdd_Click(object sender, EventArgs e)
    {

        if (Session["UserID"] == null)
        {
            Response.Redirect("/Accounts/Login.aspx");
        }



        if (ImgPrv != null)
        {

            saveProductPhoto();
           

            //alert show product added succesfully
          

        }
        else
        {

            LblImage.Visible = true;
        }
    }



    private void ClearText()
    {
        priceTB.Text = string.Empty;
        ProductDescriptionTB.Text = string.Empty;
        ProductNameTB.Text = string.Empty;
    }

   



    private void saveProductPhoto()

    {



        if (FileUpload1.PostedFile != null)


        {
            string filename = FileUpload1.PostedFile.FileName.ToString();

            Regex illegalInFileName = new Regex(@"[\\/:*?""\-<>|\+]");
            filename = illegalInFileName.Replace(filename, "-");

           
            string fileExt = System.IO.Path.GetExtension(FileUpload1.FileName);


           


           

            

            if (filename.Length > 96)
            {
                //alert image name should not exceed 96 characters
            }

            

            else if (fileExt != ".jpeg" && fileExt != ".jpg" && fileExt != ".png" && fileExt != ".bmp" && fileExt != ".JPEG" && fileExt != ".BMP" && fileExt != ".PNG" && fileExt != ".JPG")
            {
                LblImage.Visible = true;

            }
            else if (FileUpload1.PostedFile.ContentLength > 4000000)
            {
                //image should be less than 5mb

            }

            //save image to folder
            else
            {

                FileUpload1.SaveAs(Server.MapPath("/ProductImages/" + filename));

                Cart k = new Cart()
                {


                    ProductName = ProductNameTB.Text,
                    Image = "/ProductImages/" + filename,
                    Budget = Convert.ToInt32(priceTB.Text),
                    CategoryID = Convert.ToInt32(ddlCategory.SelectedValue),
                    CountryID = Convert.ToInt32(Session["CountryID"]),
                    UserID = Convert.ToInt32(Session["UserID"]),

                    Description = ProductDescriptionTB.Text,

                    //Convert.ToInt32(userTB.Text),
                };

                k.AddNewProduct();

                LabelScs.Visible = true;

                ClearText();
            }


        }
    }


}