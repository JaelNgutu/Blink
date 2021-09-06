<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="MyPosts.aspx.cs" Inherits="MyPosts" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

  

    <asp:EntityDataSource ID="EDS_liked" 

        runat="server" ConnectionString="name=DatabaseEntities"
        AutoGenerateWhereClause="True"
         DefaultContainerName="DatabaseEntities" EnableFlattening="False"  Include="Product"
        OrderBy="it.[LikeID] desc"
        EntitySetName="Likes1">
     <WhereParameters>
           <asp:SessionParameter Name="UserID"  SessionField="userID" Type="Int32" />
        </WhereParameters>
        </asp:EntityDataSource>

     
   <div class="panel panel-default" >
    <div id="Tabs" role="tabpanel">
        <!-- Nav tabs -->
        <ul class="nav nav-tabs" role="tablist">
            <li class="active" ><a href="#myposts" aria-controls="myposts" role="tab" data-toggle="tab" >
               MY POSTS</a></li>
           <li><a href="#likes" aria-controls="employment" role="tab" data-toggle="tab">MY LIKES</a></li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content" style="padding-top: 20px">
            <div role="tabpanel" class="tab-pane active" id="myposts">

                 <div class="row">
    	<div class="col-md-12">

             <div class="form-horizontal">
                <h3 style="text-align:center">Items you've posted</h3>
                <hr />
                </div>

    <asp:Repeater ID="RepeaterMy" runat="server"  OnItemDataBound="Repeater1_ItemDataBound" >
             <ItemTemplate>

                 

                 <div class="col-lg-3 col-md-4 col-sm- col-xs-12  thumb ">
                     
				<div class="thumbnail" >
				  <div class="panel panel-default panelD">

                    <div class="panel-heading"  style="text-align:center">
                    <ul class="list-inline">
                        <li> <%# Eval("Product Name")%></l>
                    </ul>
                </div>

				    <a href='Product/ProductDetails.aspx/<%# Eval("Product Name") %>?pID=<%# Eval("ProductID") %>'>

                        <div class="panel-image">
                    <img src='<%#Eval("image")%>' alt='<%#Eval("Product Name")%>'  style="width: 300px;height: 200px;"></a>
                </div>

                        <div class="panel-body" style="padding-bottom:1px" >
                             <blockquote>


                                  <div class="row">
							<div class="col-md-12">
								<h5 style="text-align:left">My Budget: &#36</h5<label><%# Eval("Budget")%></label></h5> 

                                      <h5 style="text-align:left">Details: <asp:TextBox ID="TextBox3" runat="server"  MaxLength="19" BorderStyle="None" Text='<%# Eval("ProductDescription")%> ' ></asp:TextBox>   </h5>

                                </div>



                                 </blockquote>


                             <div class="row">
                                <div class="col-xs-6">
                                    <p >
                                        <span class="fa fa-thumbs-o-up"></span>
                                        <asp:Label ID="lblcounot" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label></span>
                                    </p>
                                </div>

                                <div class="col-xs-6">
                                    <p style="text-align: right"><span class="fa fa-comments"></span><span><asp:Label ID="Label0" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label></span></p>
                                </div>

                            </div>


                   </div>

                        <div class="row">
							<div class="col-md-12">
                                <asp:HiddenField ID="HiddenField4" runat="server" Value='<%# Eval("ProductID")%>' />
								 <%--<p style="text-align:center">Asked By:  <%# Eval("Userdata.Username")%> </p>--%>  
							</div>
							
						</div>

                       <div class="panel-footer" style="background-color:white; padding-top:5px">

                           <div class="row">
                           
                                <div class="col-lg-12">
                              
                                <a href='Product/ProductDetails.aspx/details?pID=<%# Eval("ProductID") %>'  class=" btn btn-default btn-md" style="width:100%"><span class="fa fa-eye"></span> View </a>
							</div>
						</div>
	</div>
					</div>
				</div>
			</div>

             

        </ItemTemplate>

         


    </asp:Repeater>

         </div>
        </div>

               
            </div>
            <div role="tabpanel" class="tab-pane" id="likes">

              <div class="row">
    	<div class="col-md-12">

             <div class="form-horizontal">
                <h3 style="text-align:center">Items you've liked</h3>
                <hr />
                </div>


            

    <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EDS_Liked" OnItemCommand="LikeButtonCommandEvent" >

        <ItemTemplate>

              

                 <div class="col-lg-3 col-md-4 col-sm- col-xs-12  thumb ">
                     
				<div class="thumbnail" >
				  <div class="panel panel-default panelD">

                    <div class="panel-heading"  style="text-align:center">
                    <ul class="list-inline">
                        <li> <%# Eval("Product.Product_Name")%></l>
                    </ul>
                </div>

				    <a href='Product/ProductDetails.aspx/<%# Eval("Product.Product_Name") %>?pID=<%# Eval("ProductID") %>'>

                        <div class="panel-image">
                    <img src='<%#Eval("Product.image")%>' alt='<%#Eval("Product.Product_Name")%>'  style="width: 300px;height: 200px;"></a>
                </div>

                        <div class="panel-body" style="padding-bottom:1px" >
                             <blockquote>


                                  <div class="row">
							<div class="col-md-12">
								<h5 style="text-align:left">Budget: &#36</h5<label><%# Eval("Product.Budget")%></label></h5> 

                                      <h5 style="text-align:left">Details: <asp:TextBox ID="TextBox1" runat="server"  MaxLength="19" BorderStyle="None" Text='<%# Eval("Product.ProductDescription")%> ' ></asp:TextBox>   </h5>

                                </div>



                                 </blockquote>


                           


                   </div>

                        <div class="row">
							<div class="col-md-12">
                                <asp:HiddenField ID="HiddenField1" runat="server" Value='<%# Eval("ProductID")%>' />
								 <%--<p style="text-align:center">Asked By:  <%# Eval("Userdata.Username")%> </p>--%>  
							</div>
							
						</div>

                       <div class="panel-footer" style="background-color:white; padding-top:5px">

                           <div class="row">
                            <div class="col-xs-6">
                              
                                <asp:LinkButton ID="LinkButton1" runat="server" AutoPostback="false" CssClass=" btn btn-default btn-md" style="width:100%" Text="UnLike"  CommandArgument='<%#Eval("ProductID") %>'  >UnLike <span class="fa fa-thumbs-o-down"> </asp:LinkButton>
                              
							</div>

                                <div class="col-xs-6">
                              
                                <a href='Product/ProductDetails.aspx/details?pID=<%# Eval("ProductID") %>'  class=" btn btn-default btn-md" style="width:100%"><span class="fa fa-eye"></span> View </a>
							</div>
						</div>
	</div>
					</div>
				</div>
			</div>

           

        </ItemTemplate>

         


    </asp:Repeater>
               

         </div>
        </div>

               
            </div>
</div>
        </div>
       </div>


</asp:Content>

