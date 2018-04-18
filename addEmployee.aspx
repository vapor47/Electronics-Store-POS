<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addEmployee.aspx.cs" Inherits="electronicspos.com.addEmployee" %>

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
            <br />
            Middle Name:&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Mname" runat="server"></asp:TextBox>
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Lname" runat="server"></asp:TextBox>
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
        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Employee" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="Return to Home Page" />
    </form>
</body>
</html>
