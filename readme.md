# 🏬 Stationery Store Management System

A web-based management system developed in **ASP.NET Web Forms (VB.NET)** with **SQL Server** as the backend.  
This system is designed to manage stationery store operations, including inventory, customers, orders, suppliers, and role-based access control.

## 🚀 Features

### 👩‍💼 Admin
- Manage Users (Add, Edit, Delete)
- Assign Roles (Admin, Manager, Salesperson)
- View Login Audit Logs

### 🧾 Salesperson
- Register Customers
- Place and View Orders
- Generate Invoices

### 📦 Manager
- View Inventory Summary
- Check Low Stock Reports
- Access Supplier Information

## 🗄️ Database Design

The system includes the following main tables:
- **User_t** – stores login credentials and roles  
- **Employee** – stores employee details  
- **Customer** – manages customer data  
- **Order_T** and **Order_Item** – for order management  
- **Product**, **Category**, and **Supplier** – for product and inventory management  
- **Login_Audit** – logs user login and logout activities


## 🧰 Technologies Used

| Component | Technology |
|------------|-------------|
| Frontend | ASP.NET Web Forms (VB.NET) |
| Backend | Microsoft SQL Server |
| IDE | Visual Studio 2022 |
| Language | VB.NET |
| Database Access | ADO.NET |
| Hosting | somee.com |


## ⚙️ Installation

1. Clone this repository:
   git clone https://github.com/<your-username>/Stationery-Store-Management-System.git
Open the solution file in Visual Studio:

Copy code
StationeryStoreManagementSystem.sln
Update your connection string in Web.config:
<connectionStrings>
    <add name="myconnstr" connectionString="Data Source=YOUR_SERVER;Initial Catalog=YOUR_DB;Integrated Security=True" providerName="System.Data.SqlClient" />
</connectionStrings>
Run the SQL scripts in the Database folder to create required tables and sample data.

Press F5 or Run to start the project.
