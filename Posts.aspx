<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Posts.aspx.cs" Inherits="Posts" MetaKeywords="Find,looking,get,help" MetaDescription="If you're looking for items to buy or worjing with a budget just post it on our website and we'll help you out whatever it may be"  %>




<asp:content id="Content1" contentplaceholderid="ContentPlaceHolder1" runat="Server">
      <link href="Style/StyleSheet.css" rel="stylesheet"/>
   
      <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
       
       
       

        </script>

  

    <asp:entitydatasource id="EDS_ProductsByCategory" autogeneratewhereclause="True" include="Userdata" connectionstring="name=DatabaseEntities" defaultcontainername="DatabaseEntities" runat="server" entitysetname="Products" enableflattening="False" orderby="it.[ProductID] desc" entitytypefilter="Product">

              <WhereParameters>
                  <asp:QueryStringParameter Name="CategoryID" QueryStringField="CategoryId" Type="Int32" />
              </WhereParameters>

          </asp:entitydatasource>


         <asp:ScriptManager ID="ScriptManager1" runat="server">



                    </asp:ScriptManager>
    

        <div class="row" >

            <div class="col-md-12">

            <div class="form-horizontal">
                <h3 style="text-align:center">Welcome to 14Blink. Home of user sourced goods and services</h3>

                <hr />
                </div>


            </div>

            </div>


    
    <div class="row">
      
   



   

    </div>

         <hr />
            
    <div class="row">
    	<div class="col-md-12">

            <div class="form-horizontal">
                <h3 style="text-align:center">Help users find  these items:</h3>
                <hr />

                 <p style="text-align:center" ><a class="btn btn-default btn-md"  href="Product/UploadProduct.aspx" role="button" style="background-color:#25B2B0;color:white;width:200px">Post Item </a></p>
                </div>

  
             <div class="container"  >
          <asp:Repeater ID="Repeater1" runat="server"  DataSourceID="EDS_ProductsByCategory"  OnItemCommand="LikeButtonCommandEvent"  OnItemDataBound="Repeater1_ItemDataBound"   >

               <ItemTemplate>

                    <asp:UpdatePanel ID="UpdatePanel2" runat="server" UpdateMode="Conditional" ChildrenAsTriggers="true" >

                 <Triggers> 
    <asp:AsyncPostBackTrigger ControlID="Repeater1" EventName="ItemCommand" /> 
</Triggers> 
                <ContentTemplate>

                               <%-- col-sm-3 col-md-3--%>
                  

                 <div class="col-lg-3 col-md-4 col-sm- col-xs-12  thumb ">
                     
				<div class="thumbnail" >
				  <div class="panel panel-default panelD">

                    <div class="panel-heading"  style="text-align:center">
                    <ul class="list-inline">
                        <li> <%# Eval("Product_Name")%></l>
                    </ul>
                </div>

				    <a href='Product/ProductDetails.aspx/<%# Eval("Product_Name") %>?pID=<%# Eval("ProductID") %>'>

                        <div class="panel-image">
                    <img src='<%#Eval("image")%>' alt='<%#Eval("Product_Name")%>'  style="width: 300px;height: 200px;"></a>
                </div>

                        <div class="panel-body" style="padding-bottom:1px" >
                             <blockquote>


                                  <div class="row">
							<div class="col-md-12">
								<h5 style="text-align:left">My Budget: &#36</h5<label><%# Eval("Budget")%></label></h5> 

                                      <h5 style="text-align:left">Details: <asp:TextBox ID="TextBox1" runat="server"  MaxLength="19" BorderStyle="None" Text='<%# Eval("ProductDescription")%> ' ></asp:TextBox>   </h5>

                                </div>



                                 </blockquote>


                             <div class="row">
                                <div class="col-xs-6">
                                    <p >
                                        <span class="fa fa-thumbs-o-up"></span>
                                        <asp:Label ID="lblcount" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label></span>
                                    </p>
                                </div>

                                <div class="col-xs-6">
                                    <p style="text-align: right"><span class="fa fa-comments"></span><span><asp:Label ID="Label2" runat="server" Text='<%# Eval("ProductID") %>'></asp:Label></span></p>
                                </div>

                            </div>


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
                              
                                <asp:LinkButton ID="LinkButton1" runat="server" AutoPostback="false" CssClass=" btn btn-default btn-md" style="width:100%" Text="Like"  CommandArgument='<%#Eval("ProductID") %>'  >Like <span class="fa fa-thumbs-o-up"> </asp:LinkButton>
                              
                              

							</div>

                                <div class="col-xs-6">
                              
                                <a href='Product/ProductDetails.aspx/<%#Eval("Product_Name") %>?pID=<%# Eval("ProductID") %>'  class=" btn btn-default btn-md" style="width:100%"><span class="fa fa-eye"></span> View </a>
                              
                                         
                              

							</div>


						</div>
	</div>
                                                
						
						
					</div>
				</div>
			</div>
               
                       

              </ContentTemplate>
             </asp:UpdatePanel>

               </ItemTemplate>
         </asp:Repeater>

                
                 </div>
                    
            </div>
              </div>
          
 
   

<!--/row-offcanvas -->


          
      

      
    

     
</asp:content>

