 <%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ProductDetails.aspx.cs" Inherits="Product_ProductDetails" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">

    

    <%-- entity data source products--%>

    <asp:EntityDataSource ID="EDS_Product" runat="server" Include="Country,Userdata" AutoGenerateWhereClause="True"
        EnableFlattening="False"
        ConnectionString="name=DatabaseEntities"
        DefaultContainerName="DatabaseEntities"
        EntitySetName="Products" Where="" EnableUpdate="True">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>

    <%-- entitiy data source comments--%>

    <asp:EntityDataSource ID="EntityDataSourceCommnets" 
        runat="server" Include="Userdata" ConnectionString="name=DatabaseEntities" 
        AutoGenerateWhereClause="True" DefaultContainerName="DatabaseEntities"
         EnableFlattening="False" Where="" EntitySetName="Comments"
         OrderBy="it.[CommentID] desc">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
    </asp:EntityDataSource>


    <%--    end of entity data sources--%>


    <asp:FormView ID="FormView1" runat="server" DataSourceID="EDS_Product" >
      

        <ItemTemplate>
          

            <asp:TextBox ID="TextBox1" runat="server" Text='  <%#Page.Title= string.Concat(Eval("Product_Name").ToString() , " me" ) %> '    Visible="false" >    </asp:TextBox>
            <asp:TextBox ID="TextBox2" runat="server" Text='  <%#Page.MetaDescription= Eval("ProductDescription").ToString() %>'  Visible="false" >    </asp:TextBox>
            <asp:TextBox ID="TextBox3" runat="server" Text='  <%#Page.MetaKeywords= Eval("Product_Name").ToString() %>'  Visible="false" >    </asp:TextBox>
          


            <div style="padding-bottom:10px; padding-left:10px">
            <asp:Button ID="ButtonDPost" runat="server"  Text="Delete Post" CssClass="btn-danger" BackColor="#25B2B0" BorderColor="#25B2B0"  OnClick="ButtonDPost_Click"  UseSubmitBehavior="false" />
            <asp:Button ID="ButtonRPost" runat="server" Text="Report" CssClass="btn-danger" BackColor="#25B2B0" BorderColor="#25B2B0" OnClick="ButtonRPost_Click"  UseSubmitBehavior="false"/>
            <asp:Label ID="LabelRSub" runat="server" CssClass="text-danger" Text="Report Submitted" Visible="false"></asp:Label>
            </div>


              <div class="container" id="product-section">
                <div class="row">
                    <div class="col-md-4" style="background-color:#f7f7f7">
                        <div class="panel panel-default panelD">

                            <div class="panel-image">
                     <img src='<%#Eval("image")%>' class="img-responsive" alt='<%#Eval("Product_Name")%>' style="height: 300px;width:500px;align-items:center" >
                </div>
                             <div class="panel-footer" style="background-color:white">

                                 <h4 style="text-align:center"><%#Eval("Product_Name")%></h4>
                                 </div>

                            </div>
                    </div>

                

                    <div class="col-md-8" style="height:auto">

                       
                        

                             <div class="panel-body">
                    <blockquote>
                        <span class="tagz">Description: </span>
                     <p style="font-size:15px"> <%#Eval("ProductDescription")%></p>
                    </blockquote>

                                  <blockquote>
                         <span class="tagz">Preffered price: &#36;<%#Eval("Budget")%></span>
                       </blockquote>

                                     <blockquote>
                        <span class="tagz">Region: </span>
                     <p style="font-size:17px"><%# Eval("Country.Country_Name")%>.</p>
                    </blockquote>

                    
                </div>

                           

                        
                        

                        </div>

                    </div>

                


                  <%--comment row begining --%>

                 

                  <div class="row" style="padding-top:30px">
                
                      <div class="well">

                 <div class="input-group"> 
                     <asp:TextBox ID="UserCommentTB" runat="server" Class="form-control"  placeholder="Comment here"></asp:TextBox>
                     <asp:TextBox ID="link" CssClass="form-control"   placeholder="Add link here"  runat="server"></asp:TextBox>
                     
                     

                    <span class="input-group-addon">
                        

                        <asp:Button ID="AddCommnet_Btn" runat="server" Text="Add" OnClick="AddCommnet_Btn_Click"/>

                    </span>

                     

                </div>

</div>

                      <div class="row" style="padding-left:30px">

                          <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ErrorMessage="Enter url beginning with http://" ControlToValidate="link" ValidationExpression="(http(s)?://)?([\w-]+\.)+[\w-]+(/[\w- ;,./?%&=]*)?" ></asp:RegularExpressionValidator>
                     </div>
                  </div>
                     
                  <asp:Label ID="Label1" runat="server" CssClass="text-danger" Text="Login to comment"></asp:Label>


                   <div class="h-divider" >
</div>

                  
                          <ul class="nav nav-tabs"  >
  <li class="active"  ><a href="#">Comments</a></li>
                             
  
</ul>
                 

                  <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EntityDataSourceCommnets" OnItemCreated="Repeater1_ItemCreated" >

                      <Itemtemplate>




                            <div class="col-md-12">

                            <ul class="commentList">
           <%-- <li>--%>

                                <div class="comment-user"  style="padding-left:70px;padding-top:40px"> <span>
                                  <b> <asp:Label ID="Label2" runat="server" Text='<%# Eval("Userdata.Username")%>'  ForeColor='<%# (Eval("Userdata.Username").Equals("14BLINK")) ?  System.Drawing.Color.FromArgb(37, 178, 176) : System.Drawing.Color.Black %>'> </asp:Label></b>     <span class="date sub-text"> <asp:Label ID="LabelCID" runat="server" Text='<%# Eval("CommentID")%>' >
                                    </asp:Label>      </span> </dt> </span> </div>
                <div class="commenterImage" >
                 <span class="pull-left"> 
                     <asp:Image runat="server" src="/Logos/iconmonstr-generation-11-96.png" /></span> 
                </div>
                                          
                <div>
                    

                    

                     <div  style="padding-left:60px">



 <p> <%# Eval("Comment1")%></p><a href="<%# Eval("link")%>"  target="_blank"> <%# Eval("link")%>    </a>             
                         
                         
                         
                         
                          

                            
                </div>
                    </div>
                   </ul>
                   
                </div>
            <%--</li>--%>
                               

                          </Itemtemplate>


                        <%--  <h4 class="user">    <%# Eval("Userdata.Username")%></h4>
                                        <h5 class="time">3 minutes ago</h5>
                                    </div>
                                    <p>  <%# Eval("Comment1")%></p>
                          --%>




                      </asp:Repeater>

                 
                  </div>
        </ItemTemplate>


    </asp:FormView>

    <%--<asp:HiddenField ID="HiddenField1" runat="server"  Value='<%#Eval("ProductID")%>' />--%>
    
    
     
    
    
</asp:Content>
