<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagerView.aspx.cs" Inherits="ManagerView" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 360px;
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
                    <td class="auto-style2">
                        <asp:Button ID="Button5" runat="server" Text="All products" OnClick="Button5_Click" />
                    </td>
                    <td>
                        <asp:Button ID="newBtn" runat="server" Text="New Product" OnClick="newBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="CheckBtn" runat="server" Text="Check Price/Stock" OnClick="CheckBtn_Click" />
                    </td>
                    <td>
                        <asp:Button ID="RestockBtn" runat="server" Text="Restock" OnClick="RestockBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        <asp:Button ID="Button7" runat="server" Text="Report" OnClick="Button7_Click" />
                    </td>
                    <td>
                        <asp:Button ID="Button6" runat="server" Text="Edit price" OnClick="Button6_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                        <asp:Button ID="EditBtn" runat="server" Text="Edit Product" OnClick="EditBtn_Click" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
