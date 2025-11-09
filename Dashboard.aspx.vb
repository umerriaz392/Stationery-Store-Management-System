Partial Class _Default
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            If Session("UserID") Is Nothing OrElse Session("RoleID") Is Nothing Then
                Response.Redirect("Login.aspx")
            Else
                Dim roleId As Integer = Convert.ToInt32(Session("RoleID"))
                litCards.Text = GetDashboardCards(roleId)
            End If
        End If
    End Sub

    Private Function GetDashboardCards(roleId As Integer) As String
        Select Case roleId
            Case 1 ' Admin
                Return AdminCards()
            Case 2 ' Manager
                Return ManagerCards()
            Case 3 ' Salesperson
                Return SalespersonCards()
            Case Else
                Return "<div class='card'><h3>Unauthorized Role</h3></div>"
        End Select
    End Function

    Private Function AdminCards() As String
        Return "<div class='card'><h3>Manage Users</h3><a href='Users.aspx'>Go</a></div>" &
           "<div class='card'><h3>Manage Employees</h3><a href='Employees.aspx'>Go</a></div>" &
           "<div class='card'><h3>Audit Logs</h3><a href='LoginAudit.aspx'>Go</a></div>"
    End Function

    Private Function ManagerCards() As String
        Return "<div class='card'><h3>Inventory Summary</h3><a href='InventorySummary.aspx'>View</a></div>" &
           "<div class='card'><h3>Low Stock Report</h3><a href='LowStockReport.aspx'>Check</a></div>" &
           "<div class='card'><h3>Supplier Info</h3><a href='Suppliers.aspx'>Go</a></div>"
    End Function

    Private Function SalespersonCards() As String
        Return "<div class='card'><h3>Place Orders</h3><a href='PlaceOrder.aspx'>Go</a></div>" &
           "<div class='card'><h3>Add Products</h3><a href='AddProduct.aspx'>Go</a></div>" &
           "<div class='card'><h3>Customer Details</h3><a href='Customers.aspx'>View</a></div>" &
           "<div class='card'><h3>Search Products</h3><a href='Search.aspx'>Search</a></div>"
    End Function
End Class