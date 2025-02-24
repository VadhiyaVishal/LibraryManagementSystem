<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminSite.Master" AutoEventWireup="true" CodeBehind="up_member.aspx.cs" Inherits="Library_Management.Admin.up_member" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="container-fluid">
        <div class="row" style="margin-left: 500px;">
            <div class="col-sm-6 border">
                <br />
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtMemberID" CssClass="form-control" placeholder="Member ID" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="*Enter Member ID" ControlToValidate="txtMemberID" ForeColor="Red" ValidationGroup="btnsearch"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group text-center">
                            <asp:Button ID="btnSearchMember" Text="Search" CssClass="btn btn-success" runat="server" OnClick="btnSearchMember_Click" ValidationGroup="btnsearch" />
                            <asp:Button ID="btnActiveMember" Text="Active" CssClass="btn btn-primary" runat="server" OnClick="btnActiveMember_Click" ValidationGroup="btnsearch" />
                            <asp:Button ID="btnPendingMember" Text="Pending" CssClass="btn btn-info" runat="server" ValidationGroup="btnsearch" OnClick="btnPendingMember_Click" />
                            <asp:Button ID="btnDeactiveMember" Text="Deactive" CssClass="btn btn-danger" runat="server" ValidationGroup="btnsearch" OnClick="btnDeactiveMember_Click" />

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtFullName" CssClass="form-control" placeholder="Full Name" runat="server"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtDOB" CssClass="form-control" placeholder="DOB" TextMode="Date" runat="server"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtContactNO" CssClass="form-control" placeholder="Contact No." runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtEmail" CssClass="form-control" placeholder="Email" TextMode="Email" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-6">
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
                    </div>
                    <div class="col-6">
                        <div class="form-group">
                            <asp:TextBox ID="txtCity" CssClass="form-control" placeholder="City" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtPIN" CssClass="form-control" placeholder="PIN CODE" runat="server"></asp:TextBox>

                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="col-12">
                        <div class="form-group">
                            <asp:TextBox ID="txtAddress" CssClass="form-control" placeholder="Address" runat="server"></asp:TextBox>
                        </div>
                    </div>
                </div>
            </div>
            <div class="col-sm-8">
            </div>
        </div>
        <br />
        <br />
        <div class="row">
            <div class="col-sm-12">
                <h4>Member List</h4>
                <div class="table table-responsive">
                    <asp:GridView ID="GridView1" CssClass="table table-sm" runat="server" AutoGenerateColumns="false" AllowPaging="true" OnPageIndexChanging="GridView1_PageIndexChanging" OnRowCancelingEdit="GridView1_RowCancelingEdit" OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" OnRowDeleting="GridView1_RowDeleting" PageSize="5" Font-Size="8" OnRowDataBound="GridView1_RowDataBound">
                        <HeaderStyle BackColor="#0066FF" Font-Bold="true" ForeColor="White" />
                        <FooterStyle BackColor="#3366CC" />
                        <Columns>

                            <asp:TemplateField HeaderText="ID">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayID" runat="server" Text='<%# Eval("member_id") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Name">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayName" runat="server" Text='<%# Eval("full_name") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditName" CssClass="form-control" runat="server" Text='<%# Eval("full_name") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="DOB">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplaydob" runat="server" Text='<%# Eval("dob") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditdob" CssClass="form-control" runat="server" Text='<%# Eval("dob") %>' TextMode="Date"></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Contact">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayContact" runat="server" Text='<%# Eval("contact_no") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditContact" CssClass="form-control" runat="server" Text='<%# Eval("contact_no") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Email">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayEmail" runat="server" Text='<%# Eval("email") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditEmail" CssClass="form-control" runat="server" Text='<%# Eval("email") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="State">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayState" runat="server" Text='<%# Eval("state") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:Label ID="lblEditState" runat="server" Text='<%# Eval("state") %>' Visible="false"></asp:Label>
                                    <asp:DropDownList ID="ddlEditState" CssClass="form-control" runat="server">
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
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="City">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayCity" runat="server" Text='<%# Eval("city") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditCity" CssClass="form-control" runat="server" Text='<%# Eval("city") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>

                            <asp:TemplateField HeaderText="Pincode">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayPincode" runat="server" Text='<%# Eval("pincode") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditPincode" CssClass="form-control" runat="server" Text='<%# Eval("pincode") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Address">
                                <ItemTemplate>
                                    <asp:Label ID="lblDisplayAddress" runat="server" Text='<%# Eval("full_address") %>'></asp:Label>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:TextBox ID="txtEditAddress" CssClass="form-control" runat="server" Text='<%# Eval("full_address") %>'></asp:TextBox>
                                </EditItemTemplate>
                            </asp:TemplateField>


                            <asp:TemplateField HeaderText="Active">
                                <ItemTemplate>
                                    <center>
                                    <asp:LinkButton ID="lnkEdit" CssClass="table-link text-primary" runat="server" ToolTip="Edit Record" CommandName="Edit">
                                              <span class="fa-stack">
                                             <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-pencil fa-stack-1x fa-inverse"></i>
                                             </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnKDelete" CssClass="table-link text-danger" runat="server" Text="Delete" CommandName="Delete" ToolTip="DeleteRecord" OnClientClick="return confirm('Do you want to delete this row?');">
                                        <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                         <i class="fa fa-trash fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton></center>
                                </ItemTemplate>
                                <EditItemTemplate>
                                    <asp:LinkButton ID="lnkUpdate" CssClass="table-link text-success" runat="server" CommandName="Update" Text="Update" ToolTip="Update Record">
                                              <span class="fa-stack">
                                             <i class="fa fa-square fa-stack-2x"></i>
                                            <i class="fa fa-spinner fa-stack-1x fa-inverse"></i>
                                             </span>
                                    </asp:LinkButton>
                                    <asp:LinkButton ID="lnkCancle" CssClass="table-link text-danger" runat="server" CommandName="Cancle" Text="Cancle" ToolTip="Cancle Record">
                                        <span class="fa-stack">
                                        <i class="fa fa-square fa-stack-2x"></i>
                                         <i class="fa fa-times-circle fa-stack-1x fa-inverse"></i>
                                        </span>
                                    </asp:LinkButton>
                                </EditItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <PagerSettings Mode="NumericFirstLast" PageButtonCount="4" FirstPageText="First" LastPageText="Last" />
                    </asp:GridView>
                </div>
            </div>
        </div>
    </div>
</asp:Content>
