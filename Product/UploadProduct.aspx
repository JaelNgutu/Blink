<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="UploadProduct.aspx.cs" Inherits="Product_UploadProduct" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../Style/CustomStyleSheet.css" rel="stylesheet" />

    
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

    
       <div class="container">

            <div class="form-horizontal">

                <h3>What are you looking for?</h3>
                <hr />

                 <div class="row">
                         <span><asp:Label ID="LabelScs" runat="server" CssClass="alert-success" Text="Post added succesfully!" Visible="false"></asp:Label></span>  
                    </div>
                <div class="form-group">
                     <div class="col-md-12">
                       <h4>  <asp:Label ID="LabelPost" runat="server" CssClass="text-danger" Text="Login to post"></asp:Label></h4>


                          </div>


                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Item Name"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="ProductNameTB" CssClass="form-control" MaxLength="19" placeholder="Watch,book,car etc" runat="server"></asp:TextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="no symbols allowed" CssClass="text-danger" ControlToValidate="ProductNameTB" ValidationExpression="^[0-9a-zA-Z ]+$"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger"  runat="server" ErrorMessage="The Item name field is Required !" ControlToValidate="ProductNameTB"></asp:RequiredFieldValidator>
                    </div>
                </div>

                   <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Category"></asp:Label>
                    <div class="col-md-3">
                        <asp:DropDownList ID="ddlCategory" CssClass="form-control" runat="server"></asp:DropDownList>
                    </div>
                </div>




                <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Item Description"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="ProductDescriptionTB" CssClass="form-control" MaxLength="1000" TextMode="MultiLine"   runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger"  runat="server" ErrorMessage="The Description field is Required !" ControlToValidate="ProductDescriptionTB"></asp:RequiredFieldValidator>

                    </div>
                </div>


                <div class="form-group">
                    <asp:Label ID="Label4" runat="server"  CssClass="col-md-2 control-label"  Text="Budget"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="priceTB" CssClass="form-control"  MaxLength="10" placeholder="specify in dollars" runat="server"></asp:TextBox>
                       
                         <div class="col-md-12">

                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" ControlToValidate="priceTB" runat="server" ErrorMessage=" Please specify budget"></asp:RequiredFieldValidator>
                         </div>

                         <div class="col-md-12">
                             <asp:RegularExpressionValidator ID="RegularExpressionValidatorPrice" CssClass="text-danger" runat="server" ErrorMessage="invalid input, numbers only" ControlToValidate="priceTB" ValidationExpression="\d+"></asp:RegularExpressionValidator>
                             </div>

                    </div>
                </div>


                 <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="image"></asp:Label>
                    <div class="col-md-6">
                         <asp:FileUpload ID="FileUpload1" runat="server"  onchange="ShowImagePreview(this);"  />

                         <asp:Image ID="ImgPrv" Height="150px" Width="240px"   class="img-responsive" runat="server"  />
                        <asp:Label ID="LblImage" runat="server" Text="Only images allowed" Visible="false"></asp:Label>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" CssClass="text-danger" ErrorMessage="Please upload photo" ControlToValidate="FileUpload1"></asp:RequiredFieldValidator>
                    
                    </div>
                </div>


                
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="btReg" runat="server" Text="Post" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF" Width="250px" OnClick="ProductAdd_Click"  />
                      
                    </div>
                </div>


                </div>
         
           </div>


<%--<asp:Label runat="server" Text="UserID"></asp:Label>
<asp:TextBox ID="userTB" runat="server"></asp:TextBox>


<asp:Label runat="server" Text="Country"></asp:Label>
<asp:TextBox ID="CountryTB" runat="server"></asp:TextBox>--%>


           <%-- <asp:TextBox ID="Add_CategoryTB" runat="server"></asp:TextBox>
            <asp:Button ID="Add_Category" runat="server" Text="Add" OnClick="Add_Category_Click" />

            <asp:TextBox ID="otherTB" runat="server"></asp:TextBox>--%>

      


</asp:Content>

