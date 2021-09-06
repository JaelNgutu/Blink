using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using Website.DataLayer;

/// <summary>
/// Summary description for Website
/// </summary>

namespace Website.BusinessLayer
{

    public class Cart

    {
        public string CategoryName;
        public int CategoryID;
        public string other;

        public int CountryID;

        public string ProductName;
        public string Image;
        public int Budget;
        public string Description;
        public int ProductID;
        public int RProductID;

        public int UserID;
        public int CommentID;
        public string UserComment;
        public string Link;
        public string Date;



        public void AddNewCategory()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = Website.DataLayer.DataAccess.AddParamater("@CategoryName", CategoryName, System.Data.SqlDbType.VarChar, 200);
            
            DataTable dt = Website.DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewCategory", parameters);

        }

        public void AddNewProduct()
        {
            SqlParameter[] parameters = new SqlParameter[7];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductName", ProductName, System.Data.SqlDbType.NVarChar, 300);
            parameters[1] = DataLayer.DataAccess.AddParamater("@ProductPrice", Budget, System.Data.SqlDbType.NVarChar, 200);
            parameters[2] = DataLayer.DataAccess.AddParamater("@ProductImage", Image, System.Data.SqlDbType.NVarChar, 1000);
            parameters[3] = DataLayer.DataAccess.AddParamater("@ProductDescription", Description, System.Data.SqlDbType.NVarChar, 1000);
            parameters[4] = DataLayer.DataAccess.AddParamater("@CategoryID", CategoryID, System.Data.SqlDbType.NVarChar, 200);
            parameters[5] = DataLayer.DataAccess.AddParamater("@CountryID", CountryID, System.Data.SqlDbType.NVarChar, 200);
            parameters[6] = DataLayer.DataAccess.AddParamater("@UserID", UserID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewProduct", parameters);
        }

        public void AddNewFind()
        {
            SqlParameter[] parameters = new SqlParameter[8];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ItemName", ProductName, System.Data.SqlDbType.NVarChar, 300);
            parameters[1] = DataLayer.DataAccess.AddParamater("@ItemImage", Image, System.Data.SqlDbType.NVarChar, 1000);
            parameters[2] = DataLayer.DataAccess.AddParamater("@ItemDescription", Description, System.Data.SqlDbType.NVarChar, 1000);
            parameters[3] = DataLayer.DataAccess.AddParamater("@ItemPrice", Budget, System.Data.SqlDbType.NVarChar, 200);
            parameters[4] = DataLayer.DataAccess.AddParamater("@ProductID", ProductID, System.Data.SqlDbType.NVarChar, 200);
            parameters[5] = DataLayer.DataAccess.AddParamater("@CategoryID", CategoryID, System.Data.SqlDbType.NVarChar, 200);
            parameters[6] = DataLayer.DataAccess.AddParamater("@Link", Link, System.Data.SqlDbType.NVarChar, 200);
            parameters[7] = DataLayer.DataAccess.AddParamater("@Date", Date, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewFind", parameters);
        }


        public void AddNewReport()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductID", RProductID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewReport", parameters);

        }


        public void AddLike()
        {
            SqlParameter[] parameters = new SqlParameter[2];

            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductID", ProductID, System.Data.SqlDbType.NVarChar, 200);
            parameters[1] = DataLayer.DataAccess.AddParamater("@UserID", UserID, System.Data.SqlDbType.NVarChar, 200);

           
          
            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddLike", parameters);

        }


        public void RemoveLike()
        {
            SqlParameter[] parameters = new SqlParameter[2];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductID", ProductID, System.Data.SqlDbType.NVarChar, 200);
            parameters[1] = DataLayer.DataAccess.AddParamater("@UserID", UserID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_RemoveLike", parameters);

        }

    

        public void DeleteProduct()
        {

            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductID", ProductID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_delete", parameters);

        }


        public void DeleteComment()
        {
            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParamater("@Cid", CommentID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_DeleteComment", parameters);
        }


        public void IgnoreReport()
        {

            SqlParameter[] parameters = new SqlParameter[1];
            parameters[0] = DataLayer.DataAccess.AddParamater("@ProductID", RProductID, System.Data.SqlDbType.NVarChar, 200);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_IgnoreReport", parameters);

        }


        public void AddNewCommennt()
        {
            SqlParameter[] parameters = new SqlParameter[4];
            parameters[0] = DataLayer.DataAccess.AddParamater("@UserID", UserID, System.Data.SqlDbType.NVarChar, 200);
            parameters[1] = DataLayer.DataAccess.AddParamater("@ProductID", ProductID, System.Data.SqlDbType.NVarChar, 200);
            parameters[2] = DataLayer.DataAccess.AddParamater("@Comment", UserComment, System.Data.SqlDbType.NVarChar, 10000);
            parameters[3] = DataLayer.DataAccess.AddParamater("@link", Link, System.Data.SqlDbType.NVarChar, 5000);

            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("SP_AddNewComment", parameters);
        }

        public DataTable GetCategories()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("Sp_GetAllCategories", parameters);
            return dt;
        }

        public DataTable GetCountries()
        {
            SqlParameter[] parameters = new SqlParameter[0];
            DataTable dt = DataLayer.DataAccess.ExecuteDTByProcedure("Sp_GetAllCountries", parameters);
            return dt;
        }


    }
}
