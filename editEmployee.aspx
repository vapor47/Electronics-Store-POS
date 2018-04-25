<%@ Page Title="" Language="C#" MasterPageFile="~/pos.Master" AutoEventWireup="true" CodeBehind="editEmployee.aspx.cs" Inherits="ElectronicsPOS.editEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
    <div>
            <table class="auto-style1">
                <tr>
                    <td class="auto-style2">Employee ID:</td>
                    <td>   <asp:TextBox ID="employeeID" runat="server" AutoPostBack="True" OnTextChanged="employeeID_TextChanged" ></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please enter an employee ID." ControlToValidate="employeeID"></asp:RequiredFieldValidator>
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
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="fnameTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Middle Name:</td>
                    <td>
                        <asp:TextBox ID="mnameTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="mnameTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">Last Name:</td>
                    <td>
                        <asp:TextBox ID="lnameTxt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="lnameTxt" ErrorMessage="Please fill in required information."></asp:RequiredFieldValidator>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style5">Privilege:</td>
                    <td class="auto-style6">
                        <asp:DropDownList ID="privilegeDrop" runat="server" AutoPostBack="True">
                            <asp:ListItem Value="0">Basic</asp:ListItem>
                            <asp:ListItem Value="1">Manager</asp:ListItem>
                        </asp:DropDownList>
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
