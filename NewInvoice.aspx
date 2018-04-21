<%@ Page Language="C#" MasterPageFile="~/pos.master" AutoEventWireup="true" CodeFile="NewInvoice.aspx.cs" Inherits="NewInvoice" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Main" Runat="Server">
     <div >  
       
         <asp:Label ID="Label7" runat="server" Text="Employee ID: "></asp:Label>
         <asp:Label ID="EmployeeLbl" runat="server" Text="Label2"></asp:Label>
         <br />
         <asp:Label ID="Label8" runat="server" Text="Customer ID: "></asp:Label>
         <asp:Label ID="CustomerLbl" runat="server" Text=""></asp:Label>
         <br />
         <asp:Label ID="Label9" runat="server" Text="Invoice ID: "></asp:Label>
         <asp:Label ID="InvLbl" runat="server" Text=""></asp:Label>
         <br />
          <table style="width: 100%">
              <tr>
                  <td style="height: 22px"> Department</td>
                  <td style="height: 22px">Product name</td>
                  <td style="height: 22px">In stock</td>
                  <td style="height: 22px">Current price</td>
                  <td style="height: 22px">
                      Quantity</td>
              </tr>
              <tr>
                  <td style="height: 22px"> <asp:DropDownList ID="DepartmentList" DataTextField = "Dept_name" DataValueField = "Dept_number" runat="server" Width =200px OnSelectedIndexChanged="DepartmentList_SelectedIndexChanged" AutoPostBack="True" >
            </asp:DropDownList></td>
                  <td style="height: 22px"><asp:DropDownList ID="ProductList" DataTextField = "name" DataValueField = "productID" runat="server" Width =400px AutoPostBack="True" OnSelectedIndexChanged="ProductList_SelectedIndexChanged" >
        </asp:DropDownList></td>
                  <td style="height: 22px">
                      <asp:TextBox ID="StockTxt" IsReadOnly="True" runat="server"></asp:TextBox>
                  </td>
                  <td style="height: 22px"><asp:Label ID="PriceLabel" runat="server" Text=""></asp:Label></td>
                  <td style="height: 22px">
                      <asp:TextBox ID="QuantityTxt" runat="server"></asp:TextBox>
                      <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="QuantityTxt" ErrorMessage="Quantity must be a positve whole number" MaximumValue="10000" MinimumValue="1" Type="Integer"></asp:RangeValidator>
                  </td>
              </tr>
              <tr>
                  <td style="height: 22px"> &nbsp;</td>
                  <td style="height: 22px">&nbsp;</td>
                  <td style="height: 22px">&nbsp;</td>
                  <td style="height: 22px">&nbsp;</td>
                  <td style="height: 22px">
                      <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Quantity cannot be empty." ControlToValidate="QuantityTxt"></asp:RequiredFieldValidator>
                      <asp:CompareValidator ID="CompareValidator1" runat="server"
                          ControlToValidate="QuantityTxt" controltocompare="StockTxt" operator="LessThanEqual"
                          ErrorMessage="Quantity must be smaller than stock" Type="Integer"></asp:CompareValidator>
                  </td>
              </tr>
         </table>
         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Add Item" />
<br />
          <br />
         <asp:Table ID="Table1" runat="server"></asp:Table>
         <br />
         <asp:Label ID="Label6" runat="server" Text="Current total: $"></asp:Label>
         <asp:Label ID="TotalLbl" runat="server" Text=""></asp:Label>
         <br />
         <asp:Button ID="Button2" runat="server" Text="Finish" CausesValidation="False" OnClick="Button2_Click" />
         <br />
         <br />
        <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
         </div>
         </asp:Content>