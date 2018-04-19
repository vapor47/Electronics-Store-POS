﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addEmployee.aspx.cs" Inherits="electronicspos.com.addEmployee" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Employee Entree Form<br />
            <br />
            First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Fname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="fnameRequired" runat="server" ControlToValidate="Fname" ErrorMessage="First Name is Required"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="fnameAlpha" runat="server" ControlToValidate="Fname" ErrorMessage="Enter a Valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            Middle Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Mname" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="mnameAlpha" runat="server" ControlToValidate="Mname" ErrorMessage="Enter a Valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Lname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="lnameRequired" runat="server" ControlToValidate="Lname" ErrorMessage="Last Name is Required"></asp:RequiredFieldValidator>
&nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="lnameAlpha" runat="server" ControlToValidate="Lname" ErrorMessage="Enter a Valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            <br />
            Privledge:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="privledge" runat="server">
                <asp:ListItem Value="0">Employee</asp:ListItem>
                <asp:ListItem Value="1">Manager</asp:ListItem>
            </asp:DropDownList>
            <br />
            <br />
        </div>
        <asp:Button ID="submitEmployee" runat="server" OnClick="submitEmployee_Click" Text="Add Employee" />
        <p>
            &nbsp;</p>
    </form>
</body>
</html>
