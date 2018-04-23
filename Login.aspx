<%@ Page Title="LogIn" Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Login</title>
    <style type="text/css">
        .auto-style1 {
            width: 45%;
            margin-left: 237px;
            margin-right: 0px;
        }
        .auto-style2 {
            width: 39px;
        }
        .auto-style3 {
            width: 113px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
        <table class="auto-style1" border="1">
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="ID"></asp:Label>:</td>
                <td class="auto-style3">
            <asp:TextBox ID="txtID" runat="server"></asp:TextBox></td>
            </tr>
            <tr>
                <td class="auto-style2">
            <asp:Label ID="Label2" runat="server"  Text="Password"></asp:Label>:</td>
                <td class="auto-style3">
            <asp:TextBox ID="txtPass" TextMode="Password" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="auto-style2">&nbsp;</td>
                <td class="auto-style3">
            <asp:Button ID="LoginBtn" runat="server" Text="Login" OnClick="LoginBtn_Click" />
            <asp:Label ID="Label" runat="server" Text=""></asp:Label>
                </td>
            </tr>
        </table>
            <br />
            <br />
            <br />
        </div>
    </form>
</body>
</html>
