<%@ Page Language="C#" AutoEventWireup="true" CodeFile="BlogItem.aspx.cs" Inherits="FoundItems" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">


    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    <title>14Blink</title>
    <link rel="icon" type="image/png" href="img/metal-1328120_1280.png" />

    <!-- Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <link href="Style/CustomStyleSheet.css" rel="stylesheet" />


    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
   


    
</head>
<body>
    <form id="form1" runat="server">



        
        <div class="container" style="padding-bottom: 50px">
            <!-- Navbar -->
            <div class="navbar navbar-default navbar-fixed-top " role="navigation">
                <div class="container">
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>

                        <a class="navbar-brand" href="/Posts.aspx" style="color:white ; font-size:x-large"><span>
                          <%--  <img alt="Logo" src="/Logos/red-1618916_1280.png" height="30" />--%></span>14Blink</a>

                    

                       


                    </div>



                    <div class="navbar-collapse collapse">


                        <ul class="nav navbar-nav navbar-right">



                            <li><a style="color: #FFFFFF" href="/Posts.aspx">Home</a></li>
                            <li><a style="color: #FFFFFF" href="/Product/UploadProduct.aspx">Post</a></li>


                            
      

                             
       
                           <li>

                               <asp:HyperLink ID="userNameBtn" runat="server" Font-Names="Arial" ForeColor="Black" NavigateUrl="~/MyPosts.aspx?">HyperLink</asp:HyperLink>
                       </li>
   



                            <ul class="nav navbar-nav navbar-right">

                                <li>
                                    <asp:LinkButton ID="RegisterButton" runat="server" Style="color: #FFFFFF" CausesValidation="false" PostBackUrl="~/Accounts/Registration.aspx">Register</asp:LinkButton></li>

                                <li>
                                    <asp:LinkButton ID="LoginButton" runat="server" Style="color: #FFFFFF" CausesValidation="false" PostBackUrl="~/Accounts/Login.aspx">Login</asp:LinkButton></li>

                                <li>
                                    <asp:LinkButton ID="LogoutButton" runat="server" Style="color: #FFFFFF" OnClick="LogoutButton_Click" CausesValidation="false">Logout</asp:LinkButton></li>
                            </ul>
                        </ul>

                       

                    </div>
                </div>
            </div>




            </div>
            <!-- Navbar End -->

        <asp:EntityDataSource ID="EDS_Finds" runat="server"
             ConnectionString="name=DatabaseEntities" DefaultContainerName="DatabaseEntities"
             EnableFlattening="False" EnableUpdate="True" AutoGenerateWhereClause="true" EntitySetName="Finds">
             
             <WhereParameters>
            <asp:QueryStringParameter Name="ItemName"
                QueryStringField="Item" Type="String" />
        </WhereParameters>

        </asp:EntityDataSource>


        <div class="container">

         

           

            <asp:Repeater ID="Repeater1" DataSourceID="EDS_Finds" runat="server">

                <ItemTemplate>

                     <div class="col-md-3">

             <div class="thumbnail" >
				    
					<img src='<%#Eval("ItemImage")%>' class="img-circle" style="width: 200px;height: 200px;"/>

              </div>
            </div>

                      <div class="col-md-9">
     
            <h3 style="text-align:left"><%# Eval("ItemName")%></h3>

            <p style="text-align:center">
                <br />
               <%# Eval("ItemDescription")%> 
            </p>
            <div class="row">

                <div class="col-md-12">

                    <p style="text-align:left" ><a class="btn btn-default btn-md"  href='<%# Eval("Link")%>' role="button" target="_blank" style="background-color:#25B2B0;color:white;width:200px">Buy <span class="glyphicons glyphicons-shopping-cart"></span> &raquo;</a></p>

                </div>


            </div>

                          <hr />
                <p style="text-align:center">Share: 
                                     <a href="http://www.facebook.com/sharer.php?u=<% Response.Write(Request.Url.AbsoluteUri.ToString()); %>" target="_blank" >facebook <span ><i class="fa fa-facebook-square" style="font-size:24px" aria-hidden="true"></i></span></a>
                                     <a href="https://twitter.com/share/" class="twitter-share-button" data-url="<% Response.Write(Request.Url.AbsoluteUri.ToString()); %>" data-text="enter text" data-size="large" data-count="none" target="_blank"> <span ><i class="fa fa-twitter-square" style="font-size:24px" aria-hidden="true"></i></span></a>
                                        <a><span ><i class="fa fa-linkedin-square" style="font-size:24px" aria-hidden="true"></i></span></a>
  </p>
                          <script>!function(d,s,id){var js,fjs=d.getElementsByTagName(s)[0];if(!d.getElementById(id)){js=d.createElement(s);js.id=id;js.src="//platform.twitter.com/widgets.js";fjs.parentNode.insertBefore(js,fjs);}}(document,"script","twitter-wjs");</script>

        </div>

                   


                </ItemTemplate>


            </asp:Repeater>
            


        </div>

       
    </form>


















      <footer class="navbar-fixed-bottom">
        <div class="container">
            <p class="pull-right"><a href="#">Back to top</a></p>
            <p> <a href="/AboutUs.html">About Us</a> &middot; <a href="https://www.instagram.com/14blink/" target="_blank">Instagram</a> &middot; <a href="ContactUs.aspx">Contact Us</a> </p> 
        </div>
    </footer>

    <!--- Footer -->

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="/Scripts/bootstrap.min.js"></script>
    <script src="/Scripts/jquery-2.2.3.min.js"></script>

</body>
</html>
