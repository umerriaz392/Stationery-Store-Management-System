Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Suppliers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadSuppliers()
        End If
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        LoadSuppliers(txtSearch.Text.Trim())
    End Sub

    Private Sub LoadSuppliers(Optional keyword As String = "")
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim query As String = "SELECT Supplier_ID, Supplier_Name, Phone, Email, City, State, Postal_Code FROM Supplier"

        If Not String.IsNullOrEmpty(keyword) Then
            query &= " WHERE Supplier_Name LIKE @kw OR City LIKE @kw OR State LIKE @kw"
        End If

        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand(query, conn)
                If Not String.IsNullOrEmpty(keyword) Then
                    cmd.Parameters.AddWithValue("@kw", "%" & keyword & "%")
                End If

                Dim dt As New DataTable()
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using

                gvSuppliers.DataSource = dt
                gvSuppliers.DataBind()

                lblNote.Visible = (dt.Rows.Count = 0)
                If dt.Rows.Count = 0 Then
                    lblNote.Text = "No suppliers found matching the search criteria."
                End If
            End Using
        End Using
    End Sub
End Class
