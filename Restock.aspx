<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Restock.aspx.cs" Inherits="Restock" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            height: 32px;
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
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="DepartmentList" ErrorMessage="Please select department from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>Product name:</td>
                    <td>
            <asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =400px AutoPostBack="True" >
        </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator4" runat="server" ControlToValidate="ProductList" ErrorMessage="Please select one product from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>Supplier</td>
                    <td>
            <asp:DropDownList ID="SupplierList" DataTextField = "company_name" DataValueField = "companyID" runat="server">
            </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="SupplierList" ErrorMessage="Please select one supplier from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">
            <asp:Label ID="Label1" runat="server" Text="Quantity"></asp:Label>
                    </td>
                    <td class="auto-style2">
            <asp:TextBox ID="quantityTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="quantityTxt"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator2" runat="server" ControlToValidate="quantityTxt" ErrorMessage="Quantity has to be positive whole number." MinimumValue="1" MaximumValue="1000" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td>
                        Stock price:</td>
                    <td><asp:TextBox ID="PriceTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PriceTxt" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="PriceTxt" ErrorMessage="Price has to be positive." MinimumValue="0" MaximumValue="20000" Type="Double"></asp:RangeValidator>
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
