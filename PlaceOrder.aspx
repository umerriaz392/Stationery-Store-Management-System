<%@ Page Language="vb" AutoEventWireup="false" CodeFile="PlaceOrder.aspx.vb" Inherits="PlaceOrder" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Place Order</title>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Place Order</h2>

        <asp:Label ID="lblCustomer" runat="server" Text="Select Customer: "></asp:Label>
        <asp:DropDownList ID="ddlCustomer" runat="server"></asp:DropDownList>
        <br /><br />

        <asp:Label ID="lblProduct" runat="server" Text="Select Product: "></asp:Label>
        <asp:DropDownList ID="ddlProduct" runat="server"></asp:DropDownList>

        <asp:Label ID="lblQuantity" runat="server" Text=" Quantity: "></asp:Label>
        <asp:TextBox ID="txtQuantity" runat="server"></asp:TextBox>
        <asp:Button ID="btnAddToCart" runat="server" Text="Add to Cart" OnClick="btnAddToCart_Click" />
        <br /><br />

        <asp:GridView ID="gvCart" runat="server" AutoGenerateColumns="False">
            <Columns>
                <asp:BoundField DataField="ProductID" HeaderText="Product ID" />
                <asp:BoundField DataField="ProductName" HeaderText="Product Name" />
                <asp:BoundField DataField="Quantity" HeaderText="Quantity" />
            </Columns>
        </asp:GridView>
        <br />

        <asp:Label ID="lblPaymentMode" runat="server" Text="Payment Mode: "></asp:Label>
        <asp:DropDownList ID="ddlPaymentMode" runat="server">
            <asp:ListItem Text="Cash" />
            <asp:ListItem Text="Credit Card" />
            <asp:ListItem Text="Online Transfer" />
        </asp:DropDownList>
        <br /><br />

        <asp:Button ID="btnConfirmOrder" runat="server" Text="Confirm Order" OnClick="btnConfirmOrder_Click" />
        <br /><br />

        <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
    </form>
</body>
</html>
