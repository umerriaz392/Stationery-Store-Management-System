<%@ Page Language="VB" AutoEventWireup="true" CodeFile="AddEmployee.aspx.vb" Inherits="AddEmployee" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Add Employee</title>
    <style>
        .form-container {
            width: 400px;
            margin: 50px auto;
            padding: 20px;
            border-radius: 8px;
            background-color: #f5f5f5;
            box-shadow: 0 2px 6px rgba(0,0,0,0.2);
        }
        .form-container h2 {
            text-align: center;
        }
        .form-group {
            margin-bottom: 12px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group input {
            width: 100%;
            padding: 6px;
        }
        .btn {
            display: block;
            margin: 10px auto;
            padding: 10px 20px;
            font-weight: bold;
            background-color: #4CAF50;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn:hover {
            background-color: #45a049;
        }
        .message {
            text-align: center;
            font-weight: bold;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="form-container">
            <h2>Add Employee</h2>
            <div class="form-group">
                <label>Employee ID</label>
                <asp:TextBox ID="txtEmployeeID" runat="server" TextMode="Number" />
            </div>
            <div class="form-group">
                <label>Name</label>
                <asp:TextBox ID="txtName" runat="server" />
            </div>
            <div class="form-group">
                <label>Phone</label>
                <asp:TextBox ID="txtPhone" runat="server" />
            </div>
            <div class="form-group">
                <label>Email</label>
                <asp:TextBox ID="txtEmail" runat="server" TextMode="Email" />
            </div>
            <div class="form-group">
                <label>Address</label>
                <asp:TextBox ID="txtAddress" runat="server" />
            </div>
            <div class="form-group">
                <label>City</label>
                <asp:TextBox ID="txtCity" runat="server" />
            </div>
            <div class="form-group">
                <label>Hire Date</label>
                <asp:TextBox ID="txtHireDate" runat="server" TextMode="Date" />
            </div>
            <div class="form-group">
                <label>Salary</label>
                <asp:TextBox ID="txtSalary" runat="server" TextMode="Number" />
            </div>
            <asp:Button ID="btnAdd" runat="server" Text="Add Employee" CssClass="btn" OnClick="btnAdd_Click" />
            <asp:Label ID="lblMessage" runat="server" CssClass="message" />
        </div>
    </form>
</body>
</html>
