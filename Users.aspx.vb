Imports System.Data
Imports System.Data.SqlClient
Imports System.Configuration

Partial Class Users
    Inherits System.Web.UI.Page

    Private connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Session("UserID") Is Nothing Then
            Response.Redirect("Login.aspx")
        ElseIf Session("RoleID") <> 1 Then
            Response.Redirect("Logout.aspx")
        End If

        If Not IsPostBack Then
            LoadUsers()
        End If
    End Sub

    Private Sub LoadUsers()
        Using conn As New SqlConnection(connStr)
            Dim query As String = "SELECT U.User_ID, U.Username, R.Role_Name AS RoleName," &
                                  "E.Employee_Name AS EmployeeName " &
                                  "FROM User_t U " &
                                  "JOIN Role_t R ON U.Role_ID = R.Role_ID " &
                                  "JOIN Employee E ON U.Employee_ID = E.Employee_ID"
            Dim cmd As New SqlCommand(query, conn)
            Dim adapter As New SqlDataAdapter(cmd)
            Dim dt As New DataTable()
            adapter.Fill(dt)
            gvUsers.DataSource = dt
            gvUsers.DataBind()
        End Using
    End Sub

    Protected Sub btnAddUser_Click(sender As Object, e As EventArgs)
        Response.Redirect("AddUser.aspx")
    End Sub

    Protected Sub gvUsers_RowEditing(sender As Object, e As GridViewEditEventArgs)
        gvUsers.EditIndex = e.NewEditIndex
        LoadUsers()
    End Sub

    Protected Sub gvUsers_RowCancelingEdit(sender As Object, e As GridViewCancelEditEventArgs)
        gvUsers.EditIndex = -1
        LoadUsers()
    End Sub

    Protected Sub gvUsers_RowUpdating(sender As Object, e As GridViewUpdateEventArgs)
        Dim userId As Integer = Convert.ToInt32(gvUsers.DataKeys(e.RowIndex).Value)
        Dim row As GridViewRow = gvUsers.Rows(e.RowIndex)
        Dim username As String = CType(row.Cells(1).Controls(0), TextBox).Text.Trim()

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("UPDATE User_t SET Username = @username WHERE User_ID = @userId", conn)
            cmd.Parameters.AddWithValue("@username", username)
            cmd.Parameters.AddWithValue("@userId", userId)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using

        gvUsers.EditIndex = -1
        LoadUsers()
    End Sub

    Protected Sub gvUsers_RowDeleting(sender As Object, e As GridViewDeleteEventArgs)
        Dim userId As Integer = Convert.ToInt32(gvUsers.DataKeys(e.RowIndex).Value)

        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("DELETE FROM User_t WHERE User_ID = @userId", conn)
            cmd.Parameters.AddWithValue("@userId", userId)
            conn.Open()
            cmd.ExecuteNonQuery()
        End Using

        LoadUsers()
    End Sub
End Class
