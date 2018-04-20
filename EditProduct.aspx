<%@ Page Language="C#" MasterPageFile="~/pos.master" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="test" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Department:</td>
                    <td>   <asp:DropDownList ID="DepartmentList" DataTextField = "Dept_name" DataValueField = "Dept_number" runat="server" Width =200px OnSelectedIndexChanged="DepartmentList_SelectedIndexChanged" AutoPostBack="True" >
            </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator5" runat="server" ControlToValidate="DepartmentList" ErrorMessage="Please select department from the list." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Product name:</td>
                    <td class="auto-style6"> <asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =400px AutoPostBack="True" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" >
        </asp:DropDownList>
                        <asp:RangeValidator ID="RangeValidator6" runat="server" ControlToValidate="ProductList" ErrorMessage="Please select a product." MaximumValue="1000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">Model</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="modelTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="modelTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Brand</td>
                    <td>
                        <asp:TextBox ID="brandTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="BrandTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Name</td>
                    <td>
                        <asp:TextBox ID="nameTxt" runat="server" Width =300px></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="nameTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Color</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="colorTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="colorTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Size</td>
                    <td>
                        <asp:TextBox ID="sizeTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="sizeTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        <asp:Button ID="ApplyBtn" runat="server" Text="Apply changes" OnClick="ApplyBtn_Click" />
                    </td>
                </tr>
            </table>
        </div>
</asp:Content>



