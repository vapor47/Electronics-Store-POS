<%@ Page Title="" Language="C#" MasterPageFile="~/pos.Master" AutoEventWireup="true" CodeBehind="editCustomer.aspx.cs" Inherits="ElectronicsPOS.editCustomer" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Customer ID:</td>
                    <td>   <asp:TextBox ID="CustomerID" runat="server" AutoPostBack="True" OnTextChanged="CustomerID_TextChanged" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter a customer ID." ControlToValidate="CustomerID"></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td class="auto-style3">First Name:</td>
                    <td class="auto-style4">
                        <asp:TextBox ID="fnameTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name:</td>
                    <td>
                        <asp:TextBox ID="lnameTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">E-mail:</td>
                    <td>
                        <asp:TextBox ID="emailTxt" runat="server" TextMode="Email"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="emailTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Phone #:</td>
                    <td class="auto-style6">
                        <asp:TextBox ID="phoneTxt" runat="server" TextMode="Phone"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Address: </td>
                    <td>
                        <asp:TextBox ID="addressTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">City:</td>
                    <td>
                        <asp:TextBox ID="cityTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">State:</td>
                    <td>
                        <asp:TextBox ID="stateTxt" runat="server"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Zip Code:</td>
                    <td>
                        <asp:TextBox ID="zipTxt" runat="server" TextMode="Number"></asp:TextBox>
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


