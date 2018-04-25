<%@ Page Language="C#" MasterPageFile="~/pos.master" AutoEventWireup="true" CodeFile="CheckStock.aspx.cs" Inherits="CheckStock" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
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
                    <td>Model number:</td>
                    <td>
                        <asp:Label ID="modelLbl" runat="server" Text=""></asp:Label></td>
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
            </table>
        </div>
</asp:Content>


