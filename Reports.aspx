<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Reports.aspx.cs" Inherits="ElectronicsPOS.Reports" MasterPageFile="~/pos.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>Reports</title>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
    <asp:Menu ID="Menu1" runat="server" OnMenuItemClick="Menu1_MenuItemClick">
        <Items>
            <asp:MenuItem Selected="True" Text="Sales Report" Value="0"></asp:MenuItem>
            <asp:MenuItem Text="Inventory Report" Value="1"></asp:MenuItem>
            <asp:MenuItem Text="Restock Report" Value="2"></asp:MenuItem>
            <asp:MenuItem Text="Customer Purchase History" Value="3"></asp:MenuItem>
            <asp:MenuItem Text="Transaction Details" Value="4"></asp:MenuItem>
            <asp:MenuItem Text="Customer Information" Value="5"></asp:MenuItem>
            <asp:MenuItem Text="Employee Information" Value="6"></asp:MenuItem>
        </Items>
    </asp:Menu>
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">

        <asp:View ID="TotalSalesReport" runat="server">
            <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Total Sales"></asp:Label>
            <br />
            <asp:Panel ID="Panel11" runat="server">
                <asp:Label ID="Label14" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
                </asp:Panel>
            <asp:Panel ID="Panel12" runat="server" Direction="LeftToRight" Height="30px">
                <asp:Label ID="Label15" runat="server" Text="Start Date: "></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox6" runat="server" OnTextChanged="TextBox6_TextChanged" TextMode="Date"></asp:TextBox>
                &nbsp;<asp:Label ID="Label18" runat="server" Text="End Date: "></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox7" runat="server" OnTextChanged="TextBox7_TextChanged" TextMode="Date"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel13" runat="server">
                <asp:Button ID="Button1" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="TotalSales_Click" />
                <hr />
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView4" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataKeyNames="invoiceID" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="date_time" HeaderText="Date &amp; Time" SortExpression="date_time" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cust_ID" HeaderText="Customer ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="emp_ID" HeaderText="Employee ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalSales" DataFormatString="{0:C}" HeaderText="Total Sale" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
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
                </div>
                <asp:Label ID="Label20" runat="server"></asp:Label>
            </asp:Panel>
        </asp:View>

        <asp:View ID="InventoryReport" runat="server">
            <asp:Label ID="Label10" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Inventory Report"></asp:Label>
            <br />
            <asp:Panel ID="Panel5" runat="server">
                <asp:Label ID="Label11" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel8" runat="server" Direction="LeftToRight" Height="30px">
                &nbsp;<asp:Label ID="Label12" runat="server" Text="Product ID: "></asp:Label>
                <asp:TextBox ID="TextBox3" runat="server" OnTextChanged="TextBox3_TextChanged"></asp:TextBox>
            </asp:Panel>
            &nbsp;<asp:Label ID="Label13" runat="server" Text="Brand: "></asp:Label>
            <asp:TextBox ID="TextBox4" runat="server" OnTextChanged="TextBox4_TextChanged"></asp:TextBox>
            &nbsp;<br />&nbsp;&nbsp;<asp:Label ID="Label17" runat="server" Text="Name: "></asp:Label>
            <asp:TextBox ID="TextBox5" runat="server" OnTextChanged="TextBox5_TextChanged"></asp:TextBox>
            <br />
            &nbsp;Quantity Below:
            <asp:TextBox ID="TextBox11" runat="server" OnTextChanged="TextBox11_TextChanged"></asp:TextBox>
            <asp:Panel ID="Panel10" runat="server">
                <div>
                </div>
                <asp:Button ID="Button3" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Inventory_Click" />
                <br />
                <asp:Label ID="Label30" runat="server"></asp:Label>
                <hr />
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="productID" HeaderText="Product ID" SortExpression="productID" />
                            <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                            <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                            <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                            <asp:BoundField DataField="dept_no" HeaderText="Department #" SortExpression="dept_no" Visible="False" />
                            <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                            <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                            <asp:BoundField DataField="quantity" HeaderText="Quantity" SortExpression="quantity" />
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
                </div>
                <asp:Label ID="Label16" runat="server"></asp:Label>
            </asp:Panel>
        </asp:View>

        <asp:View ID="RestockHistory" runat="server">
            <asp:Label ID="Label19" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Restock History"></asp:Label>
            <br />
            <asp:Panel ID="Panel4" runat="server">
                <asp:Label ID="Label21" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
                </asp:Panel>
            <asp:Panel ID="Panel14" runat="server" Direction="LeftToRight" Height="30px">
                <asp:Label ID="Label27" runat="server" Text="Start Date: "></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox12" runat="server" OnTextChanged="TextBox6_TextChanged" TextMode="Date"></asp:TextBox>
                &nbsp;<asp:Label ID="Label28" runat="server" Text="End Date: "></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox13" runat="server" OnTextChanged="TextBox7_TextChanged" TextMode="Date"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel15" runat="server">
                <asp:Button ID="Button5" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Restock_Click" />
                <hr />
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView7" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="stock_date" HeaderText="Date &amp; Time" SortExpression="stock_date" DataFormatString="{0:d}" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="company_name" HeaderText="Supplier" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="productID" HeaderText="Product ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="name" HeaderText="Product Name" >
                            </asp:BoundField>
                            <asp:BoundField DataField="stock_quantity" HeaderText="Quantity Restocked" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="stock_price" DataFormatString="{0:C}" HeaderText="Supplier Price" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
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
                </div>
                <asp:Label ID="Label29" runat="server"></asp:Label>
            </asp:Panel>
        </asp:View>

        <asp:View ID="CustomerPurchaseHistory" runat="server">
            <asp:Label ID="Label31" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Purchase History"></asp:Label>
            <br />
            <asp:Panel ID="Panel16" runat="server">
                <asp:Label ID="Label32" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
                </asp:Panel>
            <asp:Panel ID="Panel19" runat="server" Direction="LeftToRight" Height="30px">
                <asp:Label ID="Label36" runat="server" Text="Customer ID: "></asp:Label>
                <asp:TextBox ID="TextBox16" runat="server" OnTextChanged="TextBox1_TextChanged"></asp:TextBox>
                </asp:Panel>
            <asp:Panel ID="Panel17" runat="server" Direction="LeftToRight" Height="30px">
                <asp:Label ID="Label33" runat="server" Text="Start Date: "></asp:Label>
                &nbsp;<asp:TextBox ID="TextBox14" runat="server" OnTextChanged="TextBox6_TextChanged" TextMode="Date"></asp:TextBox>
                &nbsp;<asp:Label ID="Label34" runat="server" Text="End Date: "></asp:Label>
                &nbsp;
                <asp:TextBox ID="TextBox15" runat="server" OnTextChanged="TextBox7_TextChanged" TextMode="Date"></asp:TextBox>
            </asp:Panel>
            <asp:Panel ID="Panel18" runat="server">
                <asp:Button ID="Button6" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="PurchaseHistory_Click" />
                <hr />
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView8" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" DataKeyNames="invoiceID">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="date_time" HeaderText="Date &amp; Time" SortExpression="date_time" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="cust_ID" HeaderText="Customer ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="emp_ID" HeaderText="Employee ID" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="totalSales" DataFormatString="{0:C}" HeaderText="Total Sale" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
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
                </div>
                <asp:Label ID="Label35" runat="server"></asp:Label>
            </asp:Panel>
        </asp:View>

        <asp:View ID="TransactionDetails" runat="server">
            <asp:Label ID="Label37" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Transaction Details"></asp:Label>
            <br />
            <asp:Panel ID="Panel20" runat="server">
                <asp:Label ID="Label38" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel21" runat="server" Direction="LeftToRight" Height="30px">
                &nbsp;<asp:Label ID="Label39" runat="server" Text="Transaction ID: "></asp:Label>
                <asp:TextBox ID="TextBox17" runat="server" OnTextChanged="TextBox17_TextChanged"></asp:TextBox>
                </asp:Panel>
            <asp:Panel ID="Panel22" runat="server">
                <div>
                </div>
                <asp:Button ID="Button7" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="TransactionDetails_Click" />
                <hr />
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:POSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] WHERE ((@customerID is NULL) OR ([customerID] = @customerID)) AND ((@customer_email = '') OR ([customer_email] = @customer_email))" onselected="SqlDataSource1_Selected">
                    <SelectParameters>
                        <asp:FormParameter FormField="TextBox1" Name="customerID" Type="Int32" />
                        <asp:FormParameter FormField="TextBox2" Name="customer_email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView9" runat="server" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="date_time" HeaderText="Date & Time" SortExpression="date_time" DataFormatString="{0:G}" />
                            <asp:BoundField DataField="totalSales" HeaderText="Total Sale" SortExpression="totalSales" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="payment_method" HeaderText="Payment Method" SortExpression="payment_method" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="home_delivery" HeaderText="Delivery Requested" SortExpression="home_delivery" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
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
                    <asp:Label ID="Label41" runat="server"></asp:Label>
                </div>
                <asp:Label ID="Label42" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView10" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="name" HeaderText="Product Name" SortExpression="name" />
                            <asp:BoundField DataField="quantity" HeaderText="Quantity Sold" SortExpression="quantity" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>
                            <asp:BoundField DataField="priceSold" HeaderText="Price When Sold" SortExpression="priceSold" DataFormatString="{0:C}" >
                            <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                            </asp:BoundField>

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
                </div>
            </asp:Panel>
        </asp:View>

        <asp:View ID="CustomerInfo" runat="server">
            <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Customer Information"></asp:Label>
            <br />
            <asp:Panel ID="Panel6" runat="server">
                <asp:Label ID="Label3" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
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
                <asp:Button ID="Button2" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Customer_Click" />
                <hr />
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:POSConnectionString %>" SelectCommand="SELECT * FROM [CUSTOMER] WHERE ((@customerID is NULL) OR ([customerID] = @customerID)) AND ((@customer_email = '') OR ([customer_email] = @customer_email))" onselected="SqlDataSource1_Selected">
                    <SelectParameters>
                        <asp:FormParameter FormField="TextBox1" Name="customerID" Type="Int32" />
                        <asp:FormParameter FormField="TextBox2" Name="customer_email" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="customerID" ForeColor="Black" GridLines="Vertical">
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
                </div>
                <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView3" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" SortExpression="invoiceID" />
                            <asp:BoundField DataField="date_time" HeaderText="Date & Time" SortExpression="date_time" DataFormatString="{0:G}" />
                            <asp:BoundField DataField="totalSales" HeaderText="Total Sale" SortExpression="totalSales" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="payment_method" HeaderText="Payment Method" SortExpression="payment_method" />

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
                    <asp:Label ID="Label25" runat="server"></asp:Label>
                </div>
            </asp:Panel>
        </asp:View>

        <asp:View ID="EmployeeInfo" runat="server">
            <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="XX-Large" Font-Underline="True" Text="Employee Information"></asp:Label>
            <br />
            <asp:Panel ID="Panel1" runat="server">
                <asp:Label ID="Label4" runat="server" Font-Size="Large" Text="Search Tools: "></asp:Label>
                <br />
            </asp:Panel>
            <asp:Panel ID="Panel2" runat="server" Direction="LeftToRight" Height="30px">
                &nbsp;<asp:Label ID="Label5" runat="server" Text="Employee ID: "></asp:Label>
                <asp:TextBox ID="TextBox8" runat="server" OnTextChanged="TextBox8_TextChanged"></asp:TextBox>
                </asp:Panel>
            &nbsp;<asp:Label ID="Label6" runat="server" Text="First Name: "></asp:Label>
            <asp:TextBox ID="TextBox9" runat="server" OnTextChanged="TextBox9_TextChanged"></asp:TextBox>
            &nbsp;<asp:Label ID="Label24" runat="server" Text="Last Name: "></asp:Label>
            <asp:TextBox ID="TextBox10" runat="server" OnTextChanged="TextBox10_TextChanged"></asp:TextBox>
            <asp:Panel ID="Panel3" runat="server">
                <div>
                </div>
                <asp:Button ID="Button4" runat="server" BorderColor="Black" BorderStyle="Solid" BorderWidth="3px" Font-Bold="True" Font-Names="Arial" Font-Overline="False" Font-Size="X-Large" ForeColor="Black" Height="70px" Text="Generate Report" Width="210px" OnClick="Employee_Click" />
                <hr />
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView5" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="Black" BorderStyle="Solid" BorderWidth="1px" CellPadding="4" DataKeyNames="employeeID" ForeColor="Black" GridLines="Vertical">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="employeeID" HeaderText="Employee ID" SortExpression="employeeID" />
                            <asp:BoundField DataField="Fname" HeaderText="First Name" SortExpression="Fname" />
                            <asp:BoundField DataField="Mname" HeaderText="Middle Name" SortExpression="Mname" />
                            <asp:BoundField DataField="Lname" HeaderText="Last Name" SortExpression="Lname" />
                            <asp:BoundField DataField="privilege" HeaderText="Privileges" SortExpression="privilege" />
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
                    <asp:Label ID="Label26" runat="server"></asp:Label>
                </div>
                <asp:Label ID="Label22" runat="server" Font-Bold="True" Font-Size="X-Large"></asp:Label>
                <div id="popup" style="max-height:300px;overflow-y:scroll;">
                    <asp:GridView ID="GridView6" runat="server" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" AutoGenerateColumns="False">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="invoiceID" HeaderText="Invoice ID" SortExpression="invoiceID" />
                            <asp:BoundField DataField="date_time" HeaderText="Date & Time" SortExpression="date_time" DataFormatString="{0:G}" />
                            <asp:BoundField DataField="totalSales" HeaderText="Total Sale" SortExpression="totalSales" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="payment_method" HeaderText="Payment Method" SortExpression="payment_method" />

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
                </div>
                <asp:Label ID="Label23" runat="server"></asp:Label>
            </asp:Panel>
        </asp:View>
    </asp:MultiView>
</asp:Content>
