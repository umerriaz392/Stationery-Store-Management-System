<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Search.aspx.vb" Inherits="Search" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>Search Products</title>
    <style>
        body {
            font-family: Arial;
            padding: 20px;
        }
        h2 {
            color: #333;
        }
        #results table {
            border-collapse: collapse;
            width: 50%;
        }
        #results th, #results td {
            border: 1px solid #ccc;
            padding: 8px;
            text-align: left;
        }
        #results th {
            background-color: #f2f2f2;
        }
    </style>
</head>

<body>
    <form id="form1" runat="server">
        <h2>Search Products</h2>

        <label for="txtSearch">Enter product name:   </label>
        <input type="text" id="txtSearch" runat="server" required /><br /><br />

        <button id="btnSearch" type="submit" runat="server" onserverclick="btnSearch_ServerClick">Search</button><br /><br />

        <div id="results" runat="server" style="font-family:Arial; font-size:14px;"></div>
    </form>
</body>
</html>
