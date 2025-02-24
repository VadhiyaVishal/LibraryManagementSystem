<%@ Page Title="ViewBook" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="ViewBooks.aspx.cs" Inherits="Library_Management.Admin.ViewBooks" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <script src="../datatable/js/dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

    <style>
        .banner {
            background: #a770ef;
            background: -webkit-linear-gradient(to right, #a770ef, #cf8bf3, #fdb99b);
            background: linear-gradient(to right, #a770ef, #cf8bf3, #fdb99b);
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <asp:GridView ID="GridView1" CssClass="table table-striped table-bordered" AutoGenerateColumns="false" DataKeyNames="book_id" runat="server">
                    <Columns>
                        <asp:BoundField DataField="book_id" HeaderText="ID" ReadOnly="true" SortExpression="book_id" />

                        <asp:TemplateField>
                            <ItemTemplate>
                                <div class="container-fluid">
                                    <div class="row">
                                        <div class="col-lg-10">
                                            <div class="row">
                                                <div class="col-12">
                                                    <asp:Label ID="Label1" runat="server" Text='<%#Eval("book_name") %>' Font-Bold="true" Font-Size="X-Large"></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    <span>Author - </span>
                                                    <asp:Label ID="Label2" runat="server" Font-Bold="true" Text='<%#Eval("author_name") %>'></asp:Label>
                                                    &nbsp;|<span><span>&nbsp;|</span>Genre - </span>
                                                    <asp:Label ID="Label3" runat="server" Font-Bold="true" Text='<%#Eval("genre") %>'></asp:Label>
                                                    &nbsp;|
                                                                    <span>Language -<span>&nbsp;</span>
                                                                        <asp:Label ID="Label4" runat="server" Font-Bold="true" Text='<%#Eval("language") %>'></asp:Label>
                                                                    </span>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Publisher -
                                                                    <asp:Label ID="Label5" runat="server" Font-Bold="true" Text='<%#Eval("publisher_name") %>'></asp:Label>
                                                    &nbsp;|Publish Date -
                                                                    <asp:Label ID="Label6" runat="server" Font-Bold="true" Text='<%#Eval("publisher_date") %>'></asp:Label>
                                                    &nbsp;|Pages -
                                                                    <asp:Label ID="Label7" runat="server" Font-Bold="true" Text='<%#Eval("no_of_pages") %>'></asp:Label>
                                                    &nbsp;|Edition -
                                                                    <asp:Label ID="Label8" runat="server" Font-Bold="true" Text='<%#Eval("edition") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Cost -
                                                                    <asp:Label ID="Label9" runat="server" Font-Bold="true" Text='<%#Eval("book_cost") %>'></asp:Label>
                                                    &nbsp;|Actual_Stock -
                                                                    <asp:Label ID="Label10" runat="server" Font-Bold="true" Text='<%#Eval("actual_stock") %>'></asp:Label>
                                                    &nbsp;|Available Stock -
                                                                    <asp:Label ID="Label11" runat="server" Font-Bold="true" Text='<%#Eval("current_stock") %>'></asp:Label>
                                                </div>
                                            </div>
                                            <div class="row">
                                                <div class="col-12">
                                                    Description -
                                                                    <asp:Label ID="Label12" runat="server" Font-Italic="true" Font-Size="Smaller" Font-Bold="true" Text='<%#Eval("book_description") %>'></asp:Label>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-2">
                                            <asp:Image ID="Image1" class="img-fluid" runat="server" ImageUrl='<%# Eval("book_img_link") %>' />
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>


