<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restock.aspx.cs" Inherits="Restock" %>

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

            <table class="auto-style1">
                <tr>
                    <td>Department:</td>
                    <td>

            <asp:DropDownList ID="DepartmentList" DataTextField = "Dept_name" DataValueField = "Dept_number" runat="server" Width =200px OnSelectedIndexChanged="DepartmentList_SelectedIndexChanged" AutoPostBack="True" >
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Product name:</td>
                    <td>
            <asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =400px AutoPostBack="True" >
        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>Supplier</td>
                    <td>
            <asp:DropDownList ID="SupplierList" DataTextField = "company_name" DataValueField = "companyID" runat="server">
            </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td>
            <asp:Label ID="Label1" runat="server" Text="Quantity"></asp:Label>
                    </td>
                    <td>
            <asp:TextBox ID="quantityTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        Stock price:</td>
                    <td><asp:TextBox ID="PriceTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>&nbsp;</td>
                    <td>
            <asp:Button ID="Button1" runat="server" Text="Restock" OnClick="Button1_Click" />
                    </td>
                </tr>
            </table>
            <br />
            </br>
            </br>
            </br>
            </br>
            </br>
        </div>
        
    </form>
</body>
</html>
