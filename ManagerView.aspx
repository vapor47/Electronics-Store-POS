<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerView.aspx.cs" Inherits="ManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Label ID="WelcomeLabel" runat="server" Text=""></asp:Label>
            <asp:Button ID="LogoutBtn" runat="server" Text="Logout" OnClick="LogoutBtn_Click" />

            <br />
            <table class="auto-style1">
                <tr>
                    <td>
                        <asp:Button ID="CheckBtn" runat="server" Text="Check Price/Stock" OnClick="CheckBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="RestockBtn" runat="server" Text="Restock" OnClick="RestockBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="newBtn" runat="server" Text="New Product" OnClick="newBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="EditBtn" runat="server" Text="Edit Product" OnClick="EditBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button5" runat="server" Text="Button" />
                    </td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
