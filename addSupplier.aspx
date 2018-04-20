﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSupplier.aspx.cs" Inherits="electronicspos.com.addSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server">
            <asp:View ID="EntreeForm" runat="server">
                <div>
                    Supplier Entreee Form<br />
                    <br />
                    Company Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="nameRequired" runat="server" ControlToValidate="name" ErrorMessage="Company Name is Required"></asp:RequiredFieldValidator>
                    <br />
                    Company Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="compType" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="typeRequired" runat="server" ControlToValidate="compType" ErrorMessage="Company Type is Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validType" runat="server" ControlToValidate="compType" ErrorMessage="Enter a Valid Type" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
                </div>
                <p>
                    <asp:Button ID="submitSupplier" runat="server" OnClick="submitSupplier_Click" Text="Add Supplier" />
                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                </p>
            </asp:View>
            <asp:View ID="Summary" runat="server">A new supplier has been successfully added!<br />
                <br />
                Company Name:
                <asp:Label ID="labelName" runat="server"></asp:Label>
                <br />
                Company Type:
                <asp:Label ID="labelType" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button ID="anotherSupplier" runat="server" OnClick="anotherSupplier_Click" Text="Add Another Supplier" />
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
