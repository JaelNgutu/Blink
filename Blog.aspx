<%@ Page Title="Blog | 14Blink" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Blog.aspx.cs" Inherits="Blog"
     MetaKeywords="find,specific,where to buy" MetaDescription="Informing you daily about products and services you normally wouldn't see on ads"
     %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

        <asp:EntityDataSource ID="EDS_Finds" runat="server"
             ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities"
             EnableFlattening="False" EnableUpdate="True" AutoGenerateWhereClause="true" orderby="it.[ItemID] desc" EntitySetName="Finds">
             
             <WhereParameters>
            <asp:QueryStringParameter Name="ItemName"
                QueryStringField="Item" Type="String" />
        </WhereParameters>

        </asp:EntityDataSource>

   <div class="row">

       <div class="col-md-12">

           <h1 style="font-size:72px;text-align:center;font-family:Century Gothic">Blog</h1>

       </div>

    	<div class="col-md-12">

          


             <div class="container">

                 <asp:Repeater ID="Repeater1" runat="server" DataSourceID="EDS_Finds">
                     
        <ItemTemplate>


            
 <div class="col-lg-6 col-md-4 col-sm-12 col-xs-12  thumb" style="background-color:#f7f7f7" >
                        <div class="panel panel-default panelD" style="max-width:300px;display: block;
    margin-left: auto;
    margin-right: auto"" >

                            <div class="panel-image" >
                     <a  href='BlogItem.aspx?Item=<%# Eval("ItemName") %>' ><img src='<%#Eval("ItemImage")%>' class="img-responsive" alt='<%#Eval("ItemName")%>' style="height: 250px;width:400px;align-items:center" ></a>
                </div>
                             <div class="panel-footer" style="background-color:white">

                                 
    

                                 <h4 style="text-align:center"><%#Eval("ItemName")%></h4>

                                

                                 
                                 </div>

                          

                            </div>



     
      <p style="
display:block; 
  display: -webkit-box;
    max-width: auto;
    -webkit-line-clamp: 4;
  -webkit-box-orient: vertical;
  overflow: hidden;
  text-overflow: ellipsis">
                 
    <%# Eval("ItemDescription")%> 
            </p>

     <a href='BlogItem.aspx?Item=<%# Eval("ItemName") %>' style="text-align:center"><p>Read more</p></a>

                    </div>


           

            </ItemTemplate>
            </asp:Repeater>


                 </div>


            </div>
       </div>

</asp:Content>

