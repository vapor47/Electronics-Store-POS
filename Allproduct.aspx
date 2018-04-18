<%@ Page Language="C#" AutoEventWireup="true" CodeFile="EditProduct.aspx.cs" Inherits="CartTest" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="productID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:CommandField ShowEditButton="True" />
                    <asp:BoundField DataField="productID" HeaderText="Product ID" InsertVisible="False" ReadOnly="True" SortExpression="productID" />
                    <asp:BoundField DataField="brand" HeaderText="Brand" SortExpression="brand" />
                    <asp:BoundField DataField="model" HeaderText="Model" SortExpression="model" />
                    <asp:BoundField DataField="name" HeaderText="Name" SortExpression="name" />
                    <asp:BoundField DataField="size" HeaderText="Size" SortExpression="size" />
                    <asp:BoundField DataField="color" HeaderText="Color" SortExpression="color" />
                </Columns>
                <FooterStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#990000" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
                <RowStyle BackColor="#FFFBD6" ForeColor="#333333" />
                <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
                <SortedAscendingCellStyle BackColor="#FDF5AC" />
                <SortedAscendingHeaderStyle BackColor="#4D0000" />
                <SortedDescendingCellStyle BackColor="#FCF6C0" />
                <SortedDescendingHeaderStyle BackColor="#820000" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConflictDetection="CompareAllValues" ConnectionString="<%$ ConnectionStrings:POSConnectionString %>" DeleteCommand="DELETE FROM [PRODUCT] WHERE [productID] = @original_productID AND [model] = @original_model AND (([size] = @original_size) OR ([size] IS NULL AND @original_size IS NULL)) AND (([color] = @original_color) OR ([color] IS NULL AND @original_color IS NULL)) AND [brand] = @original_brand AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL))" InsertCommand="INSERT INTO [PRODUCT] ([model], [size], [color], [brand], [name]) VALUES (@model, @size, @color, @brand, @name)" OldValuesParameterFormatString="original_{0}" SelectCommand="SELECT [productID], [model], [size], [color], [brand], [name] FROM [PRODUCT]" UpdateCommand="UPDATE [PRODUCT] SET [model] = @model, [size] = @size, [color] = @color, [brand] = @brand, [name] = @name WHERE [productID] = @original_productID AND [model] = @original_model AND (([size] = @original_size) OR ([size] IS NULL AND @original_size IS NULL)) AND (([color] = @original_color) OR ([color] IS NULL AND @original_color IS NULL)) AND [brand] = @original_brand AND (([name] = @original_name) OR ([name] IS NULL AND @original_name IS NULL))">
                <DeleteParameters>
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_model" Type="String" />
                    <asp:Parameter Name="original_size" Type="String" />
                    <asp:Parameter Name="original_color" Type="String" />
                    <asp:Parameter Name="original_brand" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                </DeleteParameters>
                <InsertParameters>
                    <asp:Parameter Name="model" Type="String" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="color" Type="String" />
                    <asp:Parameter Name="brand" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                </InsertParameters>
                <UpdateParameters>
                    <asp:Parameter Name="model" Type="String" />
                    <asp:Parameter Name="size" Type="String" />
                    <asp:Parameter Name="color" Type="String" />
                    <asp:Parameter Name="brand" Type="String" />
                    <asp:Parameter Name="name" Type="String" />
                    <asp:Parameter Name="original_productID" Type="Int32" />
                    <asp:Parameter Name="original_model" Type="String" />
                    <asp:Parameter Name="original_size" Type="String" />
                    <asp:Parameter Name="original_color" Type="String" />
                    <asp:Parameter Name="original_brand" Type="String" />
                    <asp:Parameter Name="original_name" Type="String" />
                </UpdateParameters>
            </asp:SqlDataSource>
            <br />
        </div>
    </form>
</body>
</html>
