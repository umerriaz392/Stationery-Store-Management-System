<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Customers.aspx.vb" Inherits="Customers" %>

<!DOCTYPE html>
<html>
<head runat="server">
    <title>Manage Customers</title>
    <style>
        body { font-family: Arial; margin: 40px; }
        h2 { text-align: center; }
        .section { border: 1px solid #ccc; padding: 20px; margin-bottom: 30px; }
        label { display: block; margin-top: 10px; }
        input[type="text"] { width: 100%; padding: 6px; }
        .button-row { margin-top: 10px; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 8px; text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="section">
            <h2>Search Customers</h2>
            <asp:TextBox ID="txtSearch" runat="server" placeholder="Enter name or phone..."></asp:TextBox>
            <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button-row" />
        </div>

        <div class="section">
            <h2>Existing Customers</h2>
            <asp:Label ID="lblStatus" runat="server" ForeColor="Red" Font-Bold="True"></asp:Label>
            <asp:GridView ID="gvCustomers" runat="server" AutoGenerateColumns="False" GridLines="Both">
                <Columns>
                    <asp:BoundField HeaderText="Customer ID" DataField="Customer_ID" />
                    <asp:BoundField HeaderText="Name" DataField="Customer_Name" />
                    <asp:BoundField HeaderText="Phone" DataField="Phone" />
                    <asp:BoundField HeaderText="Address" DataField="Address" />
                </Columns>
            </asp:GridView>
        </div>

        <div class="section">
            <h2>Register New Customer</h2>
            <label for="txtName">Name</label>
            <asp:TextBox ID="txtName" runat="server"></asp:TextBox>

            <label for="txtPhone">Phone</label>
            <asp:TextBox ID="txtPhone" runat="server"></asp:TextBox>

            <label for="txtAddress">Address</label>
            <asp:TextBox ID="txtAddress" runat="server" TextMode="MultiLine" Rows="3"></asp:TextBox>

            <asp:Button ID="btnAddCustomer" runat="server" Text="Add Customer" CssClass="button-row" />
            <br /><br />
            <asp:Label ID="lblMessage" runat="server" ForeColor="Green"></asp:Label>
        </div>
    </form>
</body>
</html>
