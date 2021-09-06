<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Accounts_Registration" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../Style/CustomStyleSheet.css" rel="stylesheet" />
    


    <!--- Sign in start  -->
        <div class="container">
            <div class="form-horizontal">
                <h2>Join Our Community</h2>
                <hr />
                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbEmail" CssClass="form-control" runat="server" MaxLength="100" placeholder="enter your email address"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Email field is Required !" ControlToValidate="tbEmail"></asp:RequiredFieldValidator>
                           <div class="col-md-9">
                               <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ErrorMessage="someone@example.com" ControlToValidate="tbEmail" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                <asp:Label ID="LabelEmail" runat="server" CssClass="text-danger" Text="Email already exists"></asp:Label>
                   </div>
                                </div>
                </div>

                



                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Username"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="tbUsername" CssClass="form-control" runat="server" MaxLength="15" ></asp:TextBox>
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="tbUsername"></asp:RequiredFieldValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionChars" runat="server" CssClass="text-danger" ControlToValidate="tbUsername" ValidationExpression="^[0-9a-zA-Z]+$" ErrorMessage="No symbols allowed"></asp:RegularExpressionValidator><br />
                        <asp:RegularExpressionValidator ID="RegularExpressionLength" runat="server" CssClass="text-danger" ControlToValidate="tbUsername" ValidationExpression=".{5}.*" ErrorMessage="Minimum length of 5 characters"></asp:RegularExpressionValidator>
                         <div class="col-md-12">
                        <asp:Label ID="LabelUser" runat="server" CssClass="text-danger" Text="Username already exists"></asp:Label>
                        </div>
                          </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Repeat Username"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Ruser" CssClass="form-control" runat="server" MaxLength="100" placeholder="repeat username"></asp:TextBox>
                         <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Repeat Username!" ControlToValidate="Ruser"></asp:RequiredFieldValidator>
                           <div class="col-md-9">
                               <asp:CompareValidator ID="CompareValidator1" runat="server" CssClass="text-danger" ErrorMessage="Username doesnt match"   ControlToValidate="Ruser" ControlToCompare="tbUsername"></asp:CompareValidator>
                                
                   </div>
                                </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="Label5" runat="server" CssClass="col-md-2 control-label" Text="Gender"></asp:Label>
                     <div class="col-md-6">
                        

                         <asp:RadioButtonList ID="RadioButtonListGender"  runat="server">

                        <asp:ListItem  Value="Female" Text="Female"></asp:ListItem>
                        <asp:ListItem Value="Male" Text="Male"  ></asp:ListItem>

                         </asp:RadioButtonList>

                         <asp:RequiredFieldValidator ID="RequiredGender" runat="server" CssClass="text-danger" ErrorMessage="Select gender" ControlToValidate="RadioButtonListGender"></asp:RequiredFieldValidator>
                       </div>

                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Country"></asp:Label>
                    <div class="col-md-3">

                        <asp:DropDownList ID="ddlCountry" CssClass="form-control" runat="server"></asp:DropDownList>

                       
                        
                       
                    </div>
                </div>
              
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="btReg" runat="server" Text="Register" CssClass="btn btn-default" onclick="btReg_Click" />
                      
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Label ID="lblScs" runat="server" CssClass="alert-success" text="Registration Successful, proceed to login " Visible="false"></asp:Label>
                        </div>
                </div>
            </div>
        </div>
        <!--- Sign in end  -->



    
      <script src="Scripts/jquery-2.2.3.js"></script>


      <script src="Scripts/jquery-2.2.3.js"  type="text/javascript"></script>
          <script type="text/javascript">
              $(document).ready(function () {
                  $('[data-toggle=offcanvas]').click(function () {
                      $('.row-offcanvas').toggleClass('active');
                  });
              });
    </script>

</asp:Content>

