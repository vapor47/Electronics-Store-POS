﻿<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="ElectronicsPOS.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:Menu ID="Menu1" runat="server" Orientation="Horizontal" BackColor="#F7F6F3" DynamicHorizontalOffset="2" Font-Names="Verdana" Font-Size="0.8em" ForeColor="#7C6F57" StaticSubMenuIndent="10px">
                <DynamicHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <DynamicMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <DynamicMenuStyle BackColor="#F7F6F3" />
                <DynamicSelectedStyle BackColor="#5D7B9D" />
                <Items>
                    <asp:MenuItem NavigateUrl="Default.aspx" Text="Home" Value="Home"></asp:MenuItem>
                    <asp:MenuItem Text="New Item" Value="New Item"></asp:MenuItem>
                </Items>
                <StaticHoverStyle BackColor="#7C6F57" ForeColor="White" />
                <StaticMenuItemStyle HorizontalPadding="5px" VerticalPadding="2px" />
                <StaticSelectedStyle BackColor="#5D7B9D" />
            </asp:Menu>
        </div>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="TotalSalesReport" runat="server">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Sales Report"></asp:Label>
                <br />
                <asp:Panel ID="Panel4" runat="server">
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Additional Search Tools: "></asp:Label>
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Direction="LeftToRight" Height="30px">
                    <asp:Label ID="Label2" runat="server" Text="Start Date: "></asp:Label>
                    <input id="Text1" type="text" />
                    <asp:Label ID="Label3" runat="server" Text="End Date: "></asp:Label>
                    <input id="Text2" type="text" />
                </asp:Panel>
                &nbsp;<asp:Panel ID="Panel3" runat="server">
                    <asp:Label ID="Label4" runat="server" Text="Month: "></asp:Label>
                    &nbsp;<asp:DropDownList ID="DropDownList1" runat="server">
                        <asp:ListItem>January</asp:ListItem>
                        <asp:ListItem>February</asp:ListItem>
                        <asp:ListItem>March</asp:ListItem>
                        <asp:ListItem>April</asp:ListItem>
                        <asp:ListItem>May</asp:ListItem>
                        <asp:ListItem>June</asp:ListItem>
                        <asp:ListItem>July</asp:ListItem>
                        <asp:ListItem>August</asp:ListItem>
                        <asp:ListItem>September</asp:ListItem>
                        <asp:ListItem>October</asp:ListItem>
                        <asp:ListItem>November</asp:ListItem>
                        <asp:ListItem>December</asp:ListItem>
                    </asp:DropDownList>
                    <asp:Label ID="Label5" runat="server" Text="Year: "></asp:Label>
                    <input id="Text4" type="text" />
                </asp:Panel>
                <asp:Panel ID="Panel1" runat="server">
                    <div>
                        <hr />
                    </div>
                    <asp:Button ID="Button1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" />
                </asp:Panel>
            </asp:View>
            <asp:View ID="InventoryReport" runat="server">
                <asp:Panel ID="Panel5" runat="server">
                </asp:Panel>
            </asp:View>
            <asp:View ID="RestockRecords" runat="server">
            </asp:View>
            <asp:View ID="CustomerPurchaseHistory" runat="server">
            </asp:View>
            <asp:View ID="CustomerInfo" runat="server">
            </asp:View>
            <asp:View ID="EmployeeInfo" runat="server">
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
