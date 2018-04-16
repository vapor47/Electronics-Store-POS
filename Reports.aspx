<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ElectronicsPOS.Reports" %>

<!DOCTYPE html>
<script runat="server">

    protected void Button1_Click(object sender, EventArgs e)
    {

    }
</script>


<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reports</title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
            <Items>
                <asp:MenuItem Selected="True" Text="Sales Report" Value="0"></asp:MenuItem>
                <asp:MenuItem Text="Inventory Report" Value="1"></asp:MenuItem>
                <asp:MenuItem Text="Restock Report" Value="2"></asp:MenuItem>
                <asp:MenuItem Text="Customer Purchase History" Value="3"></asp:MenuItem>
                <asp:MenuItem Text="Customer Information" Value="4"></asp:MenuItem>
                <asp:MenuItem Text="Employee Information" Value="5"></asp:MenuItem>
            </Items>
        </asp:Menu>
        <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
            <asp:View ID="TotalSalesReport" runat="server">
                <asp:Label ID="Label6" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Sales Report"></asp:Label>
                <br />
                <asp:Panel ID="Panel4" runat="server">
                    <asp:Label ID="Label1" runat="server" Font-Size="Large" Text="Additional Search Tools: "></asp:Label>
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel2" runat="server" Direction="LeftToRight" Height="30px">
                    <asp:Label ID="startDateLabel" runat="server" Text="Start Date: "></asp:Label>
                    &nbsp;<input id="startDateText" type="text" />
                    <asp:Label ID="endDateLabel" runat="server" Text="End Date: "></asp:Label>
                    &nbsp;<input id="endDateText" type="text" />
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
                    &nbsp;</asp:Panel>
                <asp:Panel ID="Panel1" runat="server">
                    <div>
                    </div>
                    <asp:Button ID="Button1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Button1_Click" />
                    <hr />
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
                <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Customer Information"></asp:Label>
                <br />
                <asp:Panel ID="Panel6" runat="server">
                    <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Additional Search Tools: "></asp:Label>
                    <br />
                </asp:Panel>
                <asp:Panel ID="Panel7" runat="server" Direction="LeftToRight" Height="30px">
                    &nbsp;<asp:Label ID="customerIDLabel" runat="server" Text="Customer ID: "></asp:Label>
                    <asp:TextBox ID="TextBox1" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                    </asp:Panel>
                &nbsp;<asp:Label ID="customerIDLabel0" runat="server" Text="Customer Email: "></asp:Label>
                <asp:TextBox ID="TextBox2" runat="server" OnTextChanged="TextBox2_TextChanged"></asp:TextBox>
                <asp:Panel ID="Panel9" runat="server">
                    <div>
                    </div>
                    <asp:Button ID="Button2" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Button2_Click" />
                    <hr />
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] WHERE ((@customerID is NULL) OR ([customerID] = @customerID)) AND ((@customer_email = '') OR ([customer_email] = @customer_email))" onselected="SqlDataSource1_Selected">
                        <SelectParameters>
                            <asp:FormParameter FormField="TextBox1" Name="customerID" Type="Int32" />
                            <asp:FormParameter FormField="TextBox2" Name="customer_email" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" DataKeyNames="customerID" ForeColor="Black" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged1">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="customerID" HeaderText="Customer ID" InsertVisible="False" ReadOnly="True" SortExpression="customerID" />
                            <asp:BoundField DataField="first_name" HeaderText="First Name" SortExpression="first_name" />
                            <asp:BoundField DataField="last_name" HeaderText="Last Name" SortExpression="last_name" />
                            <asp:BoundField DataField="customer_email" HeaderText="E-mail" SortExpression="customer_email" />
                            <asp:BoundField DataField="phone_no" HeaderText="Phone Number" SortExpression="phone_no" />
                            <asp:BoundField DataField="shipping_address" HeaderText="Street Address" SortExpression="shipping_address" />
                            <asp:BoundField DataField="zipcode" HeaderText="Zip Code" SortExpression="zipcode" />
                            <asp:BoundField DataField="city" HeaderText="City" SortExpression="city" />
                            <asp:BoundField DataField="state" HeaderText="State" SortExpression="state" />
                        </Columns>
                        <FooterStyle BackColor="#CCCC99" />
                        <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
                        <RowStyle BackColor="#F7F7DE" />
                        <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#FBFBF2" />
                        <SortedAscendingHeaderStyle BackColor="#848384" />
                        <SortedDescendingCellStyle BackColor="#EAEAD3" />
                        <SortedDescendingHeaderStyle BackColor="#575357" />
                    </asp:GridView>
                    <asp:Label ID="Label7" runat="server"></asp:Label>
                </asp:Panel>
            </asp:View>
            <asp:View ID="EmployeeInfo" runat="server">
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
