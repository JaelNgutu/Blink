<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin_Admin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">



    
        <div class="container" style="padding-top:50px">

             <script src="//code.jquery.com/jquery-1.11.2.min.js" type="text/javascript"></script>
    <script type="text/javascript">
        function ShowImagePreview(input) {
            if (input.files && input.files[0]) {
                var reader = new FileReader();
                reader.onload = function (e) {
                    $('#<%=ImgPrv.ClientID%>').prop('src', e.target.result)
                        .width(240)
                        .height(150);
                };
                reader.readAsDataURL(input.files[0]);
                }
            }
    </script>


             <div class="form-horizontal">

                <h3 style="text-align:center">Admin Page</h3>
                <hr />
                 </div>

             <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Comment"></asp:Label>
                    <div class="col-md-3">
                        
                        <asp:TextBox ID="CID" CssClass="form-control" runat="server" placeholder="comment"></asp:TextBox>

                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CID" ErrorMessage="Enter Number"></asp:RequiredFieldValidator>--%>

                        <div class="col-md-12">
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrice" CssClass="text-danger" runat="server" ErrorMessage="invalid input, numbers only" ControlToValidate="CID" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                             </div>

                         <div class="col-md-6" style="padding-top:20px">
                        <asp:Button ID="btnDC" runat="server" Text="Remove" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF"  OnClick="btnDC_Click" />
                      
                    </div>
                        
                    </div>
                </div>


            
             <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Ignore Report"></asp:Label>
                    <div class="col-md-3">
                        
                        <asp:TextBox ID="TextBoxIR" CssClass="form-control" runat="server" placeholder="Ignore"></asp:TextBox>

                        <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="CID" ErrorMessage="Enter Number"></asp:RequiredFieldValidator>--%>

                        <div class="col-md-12">
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator1" CssClass="text-danger" runat="server" ErrorMessage="invalid input, numbers only" ControlToValidate="CID" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                             </div>

                         <div class="col-md-6" style="padding-top:20px">
                        <asp:Button ID="Button1" runat="server" Text="Ignore" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF"  OnClick="ButtonIR_Click" />
                      
                    </div>
                        
                    </div>
                </div>




           


            </div>

    <hr />

    <div class="container">


        <div class="row">

            <h3 style="text-align:center" >Add Item</h3>

        </div>


            <div class="form-horizontal">


                   <div class="form-group">
                     <div class="col-md-12">
                      


                          </div>


                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Item Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="ProductNameTB" CssClass="form-control" MaxLength="25" placeholder="product name *avoid ? " runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger"  runat="server" ErrorMessage="The Item name field is Required !" ControlToValidate="ProductNameTB"></asp:RequiredFieldValidator>
                    </div>
                </div>



                <div class="form-group">
                     <div class="col-md-12">
                          </div>
                    <asp:Label ID="Label10" runat="server" CssClass="col-md-2 control-label" Text="Reference post"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBoxPid" CssClass="form-control" placeholder="product id (no) user asked" runat="server"></asp:TextBox>
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator4" CssClass="text-danger" runat="server" ErrorMessage="invalid input, numbers only" ControlToValidate="TextBoxPid" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" CssClass="text-danger"  runat="server" ErrorMessage="The Item name field is Required !" ControlToValidate="ProductNameTB"></asp:RequiredFieldValidator>
                    </div>
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>




                <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Item Description"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="ProductDescriptionTB" CssClass="form-control" MaxLength="1000" TextMode="MultiLine" Width="500px" Height="200"   runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"  runat="server" ErrorMessage="The Description field is Required !" ControlToValidate="ProductDescriptionTB"></asp:RequiredFieldValidator>

                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label6" runat="server"  CssClass="col-md-2 control-label"  Text="Price"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="priceTB" CssClass="form-control"  MaxLength="10" placeholder="specify in dollars" runat="server"></asp:TextBox>
                       
                         <div class="col-md-12">

                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" ControlToValidate="priceTB" runat="server" ErrorMessage=" Please specify Price"></asp:RequiredFieldValidator>
                         </div>

                         <div class="col-md-12">
                             <asp:RegularExpressionValidator ID="RegularExpressionValidator3" CssClass="text-danger" runat="server" ErrorMessage="invalid input, numbers only" ControlToValidate="priceTB" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                             </div>

                    </div>
                </div>


                 <div class="form-group">
                    <asp:Label ID="Label7" runat="server" CssClass="col-md-2 control-label" Text="image"></asp:Label>
                    <div class="col-md-6">
                         <asp:FileUpload ID="FileUpload1" runat="server"  onchange="ShowImagePreview(this);"  />

                         <asp:Image ID="ImgPrv" Height="150px" Width="240px"   class="img-responsive" runat="server"  />
                        <asp:Label ID="LblImage" runat="server" Text="Only images allowed" Visible="false"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Please upload photo" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                     <div class="row">
                         <span><asp:Label ID="LabelScs" runat="server" CssClass="alert-success" Text="Post added succesfully!" Visible="false"></asp:Label></span>  
                    </div>
                    </div>
                </div>


                  <div class="form-group">
                     <div class="col-md-12">
                          </div>
                    <asp:Label ID="Label8" runat="server" CssClass="col-md-2 control-label" Text="Link to product"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBoxLink" CssClass="form-control"  placeholder="paste link here" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" CssClass="text-danger"  runat="server" ErrorMessage="The Item name field is Required !" ControlToValidate="ProductNameTB"></asp:RequiredFieldValidator>
                    </div>
                </div>

                <div class="form-group">
                     <div class="col-md-12">
                          </div>
                    <asp:Label ID="Label9" runat="server" CssClass="col-md-2 control-label" Text="Today's Date"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="TextBoxDate" CssClass="form-control" MaxLength="20" placeholder="24th-january-1980" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" CssClass="text-danger"  runat="server" ErrorMessage="The Item name field is Required !" ControlToValidate="TextBoxdate"></asp:RequiredFieldValidator>
                    </div>
                </div>



                
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="btReg" runat="server" Text="Post" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF" OnClick="ProductAdd_Click"  />
                      
                    </div>
                </div>


                </div>
         
           </div>

                




      

          


</asp:Content>

