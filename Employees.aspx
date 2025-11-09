<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Employees.aspx.vb" Inherits="Employees" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Employees</title>
    <style>
        body {
            font-family: Arial;
            background-color: #f0f2f5;
            padding: 20px;
        }

        .container {
            background-color: #fff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            margin-bottom: 20px;
        }

        .btn {
            background-color: #28a745;
            color: white;
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 4px;
            margin-bottom: 10px;
            display: inline-block;
        }

        .btn:hover {
            background-color: #218838;
        }

        .grid {
            width: 100%;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Employees</h2>
            <asp:Button ID="btnAddEmployee" runat="server" Text="Add New Employee" CssClass="btn" OnClick="btnAddEmployee_Click" />
            <asp:GridView ID="gvEmployees" runat="server" AutoGenerateColumns="False" CssClass="grid"
                DataKeyNames="Employee_ID" OnRowEditing="gvEmployees_RowEditing" OnRowCancelingEdit="gvEmployees_RowCancelingEdit"
                OnRowUpdating="gvEmployees_RowUpdating" OnRowDeleting="gvEmployees_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="Employee_ID" HeaderText="Employee ID" ReadOnly="True" />
                    <asp:BoundField DataField="Employee_Name" HeaderText="Employee Name" />
                    <asp:BoundField DataField="Phone" HeaderText="Phone" />
                    <asp:BoundField DataField="Email" HeaderText="Email" />
                    <asp:BoundField DataField="Address" HeaderText="Address" />
                    <asp:BoundField DataField="City" HeaderText="City" />
                    <asp:BoundField DataField="Hire_Date" HeaderText="Hire Date" DataFormatString="{0:yyyy-MM-dd}" />
                    <asp:BoundField DataField="Salary" HeaderText="Salary" DataFormatString="{0:C2}" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>

            <!-- Confirmation Panel -->
            <asp:Label ID="lblConfirmationMessage" runat="server" Text="" Visible="False" ForeColor="Red" />
            <asp:Panel ID="confirmDelete" runat="server" Visible="False">
                <p><strong>Are you sure you want to delete this employee?</strong></p>
                <asp:Button ID="btnConfirmDelete" runat="server" Text="Yes" OnClick="btnConfirmDelete_Click" CssClass="btn" />
                <asp:Button ID="btnCancelDelete" runat="server" Text="No" OnClick="btnCancelDelete_Click" CssClass="btn" />
            </asp:Panel>
        </div>
    </form>
</body>
</html>
