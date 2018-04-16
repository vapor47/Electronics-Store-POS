<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewProduct.aspx.cs" Inherits="NewProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 152px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">Model</td>
                    <td>
                        <asp:TextBox ID="ModelTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Brand</td>
                    <td>
                        <asp:TextBox ID="BrandTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Description</td>
                    <td>
                        <asp:TextBox ID="DescriptionTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Department</td>
                    <td>
                        <asp:DropDownList ID="DepartmentList" runat="server">
                            <asp:ListItem Value="1">1. Computers</asp:ListItem>
                            <asp:ListItem Value="2">2. Cell Phones</asp:ListItem>
                            <asp:ListItem Value="3">3. TV & Home Theaters</asp:ListItem>
                            <asp:ListItem Value="4">4. Photography</asp:ListItem>
                            <asp:ListItem Value="5">5. Appliances</asp:ListItem>                           
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Color</td>
                    <td>
                        <asp:TextBox ID="ColorTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Size</td>
                    <td>
                        <asp:TextBox ID="SizeTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="CreateBtn" runat="server" Text="Create" OnClick="CreateBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
