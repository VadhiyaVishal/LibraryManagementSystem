<%@ Page Title="Home page" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="default.aspx.cs" Inherits="Library_Management._default" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <div class="container">
       <div class="row">
           <div id="demo" class="carousel slide" data-ride="carousel">
               <!--Indicators-->
               <ul class="carousel-indicators">
                   <li data-target="#demo" data-slide-to="0" class="active"></li>
                   <li data-target="#demo" data-slide-to="1"></li>
                   <li data-target="#demo" data-slide-to="2"></li>
                </ul>
               <!--The Slideshow -->
               <div class="carousel-inner">
               <div class="carousel-item active">
                   <img src="images/700225975.jpg" alt="Los Angeles" width="1130" height="700">
                </div>
               <div class="carousel-item">
                   <img src="images/istockphoto-949118068-612x612.jpg" alt="Chicago" width="1130" height="700">
                </div>
               <div class="carousel-item">
                   <img src="images/photo-1521587760476-6c12a4b040da.jpeg" alt="New York" width="1130" height="700">
                </div>
           </div>

           <!--Left and right Control -->
           <a class="carousel-control-prev" href="#demo" data-slide="prev">
               <span class="carousel-control-prev-icon"></span>
            </a>
           <a class="carousel-control-next" href="#demo" data-slide="next">
               <span class="carousel-control-next-icon"></span>
            </a>
       </div>
    </div>
       <%-- <div class="row">
            <div class="col-sm-12">
                <h2>TITLE HEADING</h2>
                <h5>Title description, March 7, 2023</h5>
                <div class="fakeimg">Fake Image</div>
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
                <br>
                <h2>TITLE HEADING</h2>
                <h5>Title description, March 17, 2023</h5>
                <div class="fakeimg">Fake Image</div>
                <p>Some text..</p>
                <p>Sunt in culpa qui officia deserunt mollit anim id est laborum consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco.</p>
            </div>
        </div>--%>
       
      <%-- <div class="row">
           <div class="container">
               <div class="row">
                   <div class="col-sm-4">
                       <div class="panel panel-primary">
                           <div class="panel-heading">Black Friday deal</div>
                           <div class="card-body">
                               <img src="images/preview-m2H7i8m2H7K9i8H7.jpg" class="img-responsive" style="width:100%" alt="Image">
                            </div>
                           <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                        </div>
                    </div>

                   <div class="col-sm-4">
                       <div class="panel panel-primary">
                           <div class="panel-heading">Black Friday deal</div>
                           <div class="card-body">
                               <img src="images/preview-m2H7i8m2H7K9i8H7.jpg" class="img-responsive" style="width:100%" alt="Image">
                            </div>
                           <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                        </div>
                    </div>

                   <div class="col-sm-4">
                       <div class="panel panel-primary">
                           <div class="panel-heading">Black Friday deal</div>
                           <div class="card-body">
                               <img src="images/preview-m2H7i8m2H7K9i8H7.jpg" class="img-responsive" style="width:100%" alt="Image">
                            </div>
                           <div class="panel-footer">Buy 50 mobiles and get a gift card</div>
                        </div>
                    </div>
                </div>
               </div>
               </div>--%>
            </div>
    </asp:Content>
