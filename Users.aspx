<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Users.aspx.vb" Inherits="Users" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Manage Users</title>
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
            margin: 2px;
            display: inline-block;
            border: none;
            cursor: pointer;
        }

        .btn:hover {
            background-color: #218838;
        }

        .grid {
            width: 100%;
            border-collapse: collapse;
        }

        .grid th, .grid td {
            padding: 10px;
            border-bottom: 1px solid #ddd;
        }

        .grid th {
            background-color: #f8f9fa;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="container">
            <h2>Manage Users</h2>
            <asp:Button ID="btnAddUser" runat="server" Text="Add New User" CssClass="btn" OnClick="btnAddUser_Click" />
            <br /><br />
            <asp:GridView ID="gvUsers" runat="server" AutoGenerateColumns="False" CssClass="grid"
                DataKeyNames="User_ID" OnRowEditing="gvUsers_RowEditing"
                OnRowCancelingEdit="gvUsers_RowCancelingEdit" OnRowUpdating="gvUsers_RowUpdating"
                OnRowDeleting="gvUsers_RowDeleting">
                <Columns>
                    <asp:BoundField DataField="User_ID" HeaderText="User ID" ReadOnly="True" />
                    <asp:BoundField DataField="Username" HeaderText="Username" />
                    <asp:BoundField DataField="RoleName" HeaderText="Role" />
                    <asp:BoundField DataField="EmployeeName" HeaderText="Employee" />
                    
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="lnkEdit" runat="server" CommandName="Edit" CssClass="btn">Edit</asp:LinkButton>
                            <asp:LinkButton ID="lnkDelete" runat="server" CommandName="Delete" CssClass="btn"
                                OnClientClick="return confirm('Are you sure you want to delete this user?');">Delete</asp:LinkButton>
                        </ItemTemplate>
                        <EditItemTemplate>
                            <asp:LinkButton ID="lnkUpdate" runat="server" CommandName="Update" CssClass="btn">Update</asp:LinkButton>
                            <asp:LinkButton ID="lnkCancel" runat="server" CommandName="Cancel" CssClass="btn">Cancel</asp:LinkButton>
                        </EditItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
