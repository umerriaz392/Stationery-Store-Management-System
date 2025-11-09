<%@ Page Language="VB" AutoEventWireup="true" CodeFile="Dashboard.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Dashboard - Stationery Store</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            background-color: #f9f9f9;
        }

        .top-bar {
            background-color: #007bff;
            padding: 10px 20px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .logout-link {
            color: white;
            text-decoration: none;
            font-size: 14px;
        }

        .container {
            padding: 30px;
        }

        .card {
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            margin-bottom: 20px;
        }

        .card h3 {
            margin-top: 0;
        }

        .card a {
            display: inline-block;
            margin-top: 10px;
            padding: 8px 12px;
            background-color: #007bff;
            color: white;
            border-radius: 5px;
            text-decoration: none;
        }

        .card a:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="top-bar">
            <span>Welcome to the Stationery Store Dashboard</span>
            <a class="logout-link" href="Logout.aspx">Logout</a>
        </div>

        <div class="container">
            <asp:Literal ID="litCards" runat="server"></asp:Literal>
        </div>
    </form>
</body>
</html>
