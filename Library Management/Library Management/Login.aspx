
<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="Library_Management.Login" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width-device,initial-scale=1" />

    <%-- 1-Bootstrap css--%>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <%-- 2-Datatable css--%>
    <link href="datatable/css/dataTables.dataTables.min.css" rel="stylesheet" />

    <%--3-Fontawesome css--%>
    <link href="fontawesome/css/all.css" rel="stylesheet" />

    <%-- 4-Jquery js--%>
    <script src="bootstrap/js/jquery-3.3.1.slim.min.js"></script>

    <%--5-Popper js--%>
    <script src="bootstrap/js/popper.min.js"></script>

    <%-- 6-Bootstrap js--%>
    <script src="bootstrap/js/bootstrap.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
                <a class="navbar-brand" href="default.aspx">
                    <img src="images/Books/book4.png" alt="logo" width="49" height="49" />
                    LMS Application  </a>

                <div class="collapse navbar-collapse" id="collapsibleNavbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="default.aspx"><b>Home</b></a>
                        </li>
                        <%-- <li class="nav-item">
                            <a class="nav-link" href="#"><b>Library Collaction</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Archives</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Publication</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Gallery</b></a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="#"><b>Contact Us</b></a>
                        </li>--%>
                    </ul>
                </div>
                <!--Navbar Right icon -->
                <div class="pmd-navbar-right-icon ml-auto">
                    <a id="signup" class="btn btn-sm btn-primary" href="SignUp.aspx">Sign Up</a>
                    <%-- <a class="btn btn-sm btn-primary" href="#">Login</a>--%>
                </div>
            </nav>

            <div class="jumbotron text-center alert alert-primary" style="margin-bottom: 0">
                <br />
                <h1>Library Management System</h1>
                <br />
            </div>
            <div class="container-fluid">
                <div class="row">
                    <%-- <div class="col-sm-2 border border-info">
                        <h2>Filter</h2>

                        <p>Top Search..</p>
                        <ul class="nav nav-pills flex-column">
                            <li class="nav-item">
                                <a class="nav-link active" href="#">Active</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link " href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="#">Link</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link disabled" href="#">Disabled</a>
                            </li>
                        </ul>
                        <hr class="d-sm-none"/>
                    </div>--%>


                    <div class="col-sm-12 border border-info">
                        <%--Login Screen--%>
                        <div class="container mt-3">
                            <h2>Login Panel</h2>
                            <br />
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#home">User Login</a>
                                </li>
                                <li class="nav-item">
                                    <a class="nav-link" data-toggle="tab" href="#menu1">Admin Login</a>
                                </li>

                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="home" class="container tab-pane active">
                                    <br />
                                    <h3>User Login</h3>
                                    <p></p>
                                    <!--design login form-->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card" style="background-color: whitesmoke;">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="images/user.png">
                                                                </center>
                                                            </div>


                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Member ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Login" OnClick="btnLogin_Click" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <a href="SignUp.aspx">
                                                                        <input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <a href="#"><< Back To Home Screen</a>
                                                <br />
                                                <br />
                                            </div>
                                        </div>
                                    </div>

                                    <!--design end-->
                                </div>
                                <div id="menu1" class="container tab-pane fade">
                                    <br />
                                    <h3>Admin Login</h3>
                                    <p></p>
                                    <!--Admin design login form-->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-6 mx-auto">
                                                <div class="card" style="background-color: whitesmoke;">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="251" src="images/215-2151411_back-office-admin-office-admin.png"/>
                                                                </center>
                                                            </div>
                                                            <div class="row"></div>
                                                            <div class="row"></div>
                                                            <div class="row"></div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Admin Login</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <label>Admin ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminID" CssClass="form-control" placeholder="Admin ID" runat="server"></asp:TextBox>
                                                                </div>

                                                                <label>Password</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAdminPass" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                </div>
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnAdminLogin" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Admin Login" OnClick="btnAdminLogin_Click" />
                                                                </div>
                                                                <div class="form-group">
                                                                    <a href="SignUp.aspx">
                                                                        <input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up" /></a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <a href="#"><< Back To Home Screen</a>
                                                <br />
                                                <br />
                                            </div>
                                        </div>
                                    </div>

                                    <!--design end-->
                                </div>

                            </div>
                        </div>

                        <!--End Login Sccreen-->
                    </div>
                </div>
            </div>


            <br />
            <div class="jumbotron text-center alert alert-danger" style="margin-bottom: 0; border: 2px solid red">
                <div class="row">
                    <div class="col-md-12">
                        <br />
                        <br />
                        <h4 class="text-center">Devloped By Vishal Vadhiya & Aayush Vadhiya</h4>
                        <br />
                        <br />
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
