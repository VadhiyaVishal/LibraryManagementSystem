<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ErrorPage.aspx.cs" Inherits="Library_Management.ErrorPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>ErrorPage</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
           <a href="default.aspx"><img src="images/404-Page-Design-Examples.png" alt="404 Error" width="1600"/></a> 
            <div>
                <asp:Label ID="errorDesp" runat="server" Text=" " ForeColor="Red"></asp:Label>
            </div>
        </div>
    </form>
</body>
</html>
