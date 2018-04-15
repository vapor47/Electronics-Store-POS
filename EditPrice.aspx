<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditPrice.aspx.cs" Inherits="EditPrice" %>



<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 570px;
        }
        .auto-style3 {
            width: 570px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 570px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Department:</td>
                    <td>   <asp:DropDownList ID="DepartmentList" DataTextField = "Dept_name" DataValueField = "Dept_number" runat="server" Width =200px OnSelectedIndexChanged="DepartmentList_SelectedIndexChanged" AutoPostBack="True" >
            </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style2">Product name:</td>
                    <td> <asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =400px AutoPostBack="True" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" >
        </asp:DropDownList></td>
                </tr>
                <tr>
                    <td class="auto-style3">In stock:</td>
                    <td class="auto-style4">
                        <asp:Label ID="quantityLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Current Price:</td>
                    <td>
                        <asp:Label ID="PriceLabel" runat="server" Text=""></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">New Price:</td>
                    <td class="auto-style6">
                        $<asp:TextBox ID="PriceTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="ApplyBtn" runat="server" Text="Apply" OnClick="ApplyBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
