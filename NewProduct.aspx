<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NewProduct.aspx.cs" Inherits="NewProduct" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>AA</title>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ModelTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Brand</td>
                    <td>
                        <asp:TextBox ID="BrandTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="BrandTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Description</td>
                    <td>
                        <asp:TextBox ID="DescriptionTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DescriptionTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Department</td>
                    <td>
                        <asp:DropDownList ID="DepartmentList" runat="server">
                            <asp:ListItem Value="0">Please choose a department</asp:ListItem>
                            <asp:ListItem Value="1">1. Computers</asp:ListItem>
                            <asp:ListItem Value="2">2. Cell Phones</asp:ListItem>
                            <asp:ListItem Value="3">3. TV & Home Theaters</asp:ListItem>
                            <asp:ListItem Value="4">4. Photography</asp:ListItem>
                            <asp:ListItem Value="5">5. Appliances</asp:ListItem>                           
                        </asp:DropDownList><asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Please select a department from the list." ControlToValidate="DepartmentList" MaximumValue="5" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Color</td>
                    <td>
                        <asp:TextBox ID="ColorTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ColorTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Size</td>
                    <td>
                        <asp:TextBox ID="SizeTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="SizeTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="CreateBtn" runat="server" CausesValidation =" True" Text="Create" OnClick="CreateBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
