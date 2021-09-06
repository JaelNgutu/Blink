<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ForgotUsername.aspx.cs" Inherits="Accounts_ForgotUsername" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container">
        <div class="form-horizontal">
                <h3>Forgot username</h3>
                <hr />

            <p>Enter your email address in the field below and you will receive your username shortly</p>

            <asp:Label ID="LabelR" runat="server" Text="email registered" Visible="false"></asp:Label>

             <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Email: "></asp:Label>
                    <div class="col-md-4">
                        <asp:TextBox ID="Email" CssClass="form-control" runat="server" placeholder="enter your email address"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorUsername" CssClass="text-danger" runat="server" ErrorMessage="The email field is Required !" ControlToValidate="Email"></asp:RequiredFieldValidator>
                         <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" CssClass="text-danger" ErrorMessage="someone@example.com" ControlToValidate="Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                        <asp:Label ID="EmailCheck" runat="server" CssClass="text-danger" Text="Email not registered" Visible="false"></asp:Label>
                    </div>

            </div>

            <div class="form-group">
                        <div class="col-md-2"></div>
                
                <div class="col-md-6">
                    <asp:Label ID="Emailabel" runat="server" Text="Email has not been registered" Visible="false"  ForeColor="DarkRed"></asp:Label>


                </div>

                </div>

                  <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="ButtonSend" runat="server" Text="Send" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF" OnClick="ButtonSend_Click"  />
                       <asp:Label ID="Labelsent" runat="server"  Text="Email sent" style="color:red" visible="false"></asp:Label>
                    </div>
                </div>

</div>
            

    </div>




</asp:Content>

