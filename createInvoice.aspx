<%@ Page Language="C#" AutoEventWireup="true" CodeFile="createInvoice.aspx.cs" Inherits="electronicspos.com.createInvoice" %>

<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <title>New Transaction</title>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="Main" Runat="Server">
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="Create" runat="server">
                <div>
                    <br />
                    Customer ID:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="customerID" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="custIDRequired" runat="server" ControlToValidate="customerID" ErrorMessage="Customer ID Required"></asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="validCustID" runat="server" ControlToValidate="customerID" ErrorMessage="Enter a Valid Customer ID" ValidationExpression="^\d+$"></asp:RegularExpressionValidator>
                    <br />
                    <br />
                    Payment Method:&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="payment" runat="server">
                        <asp:ListItem Value="-1">Select Payment Method</asp:ListItem>
                        <asp:ListItem>Cash</asp:ListItem>
                        <asp:ListItem>Debit</asp:ListItem>
                        <asp:ListItem>Credit</asp:ListItem>
                    </asp:DropDownList>
                    <asp:RegularExpressionValidator ID="paymentRequired" runat="server" ControlToValidate="payment" ErrorMessage="Select Payment Method" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
                </div>
                <p>
                    Home Delivery?:&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="delivery" runat="server">
                        <asp:ListItem Value="0">No</asp:ListItem>
                        <asp:ListItem Value="1">Yes</asp:ListItem>
                    </asp:DropDownList>
                </p>
                <p>
                    <asp:Button ID="startInvoice" runat="server" OnClick="startInvoice_Click" Text="Create Invoice" />
                </p>
            </asp:View>
            <asp:View ID="AddItem" runat="server">
                <div>
                    Add Product to Invoice<br />
                    <br />
                    Product ID:&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="productList" runat="server" AutoPostBack="True" DataTextField="name" DataValueField="productID">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="prodRequired" runat="server" ControlToValidate="productList" ErrorMessage="Select a Product" MaximumValue="999999" MinimumValue="0"></asp:RangeValidator>
                    <br />
                    Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="quantity" runat="server" TextMode="Number"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="quantityRequired" runat="server" ControlToValidate="quantity" ErrorMessage="Enter a Quantity"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;
                    <asp:RangeValidator ID="validQuantity" runat="server" ControlToValidate="quantity" ErrorMessage="Enter a Valid Quantity" MaximumValue="9999" MinimumValue="0"></asp:RangeValidator>
                    <br />
                    <asp:Label ID="StockWarning" runat="server"></asp:Label>
                    <asp:Label ID="LowStockError" runat="server"></asp:Label>
                    <br />
                    <br />
                </div>
                <asp:Button ID="anotherItem" runat="server" OnClick="anotherItem_Click" Text="Add Another Item" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="finalize" runat="server" OnClick="finalize_Click" Text="Add and Finalize Invoice" />
                <br />
                <br />
                Item List:<br />
                <asp:TextBox ID="SoldSoFar" runat="server" Height="191px" ReadOnly="True" TextMode="MultiLine" Width="670px"></asp:TextBox>
                <br />
                <br />
                Total Sales:
                <asp:Label ID="SalesSoFar" runat="server" Text="$0.00"></asp:Label>
            </asp:View>
            <asp:View ID="Summary" runat="server">
                <asp:Label ID="StockWarning1" runat="server"></asp:Label>
                <br />
                <br />
                A new invoice has been successfully created!<br />
                <br />
                Invoice ID:
                <asp:Label ID="labelInvoice" runat="server"></asp:Label>
                <br />
                Employee ID:
                <asp:Label ID="labelEmployee" runat="server"></asp:Label>
                <br />
                Customer ID:
                <asp:Label ID="labelCustomer" runat="server"></asp:Label>
                <br />
                <br />
                Paid By:
                <asp:Label ID="labelPayment" runat="server"></asp:Label>
                <br />
                Shipping Address:
                <asp:Label ID="labelAddress" runat="server">Not Applicable</asp:Label>
                <br />
                <br />
                Item List:<br />
                <asp:TextBox ID="listSales" runat="server" Height="147px" ReadOnly="True" TextMode="MultiLine" Width="666px"></asp:TextBox>
                <br />
                <br />
                Total Sales:
                <asp:Label ID="labelTotal" runat="server"></asp:Label>
                <br />
                <br />
                <asp:Button ID="newInvoice" runat="server" OnClick="newInvoice_Click" Text="Create New Invoice" />
            </asp:View>
        </asp:MultiView>
    </asp:Content>
