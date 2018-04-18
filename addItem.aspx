<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addItem.aspx.cs" Inherits="electronicspos.com.addItem" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Add Product to Invoice<br />
            <br />
            Product ID:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="product" runat="server"></asp:TextBox>
            <br />
            Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="quantity" runat="server"></asp:TextBox>
            <br />
            <br />
            <br />
        </div>
        <asp:Button ID="Button1" runat="server" Text="Add Another Item" OnClick="Button1_Click" />
&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" Text="Finalize Invoice" OnClick="Button2_Click" />
    </form>
</body>
</html>
