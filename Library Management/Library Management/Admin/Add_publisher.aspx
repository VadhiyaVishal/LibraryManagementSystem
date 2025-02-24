<%@ Page Title="Add_publisher" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="Add_publisher.aspx.cs" Inherits="Library_Management.Admin.Add_publisher" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-4 border">
                <div class="row">
                    <div class="col-12">
                        <br />
                        <h4>Add Publisher</h4>
                        <br />
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherID" CssClass="form-control" placeholder="Publisher ID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Enter Publisher ID" ControlToValidate="txtpublisherID" ValidationGroup="btn_Save" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:TextBox ID="txtpublisherName" CssClass="form-control" placeholder="Publisher Name" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Enter Publisher Name" ControlToValidate="txtpublisherName" Display="Dynamic" ValidationGroup="btn_Save" ForeColor="Red"></asp:RequiredFieldValidator>
                        </div>
                        <div class="form-group">
                            <asp:Button ID="btnadd" CssClass="btn btn-success" ValidationGroup="btn_Save" runat="server" Text="Add" OnClick="btnadd_Click" />
                            <asp:Button ID="btnupdate" CssClass="btn btn-info" runat="server" Text="Update" OnClick="btnupdate_Click" />
                            <asp:Button ID="btncancle" CssClass="btn btn-danger" runat="server" Text="Cancle" OnClick="btncancle_Click" />
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-8 border">
                <div class="table table-responsive">
                    <br />
                    <h4>Show all publisher List:</h4>
                    <br />
                    <asp:Repeater ID="RptPublisher" runat="server" OnItemCommand="RptPublisher_ItemCommand">
                        <HeaderTemplate>
                            <table class="table table-bordered table-hover">
                                <thead class="alert-info">
                                    <tr>
                                        <th><span>Publisher ID</span></th>
                                        <th><span>Publisher Name</span></th>
                                        <th>&nbsp;</th>
                                    </tr>
                                </thead>
                                <tbody>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td><%#Eval("publisher_id") %></td>
                                <td><%#Eval("publisher_Name") %></td>
                                <td style="width: 18%">
                                    <center>
                                <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" CommandArgument='<%#Eval("publisher_id")%>' CommandName="Edit" ToolTip="Edit Record">
                                    <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                         <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                    </span>
                                </asp:LinkButton>

                                <asp:LinkButton ID="lnKDelete" CssClass="table-link text-danger" runat="server" CommandArgument='<%#Eval("publisher_id")%>' CommandName="Delete" Text="Delete" ToolTip="DeleteRecord" OnClientClick="return confirm('Do you want to delete this row?');">
                                    <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                         <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                                    </span>
                                </asp:LinkButton> 
                                </center>

                                </td>
                            </tr>
                        </ItemTemplate>
                        <FooterTemplate>
                            </tbody>
                        </table>
                        </FooterTemplate>
                    </asp:Repeater>
                </div>
            </div>
        </div>
    </div>
    <br />
</asp:Content>
