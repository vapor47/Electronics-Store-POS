<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="addCustomer.aspx.cs" Inherits="electronicspos.com.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            Customer Entree Form<br />
            <br />
            <br />
            First Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Fname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="fnameRequired" runat="server" ControlToValidate="Fname" ErrorMessage="First Name is Required"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="fnameAlpha" runat="server" ControlToValidate="Fname" ErrorMessage="Enter a Valid Name" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            Last Name:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="Lname" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="lnameRequired" runat="server" ControlToValidate="Lname" ErrorMessage="Last Name is Required"></asp:RequiredFieldValidator>
            &nbsp;&nbsp;
            <asp:RegularExpressionValidator ID="lnameAlpha" runat="server" ControlToValidate="Lname" ErrorMessage="Last Name is Required" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            <br />
            Email:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="email" runat="server"></asp:TextBox>
            <asp:RequiredFieldValidator ID="emailRequired" runat="server" ControlToValidate="email" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
            <br />
            Phone Number:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="phone" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="phoneNum" runat="server" ControlToValidate="phone" ErrorMessage="Enter a Valid Phone Number" ValidationExpression="^[0-9]{10}$"></asp:RegularExpressionValidator>
            <br />
            <br />
            Street Address:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="street" runat="server"></asp:TextBox>
            <br />
            City:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="city" runat="server" style="margin-top: 0px"></asp:TextBox>
            <asp:RegularExpressionValidator ID="cityAlpha" runat="server" ControlToValidate="city" ErrorMessage="Enter a Valid City Name" ValidationExpression="^[a-zA-Z'.\s]{1,40}$"></asp:RegularExpressionValidator>
            <br />
            State:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <asp:DropDownList ID="state" runat="server">
                 <asp:ListItem Value="-1">Select State</asp:ListItem>
                 <asp:ListItem Value="AL">AL</asp:ListItem>
            <asp:ListItem Value="AK">AK</asp:ListItem>
            <asp:ListItem Value="AZ">AZ</asp:ListItem>
            <asp:ListItem Value="AR">AR</asp:ListItem>
            <asp:ListItem Value="CA">CA</asp:ListItem>
            <asp:ListItem Value="CO">CO</asp:ListItem>
            <asp:ListItem Value="CT">CT</asp:ListItem>
            <asp:ListItem Value="DE">DE</asp:ListItem>
            <asp:ListItem Value="FL">FL</asp:ListItem>
            <asp:ListItem Value="GA">GA</asp:ListItem>
            <asp:ListItem Value="HI">HI</asp:ListItem>
            <asp:ListItem Value="ID">ID</asp:ListItem>
            <asp:ListItem Value="IL">IL</asp:ListItem>
            <asp:ListItem Value="IN">IN</asp:ListItem>
            <asp:ListItem Value="IA">IA</asp:ListItem>
            <asp:ListItem Value="KS">KS</asp:ListItem>
            <asp:ListItem Value="KT">KT</asp:ListItem>
            <asp:ListItem Value="LA">LA</asp:ListItem>
            <asp:ListItem Value="ME">ME</asp:ListItem>
            <asp:ListItem Value="MD">MD</asp:ListItem>
            <asp:ListItem Value="MA">MA</asp:ListItem>
            <asp:ListItem Value="MI">MI</asp:ListItem>
            <asp:ListItem Value="MN">MN</asp:ListItem>
            <asp:ListItem Value="MS">MS</asp:ListItem>
            <asp:ListItem Value="MO">MO</asp:ListItem>
            <asp:ListItem Value="MT">MT</asp:ListItem>
            <asp:ListItem Value="NE">NE</asp:ListItem>
            <asp:ListItem Value="NV">NV</asp:ListItem>
            <asp:ListItem Value="NH">NH</asp:ListItem>
            <asp:ListItem Value="NJ">NJ</asp:ListItem>
            <asp:ListItem Value="NM">NM</asp:ListItem>
            <asp:ListItem Value="NY">NY</asp:ListItem>
            <asp:ListItem Value="NC">NC</asp:ListItem>
            <asp:ListItem Value="ND">ND</asp:ListItem>
            <asp:ListItem Value="OH">OH</asp:ListItem>
            <asp:ListItem Value="OK">OK</asp:ListItem>
            <asp:ListItem Value="OR">OR</asp:ListItem>
            <asp:ListItem Value="PA">PA</asp:ListItem>
            <asp:ListItem Value="RI">RI</asp:ListItem>
            <asp:ListItem Value="SC">SC</asp:ListItem>
            <asp:ListItem Value="SD">SD</asp:ListItem>
            <asp:ListItem Value="TN">TN</asp:ListItem>
            <asp:ListItem Value="TX">TX</asp:ListItem>
            <asp:ListItem Value="UT">UT</asp:ListItem>
            <asp:ListItem Value="VT">VT</asp:ListItem>
            <asp:ListItem Value="VA">VA</asp:ListItem>
            <asp:ListItem Value="WA">WA</asp:ListItem>
            <asp:ListItem Value="WV">WV</asp:ListItem>
            <asp:ListItem Value="WI">WI</asp:ListItem>
            <asp:ListItem Value="WY">WY</asp:ListItem>
            </asp:DropDownList>
            <br />
            Zip Code:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="zip" runat="server"></asp:TextBox>
            <asp:RegularExpressionValidator ID="zipNum" runat="server" ControlToValidate="zip" ErrorMessage="Enter a Valid Zip Code" ValidationExpression="^[0-9]{5}$"></asp:RegularExpressionValidator>
            <br />
            <br />
        </div>
        <asp:Button ID="submitCustomer" runat="server" Text="Add Customer" OnClick="submitCustomer_Click" />
    </form>
</body>
</html>
