<%@ Page Language="VB" AutoEventWireup="true" CodeFile="AddProduct.aspx.vb" Inherits="AddProduct" %>

<!DOCTYPE html>
<html>
<head>
    <title>Add Product</title>
    <style>
        .form-group {
            margin-bottom: 12px;
        }
        .form-control {
            width: 300px;
            padding: 6px;
            font-size: 14px;
        }
        .btn {
            padding: 6px 12px;
            font-size: 14px;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
        }
        .success {
            color: green;
        }
        .error {
            color: red;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-group">
            <label>Product ID:</label><br />
            <asp:TextBox ID="txtProductID" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Product Name:</label><br />
            <asp:TextBox ID="txtProductName" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Price:</label><br />
            <asp:TextBox ID="txtPrice" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Stock Quantity:</label><br />
            <asp:TextBox ID="txtStock" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Category:</label><br />
            <asp:DropDownList ID="ddlCategory" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <label>Supplier:</label><br />
            <asp:DropDownList ID="ddlSupplier" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Button ID="btnAdd" runat="server" Text="Add Product" CssClass="btn" OnClick="btnAdd_Click" />
        </div>
        <asp:Label ID="lblMessage" runat="server" />
    </form>
</body>
</html>
