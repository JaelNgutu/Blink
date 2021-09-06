<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="ContactUs.aspx.cs" Inherits="ContactUs" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">


    <div class="container">
            <div class="form-horizontal">
                 <h4>We're glad to hear from you send us an email below</h4>

                  <div class="form-group">
                    <asp:Label ID="Label1" runat="server" CssClass="col-md-2 control-label" Text="Name*"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Name" CssClass="form-control" MaxLength="20" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidatorName" CssClass="text-danger" runat="server" ErrorMessage="Please enter your name" ControlToValidate="Name"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="Label2" runat="server" CssClass="col-md-2 control-label" Text="Your Email Address*"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Email" CssClass="form-control" runat="server" placeholder="someone@example.com"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" CssClass="text-danger" runat="server" ErrorMessage="Please enter your email" ControlToValidate="Email"></asp:RequiredFieldValidator>
                    </div>
                </div>


                 <div class="form-group">
                    <asp:Label ID="Label4" runat="server" CssClass="col-md-2 control-label" Text="Subject*"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="subject" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" CssClass="text-danger" runat="server" ErrorMessage="Please enter subject" ControlToValidate="subject"></asp:RequiredFieldValidator>
                    </div>
                </div>

                 <div class="form-group">
                    <asp:Label ID="Label3" runat="server" CssClass="col-md-2 control-label" Text="Message*"></asp:Label>
                    <div class="col-md-3">
                        <asp:TextBox ID="Message" CssClass="form-control" Height="100px" runat="server" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" CssClass="text-danger" runat="server" ErrorMessage="Cannot send blank message" ControlToValidate="Message"></asp:RequiredFieldValidator>
                    </div>
                </div>

                  <div class="form-group">
                        <div class="col-md-2"></div>                    
                    <div class="col-md-6">
                        <asp:Button ID="SendEmail" runat="server" Text="Send Email" CssClass="btn btn-default" BackColor="#25B2B0" ForeColor="#FFFFFF" Onclick="SendEmail_Click" />
                       <asp:Label ID="Labelsent" runat="server"  Text="Email sent" style="color:red" visible="false"></asp:Label>
                    </div>
                </div>


                <div class="form-group">

                    <div class="col-md-6">

                        <p>You can also contact us via mobile or whatsapp using the numbers provided</p>
 <asp:Label ID="LabelNo" runat="server" CssClass="col-md-2 control-label" Text="Number"></asp:Label>
                        <div class="col-md-6" style="padding-top:8px">
                        <asp:Label ID="LabelNos" runat="server" Text="+254710673725 "></asp:Label>
                          
                    </div>
                    </div>

                </div>

                </div>
        </div>


</asp:Content>

