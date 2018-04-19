<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addSupplier.aspx.cs" Inherits="electronicspos.com.addSupplier" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
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
        </div>
        <p>
            <asp:Button ID="submitSupplier" runat="server" OnClick="submitSupplier_Click" Text="Add Supplier" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </p>
    </form>
</body>
</html>
