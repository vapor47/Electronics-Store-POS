<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createInvoice.aspx.cs" Inherits="electronicspos.com.createInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Invoice Entree Form<br />
            <br />
            Customer ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="customerID" runat="server" style="margin-top: 0px"></asp:TextBox>
            <br />
            Employee ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="employeeeID" runat="server"></asp:TextBox>
            <br />
            <br />
            Payment Method:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="payment" runat="server"></asp:TextBox>
        </div>
        <p>
            Home Delivery?:&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="delivery" runat="server">
                <asp:ListItem Value="1">Yes</asp:ListItem>
                <asp:ListItem Value="0">No</asp:ListItem>
            </asp:DropDownList>
        </p>
        <p>
            &nbsp;</p>
        <asp:Button ID="Button1" runat="server" Text="Create Invoice" OnClick="Button1_Click" />
    &nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return to Home Page" />
    </form>
</body>
</html>
