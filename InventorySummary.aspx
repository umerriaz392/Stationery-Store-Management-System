<%@ Page Language="VB" AutoEventWireup="false" CodeFile="InventorySummary.aspx.vb" Inherits="InventorySummary" %>

<!DOCTYPE html>
<html>
<head>
    <title>Inventory Summary</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .container { max-width: 1000px; margin: auto; }
        h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Inventory Summary</h2>
            <asp:GridView ID="gvInventory" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField HeaderText="Product ID" DataField="Product_ID" />
                    <asp:BoundField HeaderText="Product Name" DataField="Product_Name" />
                    <asp:BoundField HeaderText="Unit Price (Rs.)" DataField="Unit_Price" DataFormatString="{0:N2}" />
                    <asp:BoundField HeaderText="Stock Quantity" DataField="Stock_Quantity" />
                    <asp:BoundField HeaderText="Supplier" DataField="Supplier_Name" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
