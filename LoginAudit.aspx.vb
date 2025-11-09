Imports System.Data
Imports System.Data.SqlClient

Partial Class LoginAudit
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadAuditLogs()
        End If
    End Sub

    Private Sub LoadAuditLogs()
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim query As String = "SELECT A.Audit_ID, ISNULL(U.Username, 'Unknown') AS Username, " &
                      "A.Login_Time, A.Logout_Time, A.Status " &
                      "FROM Login_Audit A " &
                      "LEFT JOIN User_T U ON A.User_ID = U.User_ID " &
                      "ORDER BY A.Login_Time DESC"


        Using conn As New SqlConnection(connStr)
            Using cmd As New SqlCommand(query, conn)
                Dim dt As New DataTable()
                Using adapter As New SqlDataAdapter(cmd)
                    adapter.Fill(dt)
                End Using
                gvAuditLogs.DataSource = dt
                gvAuditLogs.DataBind()
            End Using
        End Using
    End Sub
End Class
