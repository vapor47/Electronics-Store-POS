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
            <br />
            Company Type:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:DropDownList ID="companyType" runat="server">
                <asp:ListItem>Computers</asp:ListItem>
                <asp:ListItem>CELL PHONES</asp:ListItem>
                <asp:ListItem>TV &amp; HOME THEATER</asp:ListItem>
                <asp:ListItem>PHOTOGRAPHY</asp:ListItem>
                <asp:ListItem>APPLIANCES</asp:ListItem>
            </asp:DropDownList>
        </div>
        <p>
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Supplier" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return to Home Page" />
        </p>
    </form>
</body>
</html>
