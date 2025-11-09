<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LowStockReport.aspx.vb" Inherits="LowStockReport" %>

<!DOCTYPE html>
<html>
<head>
    <title>Low Stock Report</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .container { max-width: 1000px; margin: auto; }
        h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        .note { color: red; text-align: center; margin-top: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Low Stock Report</h2>
            <asp:GridView ID="gvLowStock" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField HeaderText="Product ID" DataField="Product_ID" />
                    <asp:BoundField HeaderText="Product Name" DataField="Product_Name" />
                    <asp:BoundField HeaderText="Stock Quantity" DataField="Stock_Quantity" />
                    <asp:BoundField HeaderText="Supplier" DataField="Supplier_Name" />
                </Columns>
            </asp:GridView>
            <asp:Label ID="lblNote" runat="server" CssClass="note" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
