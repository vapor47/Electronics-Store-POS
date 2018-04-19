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
                 <asp:ListItem Value="Alabama">AL</asp:ListItem>
            <asp:ListItem Value="Alaska">AK</asp:ListItem>
            <asp:ListItem Value="Arizona">AZ</asp:ListItem>
            <asp:ListItem Value="Arkansas">AR</asp:ListItem>
            <asp:ListItem Value="California">CA</asp:ListItem>
            <asp:ListItem Value="Colorado">CO</asp:ListItem>
            <asp:ListItem Value="Connecticut">CT</asp:ListItem>
            <asp:ListItem Value="Delaware">DE</asp:ListItem>
            <asp:ListItem Value="Florida">FL</asp:ListItem>
            <asp:ListItem Value="Georgia">GA</asp:ListItem>
            <asp:ListItem Value="Hawaii">HI</asp:ListItem>
            <asp:ListItem Value="Idaho">ID</asp:ListItem>
            <asp:ListItem Value="Illinois">IL</asp:ListItem>
            <asp:ListItem Value="Indiana">IN</asp:ListItem>
            <asp:ListItem Value="Iowa">IA</asp:ListItem>
            <asp:ListItem Value="Kansas">KS</asp:ListItem>
            <asp:ListItem Value="Kentucky">KT</asp:ListItem>
            <asp:ListItem Value="Loisiana">LA</asp:ListItem>
            <asp:ListItem Value="Maine">ME</asp:ListItem>
            <asp:ListItem Value="Maryland">MD</asp:ListItem>
            <asp:ListItem Value="Massachusetts">MA</asp:ListItem>
            <asp:ListItem Value="Michigan">MI</asp:ListItem>
            <asp:ListItem Value="Minnesota">MN</asp:ListItem>
            <asp:ListItem Value="Mississippi">MS</asp:ListItem>
            <asp:ListItem Value="Missouri">MO</asp:ListItem>
            <asp:ListItem Value="Montana">MT</asp:ListItem>
            <asp:ListItem Value="Nebraska">NE</asp:ListItem>
            <asp:ListItem Value="Nevada">NV</asp:ListItem>
            <asp:ListItem Value="New Hampshire">NH</asp:ListItem>
            <asp:ListItem Value="New Jersey">NJ</asp:ListItem>
            <asp:ListItem Value="New Mexico">NM</asp:ListItem>
            <asp:ListItem Value="New York">NY</asp:ListItem>
            <asp:ListItem Value="North Carolina">NC</asp:ListItem>
            <asp:ListItem Value="North Dakota">ND</asp:ListItem>
            <asp:ListItem Value="Ohio">OH</asp:ListItem>
            <asp:ListItem Value="Oklahoma">OK</asp:ListItem>
            <asp:ListItem Value="Oregon">OR</asp:ListItem>
            <asp:ListItem Value="Pennslyvania">PA</asp:ListItem>
            <asp:ListItem Value="Rhode Island">RI</asp:ListItem>
            <asp:ListItem Value="South Carolina">SC</asp:ListItem>
            <asp:ListItem Value="Sorth Dakota">SD</asp:ListItem>
            <asp:ListItem Value="Tennessee">TN</asp:ListItem>
            <asp:ListItem Value="Texas">TX</asp:ListItem>
            <asp:ListItem Value="Utah">UT</asp:ListItem>
            <asp:ListItem Value="Vermont">VT</asp:ListItem>
            <asp:ListItem Value="Virginia">VA</asp:ListItem>
            <asp:ListItem Value="Washington">WA</asp:ListItem>
            <asp:ListItem Value="West Virginia">WV</asp:ListItem>
            <asp:ListItem Value="Wisconsin">WI</asp:ListItem>
            <asp:ListItem Value="Wyoming">WY</asp:ListItem>
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
