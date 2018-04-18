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
            width: 282px;
        }
        .auto-style3 {
            width: 282px;
            height: 23px;
        }
        .auto-style4 {
            height: 23px;
        }
        .auto-style5 {
            width: 282px;
            height: 26px;
        }
        .auto-style6 {
            height: 26px;
        }
        .auto-style7 {
            margin-left: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Department:</td>
                    <td>   <asp:DropDownList ID="DepartmentList" DataTextField = "Dept_name" DataValueField = "Dept_number" runat="server" Width =200px OnSelectedIndexChanged="DepartmentList_SelectedIndexChanged" AutoPostBack="True" CssClass="auto-style7" >
            </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="DepartmentList" ErrorMessage="Please select department from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Product name:</td>
                    <td> <asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =300px AutoPostBack="True" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" >
        </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="ProductList" ErrorMessage="Please select a product from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="PriceTxt" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="PriceTxt" ErrorMessage="Price has to be positive." MinimumValue="0" MaximumValue="20000" Type="Double"></asp:RangeValidator>
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
