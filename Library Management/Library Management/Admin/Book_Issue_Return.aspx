<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="Book_Issue_Return.aspx.cs" Inherits="Library_Management.Admin.Book_Issue_Return" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../datatable/js/dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row">
            <div class="col-md-5">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Book Issuing</h4>
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <center>
                                      <img width="160px" src="../images/book3.jpg" />
                                </center>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col">
                                <hr />
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member ID</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Valid Member ID" ControlToValidate="txtMemID" ForeColor="Red" Display="Dynamic" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book ID</label>
                                <div class="input-group">
                                    <asp:TextBox ID="txtBookID" CssClass="form-control" placeholder="Book ID" runat="server"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="*Enter Valid Book ID" ControlToValidate="txtBookID" ForeColor="Red" Display="Dynamic" ValidationGroup="S1"></asp:RequiredFieldValidator>
                                    <asp:Button ID="btnSearch" runat="server" class="btn btn-dark" for="txtBookID" Text="Search" OnClick="btnSearch_Click" ValidationGroup="S1" />
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Member Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtMemName" CssClass="form-control" placeholder="Member Name" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Book Name</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtBookName" CssClass="form-control" placeholder="Book Name" ReadOnly="true" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-md-6">
                                <label>Issue Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtIssueDate" CssClass="form-control" placeholder="Start Date" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <label>Due Date</label>
                                <div class="form-group">
                                    <asp:TextBox ID="txtDueDate" CssClass="form-control" placeholder="End Date" TextMode="Date" runat="server"></asp:TextBox>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-6">
                                <asp:Button ID="btnIssue" class="btn btn-lg btn-block btn-primary" runat="server" Text="Issue" OnClick="btnIssue_Click" />
                            </div>
                            <div class="col-6">
                                <asp:Button ID="btnReturn" class="btn btn-lg btn-block btn-success" runat="server" Text="Return" OnClick="btnReturn_Click" />
                            </div>
                        </div>
                    </div>
                </div>
                <a href="AdminHome.aspx"><< Back to Home </a>
                <br />
                <br />
            </div>

            <div class="col-md-7">
                <div class="card">
                    <div class="card-body">
                        <div class="row">
                            <div class="col">
                                <center>
                                    <h4>Issued Book List</h4>
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
                                <asp:GridView ID="GridView1" class="table table-striped table-bordered" AutoGenerateColumns="false" runat="server" EmptyDataText="No Record Found..." OnRowDataBound="GridView1_RowDataBound">
                                    <Columns>
                                        <asp:BoundField DataField="member_id" HeaderText="Member ID" SortExpression="member_id" />
                                        <asp:BoundField DataField="member_name" HeaderText="Member Name" SortExpression="member_name" />
                                        <asp:BoundField DataField="book_id" HeaderText="Book ID" SortExpression="book_id" />
                                        <asp:BoundField DataField="book_name" HeaderText="Book Name" SortExpression="book_name" />
                                        <asp:BoundField DataField="issue_date" HeaderText="Issue Date" SortExpression="issue_date" />
                                        <asp:BoundField DataField="due_date" HeaderText="Due Date" SortExpression="due_date" />
                                    </Columns>
                                </asp:GridView>
                            </div>
                        </div>
                    </div>
                </div>
            </div>        </div>
    </div>
</asp:Content>
