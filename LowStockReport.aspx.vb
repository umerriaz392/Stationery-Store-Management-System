Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Data

Partial Class LowStockReport
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadLowStockProducts()
        End If
    End Sub

    Private Sub LoadLowStockProducts()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim threshold As Integer = 10
        Dim query As String = "SELECT P.Product_ID, P.Product_Name, P.Stock_Quantity, " &
                              "ISNULL(S.Supplier_Name, 'Unknown') AS Supplier_Name " &
                              "FROM Product P " &
                              "LEFT JOIN Supplier S ON P.Supplier_ID = S.Supplier_ID " &
                              "WHERE P.Stock_Quantity < @threshold"

        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@threshold", threshold)

                Dim dt As New DataTable()
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using

                gvLowStock.DataSource = dt
                gvLowStock.DataBind()

                lblNote.Visible = (dt.Rows.Count = 0)
                If dt.Rows.Count = 0 Then
                    lblNote.Text = "All products have sufficient stock."
                End If
            End Using
        End Using
    End Sub
End Class
