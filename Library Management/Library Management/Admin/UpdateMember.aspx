<%@ Page Title="Member Update" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="UpdateMember.aspx.cs" Inherits="Library_Management.Admin.UpdateMember" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
      <div class="container-fluid">
        <div class="row">
            <div class="col-sm-5 border">
                <p></p>
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
                             <asp:Button ID="btnAdd" Text="Submit" CssClass="btn btn-success" Height="40px" Width="120px" runat="server" OnClick="btnAdd_Click" />
                             <asp:Button ID="btnupdate" Text="Update" CssClass="btn btn-info" Height="40px" Width="120px" runat="server" Visible="false" OnClick="btnupdate_Click"/>
                             <asp:Button ID="btncancle" Text="Cancle" CssClass="btn btn-danger" Height="40px" Width="120px" runat="server" Visible="false" OnClick="btncancle_Click"/>
                          </div>
                    </div>

                </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:textbox id="txtFullName" cssclass="form-control" placeholder="Full Name" runat="server"></asp:textbox>

                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:textbox id="txtDOB" cssclass="form-control" placeholder="DOB" textmode="Date" runat="server"></asp:textbox>
                    
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                               <asp:textbox id="txtContactNO" cssclass="form-control" placeholder="Contact No." runat="server"></asp:textbox>
                    
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                               <asp:textbox id="txtEmail" cssclass="form-control" placeholder="Email" textmode="Email" runat="server"></asp:textbox>
                   
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-6">
                            <div class="form-group">
                               <asp:dropdownlist id="ddlState" cssclass="form-control" runat="server">
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
                        </asp:dropdownlist>
                            </div>
                        </div>
                        
                    
                        <div class="col-6">
                            <div class="form-group">
                                <asp:textbox id="txtCity" cssclass="form-control" placeholder="City" runat="server"></asp:textbox>                   
                            </div>
                         </div>               
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:textbox id="txtPIN" cssclass="form-control" placeholder="PIN CODE" runat="server"></asp:textbox>
                 
                            </div>
                        </div>
                    </div>

                    <div class="row">
                        <div class="col-12">
                            <div class="form-group">
                                <asp:textbox id="txtAddress" cssclass="form-control" placeholder="Address" runat="server"></asp:textbox>
                    
                            </div>
                        </div>
                    </div>

                   
               

            <%--<div class="col-sm-7">
                <h4>Member List</h4>
                <div class="table table-responsive">
                </div>
            </div>--%>
            </div>
        </div>
    </div>
</asp:Content>
