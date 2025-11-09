Imports System.Data.SqlClient
Imports System.Data

Partial Class Customers
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
    End Sub

    Protected Sub btnSearch_Click(sender As Object, e As EventArgs) Handles btnSearch.Click
        LoadCustomers(txtSearch.Text.Trim())
    End Sub

    Private Sub LoadCustomers(Optional keyword As String = "")
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim query As String = "SELECT Customer_ID, Customer_Name, Phone, Address FROM Customer"
        Dim dt As New DataTable()

        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand()
                cmd.Connection = conn

                If Not String.IsNullOrWhiteSpace(keyword) Then
                    query &= " WHERE Customer_Name LIKE @kw OR Phone LIKE @kw"
                    cmd.CommandText = query
                    cmd.Parameters.AddWithValue("@kw", "%" & keyword & "%")
                Else
                    ' If no keyword, do nothing (return empty table)
                    gvCustomers.DataSource = Nothing
                    gvCustomers.DataBind()
                    lblStatus.Text = ""
                    Return
                End If

                cmd.CommandText = query
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using
            End Using
        End Using

        gvCustomers.DataSource = dt
        gvCustomers.DataBind()

        ' Show message if no records found
        If dt.Rows.Count = 0 Then
            lblStatus.Text = "No customers found."
        Else
            lblStatus.Text = ""
        End If
    End Sub


    Protected Sub btnAddCustomer_Click(sender As Object, e As EventArgs) Handles btnAddCustomer.Click
        Dim name As String = txtName.Text.Trim()
        Dim phone As String = txtPhone.Text.Trim()
        Dim address As String = txtAddress.Text.Trim()

        If name = "" Then
            lblMessage.ForeColor = Drawing.Color.Red
            lblMessage.Text = "Name is required."
            Return
        End If

        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim query As String = "INSERT INTO Customer (Customer_Name, Phone, Address) VALUES (@name, @phone, @address)"

        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand(query, conn)
                cmd.Parameters.AddWithValue("@name", name)
                cmd.Parameters.AddWithValue("@phone", phone)
                cmd.Parameters.AddWithValue("@address", address)

                conn.Open()
                cmd.ExecuteNonQuery()
            End Using
        End Using

        lblMessage.ForeColor = Drawing.Color.Green
        lblMessage.Text = "Customer added successfully."

        ' Clear fields
        txtName.Text = ""
        txtPhone.Text = ""
        txtAddress.Text = ""

        LoadCustomers()
    End Sub
End Class
