<%@ Page Title="Login | 14Blink" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Accounts_Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

    <link href="../Style/CustomStyleSheet.css" rel="stylesheet" />

  
      <!--- Sign in start  -->
        <div class="container">
            <div class="form-horizontal">
                <h2>Login</h2>
                <hr />

               

                <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Email"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Email" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The Username field is Required !" ControlToValidate="Email"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Username"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Username" CssClass="form-control" runat="server"  TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorPass" CssClass="text-danger"  runat="server" ErrorMessage="The Password field is Required !" ControlToValidate="Username"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:CheckBox ID="CheckBox1" runat="server" />
                        <asp:Label ID="Label3" runat="server" CssClass="control-label" Text="Remember me ?"></asp:Label>
                        <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="/Accounts/ForgotUsername.aspx" CausesValidation="false">Forgot Username?</asp:LinkButton>
                    </div>
                </div>
                 <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="Button1" runat="server" Text="Login" CssClass="btn btn-default" OnClick="Login_Click" />
                        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="/Accounts/Registration.aspx">Register</asp:LinkButton>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Label ID="lblError" runat="server" CssClass="text-danger"></asp:Label>
                        </div>
                </div>
            </div>
        </div>
        <!--- Sign in end  -->

    



    
    


      <script src="Scripts/jquery-2.2.3.js"  type="text/javascript"></script>
          <script type="text/javascript">
              $(document).ready(function () {
                  $('[data-toggle=offcanvas]').click(function () {
                      $('.row-offcanvas').toggleClass('active');
                  });
              });

              
    </script>

</asp:Content>

