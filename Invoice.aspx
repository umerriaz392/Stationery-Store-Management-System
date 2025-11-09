<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Invoice.aspx.vb" Inherits="Invoice" %>

<!DOCTYPE html>
<html>
<head>
    <title>Invoice</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .invoice-box { border: 1px solid #ccc; padding: 20px; width: 800px; margin: auto; }
        h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        .total { font-weight: bold; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="invoice-box">
            <h2>Order Invoice</h2>
            <asp:Label ID="lblInvoiceHeader" runat="server" Font-Bold="True"></asp:Label>
            <asp:GridView ID="gvOrderItems" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField HeaderText="Product" DataField="Product_Name" />
                    <asp:BoundField HeaderText="Quantity" DataField="Quantity" />
                    <asp:BoundField HeaderText="Unit Price" DataField="Unit_Price" DataFormatString="₨{0:N2}" />
                    <asp:BoundField HeaderText="Subtotal" DataField="Subtotal" DataFormatString="₨{0:N2}" />

                </Columns>
            </asp:GridView>
            <asp:Label ID="lblTotalAmount" runat="server" Font-Bold="True" Font-Size="Large"></asp:Label>
            <br /><br />
            <asp:Label ID="lblPaymentInfo" runat="server" Font-Italic="True"></asp:Label>
        </div>
    </form>
</body>
</html>
