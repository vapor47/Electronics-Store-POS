<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createInvoice.aspx.cs" Inherits="electronicspos.com.createInvoice" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <asp:MultiView ID="MultiView1" runat="server" OnActiveViewChanged="MultiView1_ActiveViewChanged">
            <asp:View ID="View1" runat="server">
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
            <asp:View ID="View2" runat="server">
                <div>
                    Add Product to Invoice<br />
                    <br />
                    Product ID:&nbsp;&nbsp;&nbsp;
                    <asp:DropDownList ID="productList" runat="server" AutoPostBack="True" DataTextField="name" DataValueField="productID">
                    </asp:DropDownList>
                    <asp:RangeValidator ID="prodRequired" runat="server" ControlToValidate="productList" ErrorMessage="Select a Product" MaximumValue="999999" MinimumValue="0"></asp:RangeValidator>
                    <br />
                    Quantity:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:TextBox ID="quantity" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="quantityRequired" runat="server" ControlToValidate="quantity" ErrorMessage="Enter a Quantity"></asp:RequiredFieldValidator>
                    &nbsp;&nbsp;
                    <asp:RangeValidator ID="validQuantity" runat="server" ControlToValidate="quantity" ErrorMessage="Enter a Valid Quantity" MaximumValue="9999" MinimumValue="0"></asp:RangeValidator>
                    <br />
                    <br />
                    <br />
                </div>
                <asp:Button ID="anotherItem" runat="server" OnClick="anotherItem_Click" Text="Add Another Item" />
                &nbsp;&nbsp;&nbsp;
                <asp:Button ID="finalize" runat="server" OnClick="finalize_Click" Text="Finalize Invoice" />
            </asp:View>
        </asp:MultiView>
    </form>
</body>
</html>
