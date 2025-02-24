<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="Up1_Member.aspx.cs" Inherits="Library_Management.Admin.Up1_Member" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
        <div class="row">
            <div class="col-sm-5 border">
    <br />
                    <div class="row">
                    <div class="col-12">
                    <div class="form-group">
                        <asp:textbox id="txtMemberID" cssclass="form-control" placeholder="Member ID" runat="server"></asp:textbox>
                    </div>
                   </div>
                </div> 

                 <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                              <asp:Button ID="Button1" Text="Search" CssClass="btn btn-success" runat="server"/>
                              <asp:Button ID="Button2" Text="Active" CssClass="btn btn-primary" runat="server"/>
                              <asp:Button ID="Button3" Text="Pending" CssClass="btn btn-info" runat="server"/>
                              <asp:Button ID="Button4" Text="Deactive" CssClass="btn btn-danger" runat="server"/>
                            
                            </div>
                        </div>
                    </div>

      </div>
     </div>
    </div> 
</asp:Content>
