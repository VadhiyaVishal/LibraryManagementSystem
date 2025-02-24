﻿<%@ Page Title="Fine Payment Details" Language="C#" MasterPageFile="~/UserScreen/User.Master" AutoEventWireup="true" CodeBehind="uPayment.aspx.cs" Inherits="Library_Management.UserScreen.uPayment" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <script src="../datatable/js/dataTables.min.js"></script>

    <script type="text/javascript">
        $(document).ready(function () {
            $(".table").prepend($("<thead></thead>").append($(this).find("tr:first"))).dataTable();
        });
    </script>

     <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h2>Fine Payment Details</h2>
                <hr />
                <asp:GridView class="table table-striped table-bordered" ID="GridView1" runat="server"></asp:GridView>
            </div>
        </div>
    </div>
</asp:Content>
