<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerView.aspx.cs" Inherits="ManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="WelcomeLabel" runat="server" Text=""></asp:Label>
            <asp:Button ID="LogoutBtn" runat="server" Text="Logout" OnClick="LogoutBtn_Click" />
        </div>
    </form>
</body>
</html>
