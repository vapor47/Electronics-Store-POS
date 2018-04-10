<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Hashpassword.aspx.cs" Inherits="Hashpassword" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="password" runat="server"></asp:TextBox>
            <asp:Button ID="Button1" runat="server" Text="HashIt" OnClick="Button1_Click" />
            <br />
            <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
        </div>
    </form>
</body>
</html>
