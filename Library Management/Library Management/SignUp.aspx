<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SignUp.aspx.cs" Inherits="Library_Management.SignUp" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>SignUp</title>
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
    <%-- 7-sweetalert--%>
    <script src="SweetAlert/sweetalert.min.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <nav class="navbar navbar-expand-sm navbar-dark bg-primary">
                <a class="navbar-brand" href="default.aspx">
                    <img src="images/Books/book4.png" alt="logo" width="49" height="49" />
                    LMS Application </a>

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
                     </li>
                        --%>
                    </ul>
                </div>
                <!--Navbar Right icon -->
                <div class="pmd-navbar-right-icon ml-auto">
                    <%--  <a id="signup" class="btn btn-sm btn-primary" href="#">SignUp</a>--%>
                    <a class="btn btn-sm btn-primary" href="Login.aspx">Sign In</a>
                </div>
            </nav>

            <div class="jumbotron text-center alert alert-primary" style="margin-bottom: 0">
                <br />
                <h1>Library Management System</h1>
                <br />
                <%--<p>Building Community. Inspring readers. Expanding book access!</p>--%>
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
                             <a class="nav-link active" href="#">Link</a>
                         </li>
                         <li class="nav-item">
                             <a class="nav-link active" href="#">Link</a>
                         </li>
                         <li class="nav-item">
                             <a class="nav-link active" href="#">Disabled</a>
                         </li>
                    </ul>
                     <hr class="d-sm-none"/>
                 </div>--%>




                    <div class="col-sm-12 border border-info">
                        <%--Write your code here--%>
                        <%--Login Screen--%>
                        <div class="container mt-3">
                            <h2>Create New Account</h2>
                            <br />
                            <!-- Nav tabs -->
                            <ul class="nav nav-tabs">
                                <li class="nav-item">
                                    <a class="nav-link active" data-toggle="tab" href="#signup">SignUp</a>
                                </li>
                            </ul>

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div id="signup" class="container tab-pane active">
                                    <br />
                                    <h3>Sign Up</h3>
                                    <p></p>
                                    <!--design login form-->
                                    <div class="container">
                                        <div class="row">
                                            <div class="col-md-12 mx-auto">
                                                <div class="card">
                                                    <div class="card-body">
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <img width="150" src="images/SignUp.png" />
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <center>
                                                                    <h3>Member/User Sign Up</h3>
                                                                </center>
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col">
                                                                <hr />
                                                            </div>
                                                        </div>
                                                        <div class="row">
                                                            <div class="col-4">
                                                                <label>Member ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>

                                                                </div>

                                                                <label>Password</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPassword" CssClass="form-control" placeholder="Password" TextMode="Password" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Valid Password" ControlToValidate="txtPassword" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>
                                                                <label>Full Name</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Full Name" ControlToValidate="txtFullName" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                </div>

                                                                <%-- <div class="form-group">
                                                                    <a href="SignUp.aspx">
                                                                        <input type="button" class="btn btn-info btn-lg btn-block" value="Sign Up"/></a>
                                                                </div>--%>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>Date Of Birth</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>Contact No.</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtContactNO" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>Email ID</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                                                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="*Enter Valid Email Address" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True"></asp:RequiredFieldValidator>
                                                                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="*Enter Valid Email Address" ControlToValidate="txtEmail" Display="Dynamic" ForeColor="Red" SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"></asp:RegularExpressionValidator>
                                                                </div>
                                                            </div>
                                                            <div class="col-4">
                                                                <label>State</label>
                                                                <div class="form-group">
                                                                    <asp:DropDownList ID="ddlState" CssClass="form-control" runat="server">
                                                                        <asp:ListItem Text="Select" Value="Select"></asp:ListItem>
                                                                        <asp:ListItem Text="Andhra Pradesh" Value="Andhra Pradesh"></asp:ListItem>
                                                                        <asp:ListItem Text="Assam" Value="Assam"></asp:ListItem>
                                                                        <asp:ListItem Text="Bihar" Value="Bihar"></asp:ListItem>
                                                                        <asp:ListItem Text="Goa" Value="Goa"></asp:ListItem>
                                                                        <asp:ListItem Text="Gujrat" Value="Gujrat"></asp:ListItem>
                                                                        <asp:ListItem Text="Haryana" Value="Haryana"></asp:ListItem>
                                                                        <asp:ListItem Text="Kerala" Value="Kerala"></asp:ListItem>
                                                                        <asp:ListItem Text="Manipur" Value="Manipur"></asp:ListItem>
                                                                        <asp:ListItem Text="Rajasthan" Value="Rajasthan"></asp:ListItem>
                                                                    </asp:DropDownList>
                                                                </div>
                                                                <label>City</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                                                                </div>
                                                                <label>PIN</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtPIN" CssClass="form-control" placeholder="PIN CODE" runat="server"></asp:TextBox>
                                                                </div>
                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <label>Full Address</label>
                                                                <div class="form-group">
                                                                    <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                                                                </div>

                                                            </div>

                                                        </div>
                                                        <div class="row">
                                                            <div class="col-12">
                                                                <div class="form-group">
                                                                    <asp:Button ID="btnSignup" CssClass="btn btn-success btn-lg btn-block" runat="server" Text="Sign Up" OnClick="btnSignup_Click" />
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                                <br />
                                                <a href="default.aspx"><< Back To Home Screen</a>
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
