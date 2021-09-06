<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Reports.aspx.cs" Inherits="Admin_Reports" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">


    <%--  data source--%>


    <asp:entitydatasource id="EntityDataSourceReports" runat="server" include="Product" connectionstring="name=DatabaseEntities" autogeneratewhereclause="True" defaultcontainername="DatabaseEntities" enableflattening="False" where="" entitysetname="Reports" orderby="it.[ReportID] desc">
        <WhereParameters>
            <asp:QueryStringParameter Name="ProductID"
                QueryStringField="pID" Type="Int32" />
        </WhereParameters>
    </asp:entitydatasource>

    <asp:repeater id="Repeater1" runat="server" datasourceid="EntityDataSourceReports">

                 <ItemTemplate>

          
                  

                  <div class="col-lg-3 col-md-6 col-xs-12 thumb" style="padding-top:50px">
                     
				<div class="thumbnail" >
				    <a href='/Product/ProductDetails.aspx?pID=<%# Eval("ProductID") %>'>
					<img src='<%#Eval("Product.image")%>' class="img-rounded" style="width: 200px;height: 200px;"></a>
					<div class="caption">
                        
                        <h4 style="text-align:center"><%# Eval("Product.Product_Name")%></h4>  
                     
						<div class="row">
							<div class="col-md-12">
								<h5 style="text-align:center">BUDGET: &#36</h5<label><%# Eval("Product.Budget")%></label></h5> 
							</div>
							
						</div>
                                                
						
						<div class="row">

                            <div class="col-md-12">

                               <a href="#" class=" btn btn-default btn-md" style="width:100%">View Details</a>


                           <%-- <a href="#" class="btn btn-primary">Buy Now!</a> <a href="#" class="btn btn-default">More Info</a>--%>

							</div>
						</div>
					</div>
				</div>
			</div>
          


        </ItemTemplate>




            </asp:repeater>



</asp:Content>

