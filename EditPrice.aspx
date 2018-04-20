<%@ Page Language="C#" MasterPageFile="~/pos.master" AutoEventWireup="true"  CodeFile="EditPrice.aspx.cs" Inherits="EditPrice" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
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
                        <asp:RangeValidator ID="RangeValidator3" runat="server" ControlToValidate="PriceTxt" ErrorMessage="Price has to be positive number." MinimumValue="0" MaximumValue="20000" Type="Double"></asp:RangeValidator>
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
</asp:Content>

