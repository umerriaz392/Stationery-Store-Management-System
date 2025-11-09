<%@ Page Language="VB" AutoEventWireup="false" CodeFile="LoginAudit.aspx.vb" Inherits="LoginAudit" %>

<!DOCTYPE html>
<html>
<head>
    <title>Audit Logs</title>
    <style>
        body { font-family: Arial; padding: 20px; }
        h2 { text-align: center; }
        table { width: 100%; border-collapse: collapse; margin-top: 20px; }
        th, td { border: 1px solid #ccc; padding: 10px; text-align: center; }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <h2>Login Audit Logs</h2>
        <asp:GridView ID="gvAuditLogs" runat="server" AutoGenerateColumns="False" GridLines="Both">
            <Columns>
                <asp:BoundField HeaderText="Audit ID" DataField="Audit_ID" />
                <asp:BoundField HeaderText="Username" DataField="Username" />
                <asp:BoundField HeaderText="Login Time" DataField="Login_Time" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                <asp:BoundField HeaderText="Logout Time" DataField="Logout_Time" DataFormatString="{0:dd-MMM-yyyy HH:mm}" />
                <asp:BoundField HeaderText="Status" DataField="Status" />
            </Columns>
        </asp:GridView>
    </form>
</body>
</html>
