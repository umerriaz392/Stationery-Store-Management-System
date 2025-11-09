Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class InventorySummary
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadInventory()
        End If
    End Sub

    Private Sub LoadInventory()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim query As String = "SELECT P.Product_ID, P.Product_Name, P.Unit_Price, P.Stock_Quantity, " &
                              "ISNULL(S.Supplier_Name, 'Unknown') AS Supplier_Name " &
                              "FROM Product P " &
                              "LEFT JOIN Supplier S ON P.Supplier_ID = S.Supplier_ID"

        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand(query, conn)
                Dim dt As New DataTable()
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using
                gvInventory.DataSource = dt
                gvInventory.DataBind()
            End Using
        End Using
    End Sub
End Class
