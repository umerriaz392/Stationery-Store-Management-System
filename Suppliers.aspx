<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Suppliers.aspx.vb" Inherits="Suppliers" %>

<!DOCTYPE html>
<html>
<head>
    <title>Suppliers</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        .container { max-width: 1000px; margin: auto; }
        h2 { text-align: center; }
        .search-box { text-align: center; margin-bottom: 20px; }
        .search-box input { padding: 5px; width: 300px; }
        .search-box button { padding: 5px 15px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
        .note { color: red; text-align: center; margin-top: 15px; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Suppliers List</h2>

            <div class="search-box">
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search by name, city or state..."></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" />
            </div>

            <asp:GridView ID="gvSuppliers" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField HeaderText="Supplier ID" DataField="Supplier_ID" />
                    <asp:BoundField HeaderText="Name" DataField="Supplier_Name" />
                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                    <asp:BoundField HeaderText="Email" DataField="Email" />
                    <asp:BoundField HeaderText="City" DataField="City" />
                    <asp:BoundField HeaderText="State" DataField="State" />
                    <asp:BoundField HeaderText="Postal Code" DataField="Postal_Code" />
                </Columns>
            </asp:GridView>

            <asp:Label ID="lblNote" runat="server" CssClass="note" Visible="False"></asp:Label>
        </div>
    </form>
</body>
</html>
