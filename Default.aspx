<%@ Page Title="14Blink.com" 
         MetaDescription="Join a great community that helps you find items you wish to buy or help you in decision making for your next purchase" 
         MetaKeywords="14Blink,14blink,find, buy, help ,search,where to buy,looking"  Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Default2" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <meta charset="utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
        <title>14Blink</title>
    <link rel="icon" type="image/png"  href="img/metal-1328120_1280.png" />
    <!-- Bootstrap -->
    <link href="Content/bootstrap.min.css" rel="stylesheet" />
    <link href="Style/StyleSheet.css" rel="stylesheet" />
    <link href="Style/CustomStyleSheet.css" rel="stylesheet" />
    <link href="Content/font-awesome.css" rel="stylesheet" />
    <link href="Content/font-awesome.min.css" rel="stylesheet" />

    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body>
    <form id="form1" runat="server">
    
        
      

<div class="container">
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
                        
                        <a class="navbar-brand" href="/Default.aspx" style="color:white ; ">14Blink</a>

                    </div>


                    <div class="navbar-collapse collapse">
                           

                        <ul class="nav navbar-nav navbar-right">
                        
                           
                            
                            <li ><a style="color:#FFFFFF" href="/Posts.aspx">Home</a></li>
                            <li ><a style="color:#FFFFFF" href="/Blog.aspx">Blog</a></li>

                            <li><a style="color:#FFFFFF" href="/Product/UploadProduct.aspx">Post</a></li>
                            <li><a style="color:#FFFFFF" href="/Accounts/Registration.aspx">Register</a></li>
                            <li><a style="color:#FFFFFF" href="/Accounts/Login.aspx">Login</a></li>
                            <li><a style="color:#FFFFFF" href="/ContactUs.aspx">Contacts</a></li>
                            
                        </ul>
                    </div>
                </div>
            </div>
        <!-- Navbar End -->


           

         <div>

             <div class="row">
        <div class="container" style="padding-top:60px">



              <!--- Carousel -->

        <div id="carousel-example-generic" class="carousel slide" data-ride="carousel" style="padding-bottom:1px"  >
  <!-- Indicators -->
  <ol class="carousel-indicators">
    <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
    <li data-target="#carousel-example-generic" data-slide-to="1"></li>
    <li data-target="#carousel-example-generic" data-slide-to="2"></li>
      <li data-target="#carousel-example-generic" data-slide-to="3"></li>

  </ol>

  <!-- Wrapper for slides -->
  <div class="carousel-inner" role="listbox" >
      
    <div class="item active">
        <img class="img-responsive center-block"   src="img/sunset-1331088_960_720%20cc.jpg" /> <%--alt="...">--%>
      <div class="carousel-caption" >
       <h3 style="padding-right:10px">Post an item, Our community will help you find it   </h3>
         
    
          <p><a class="btn  btn-lg btn-primary" style="background-color:#25B2B0"  href="/Posts.aspx" role="button">Explore</a></p>
      </div>
    </div>
    <div class="item">
        <img class="img-responsive center-block"  src="img/fashion-1209388_1920%20cropped.jpg" /> <%--alt="...">--%>
      <div class="carousel-caption">
        <h3>Womens's Fashion?..</h3>
    
      </div>
    </div>

       <div class="item">
        <img class="img-responsive center-block"  src="img/fashion-918446_1920%20cropped.jpg" /> <%--alt="...">--%>
      <div class="carousel-caption">
        <h3>Men's Fashion?..</h3>
    
          
      </div>
        
    </div>
     
    <div class="item">
        <img class="img-responsive center-block" src=" img/camera-1701049_1920%20cropped.jpg" /> <%--alt="...">--%>
      <div class="carousel-caption">
        <h3>Camera Equipment?..</h3>
  
      </div>
    </div>
  </div>

  <!-- Controls -->
  <a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
    <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
    <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div>

        <!--- Carousel -->

        
            </div>
        </div>
             </div>

      <hr />

  
        <!--- Middle Contents -->
        <div class="container center" >
            <div class="row">
              
                <h3 style="text-align:center">Lets do the seaching for you</h3>

                <div>

                    <img class="thumbnail" src="img/onlineshopper.jpg" alt="Online shopping" style="display: block;
    margin-left: auto;
    margin-right: auto"/>

                </div>

                <p style="font-size:14px">
                    Online shopping has come to a point where we are spoilt for choice. With so many sites to buy things when you're
                    looking for something specific you may find yourself spending hours clicking through each and lets not start on when 
                    it comes to going through reviews or lets say something you want but dont know where to get it .
                    Ever find youself in such a situation, lets us help you out by just posting what it is
                    you want and our network of users will help you out.
                    

                </p>

                   <p style="text-align:center" ><a class="btn btn-default btn-md"  href="Product/UploadProduct.aspx" role="button" style="background-color:#25B2B0;color:white;width:200px">Post Item </a></p>

                </div>

            <hr />


            <div class="row">



                
              

                <div class="col-lg-4">
                  
                    <img class="img-circle" src="img/mobile-phone-572865_1920.jpg" alt="Electronics" width="140" height="140" />
                    <h2>Electronics</h2>


                    <p>Working within a limited budget and wish to purchase a new laptop or some other electronic device or accessories? Just
                         state the specs and our community will find it for you.

                    </p>


                    <p><a class="btn btn-default" href="/Posts.aspx" role="button">View &raquo;</a></p>
                </div>

                  
                <div class="col-lg-4">
                    <img class="img-circle" src="img/t-shirt-1278404_1280.jpg" alt="Clothing" width="140" height="140" />
                    <h2>Clothing</h2>
                    <p>
                        Ever seen some apparel online or as an outfit on a stranger and wondered where you can buy it
                         from? Don't worry about accosting the stranger to enquire their source. Just take a photo and post it here and our large community will source it for you.

                    </p>
                    <p><a class="btn btn-default " href="/Posts.aspx" role="button">View &raquo;</a></p>
                </div>

                <div class="col-lg-4">
                   
                    <img class="img-circle" src="img/logoletter.png" alt="Anything" width="140" height="140" />
                    <h2>Anything</h2>


                    <p>
                        Feel free to post anything (within our <a href="AboutUs.html">rules</a>) that
                        you'd wish to purchase but don't know where it can be sourced. Users on our network will view your country and suggest options withing your region and help you avoid high shipping costs.

                    </p>


                    <p><a class="btn btn-default" href="/Posts.aspx" role="button">View &raquo;</a></p>
                </div>
            </div>
                <!--- Middle Contents -->

          



            </div>

            </div>
        <!--- Middle Contents -->

    


        <!--- Footer  -->

          <footer style="background-color:#dbdbdb">
            <div class="container">

                  <div class="col-lg-12">

                     <h3 style="text-align:center">Get Intouch</h3>

                     <p style="text-align:center"><i class="fa fa-instagram" aria-hidden="true"></i>Instagram: <a href="https://www.instagram.com/14blink/" target="_blank">14Blink</a></p>

                     <p style="text-align:center"><i class="fa fa-facebook-square" aria-hidden="true"></i> Facebook: <a href="https://www.facebook.com/14Blink/" target="_blank"> 14Blink </a></p>

                     <p style="text-align:center"><i class="fa fa-twitter" aria-hidden="true"></i>Twitter<a href="https://twitter.com/14Blink_com" target="_blank">14Blink_com</a></p>

                      <p style="text-align:center"><i class="fa fa-envelope"></i> E-mail : <a href="ContactUs.aspx">contact@14Blink.com</a> </p>

                     </div>

                
                

               
               

            </div>
        </footer>
        <!--- Footer -->


   

        
    </form>

      <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="Scripts/bootstrap.min.js"></script>
    <script src="Scripts/jquery-2.2.3.min.js"></script>


</body>
</html>