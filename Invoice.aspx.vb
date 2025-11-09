Imports System.Data
Imports System.Data.SqlClient

Partial Class Invoice
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            Dim orderId As String = Request.QueryString("orderid")
            If Not String.IsNullOrEmpty(orderId) Then
                LoadInvoice(CInt(orderId))
            End If
        End If
    End Sub

    Private Sub LoadInvoice(orderId As Integer)
        Dim connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString
        Dim totalAmount As Decimal = 0

        Using conn As New SqlConnection(connStr)
            conn.Open()

            ' Load order items
            Dim itemQuery As String = "SELECT P.Product_Name, OI.Quantity, P.Unit_Price, (OI.Quantity * P.Unit_Price) AS Subtotal" &
                " FROM Order_Item OI" &
                " INNER JOIN Product P ON OI.Product_ID = P.Product_ID" &
                " WHERE OI.Order_ID = @orderId"
            Using cmd As New SqlCommand(itemQuery, conn)
                cmd.Parameters.AddWithValue("@orderId", orderId)
                Dim dt As New DataTable()
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    dt.Load(reader)
                    gvOrderItems.DataSource = dt
                    gvOrderItems.DataBind()
                    For Each row As DataRow In dt.Rows
                        totalAmount += Convert.ToDecimal(row("Subtotal"))
                    Next
                End Using
            End Using

            ' Load header and payment info
            Dim infoQuery As String = "SELECT O.Order_ID, O.Order_Date, C.Customer_Name, P.Amount_Paid, P.Payment_Date, P.Payment_Mode" &
                " FROM Order_T O" &
                " JOIN Customer C ON O.Customer_ID = C.Customer_ID" &
                " JOIN Payment P ON O.Order_ID = P.Order_ID" &
                " WHERE O.Order_ID = @orderId"
            Using cmd As New SqlCommand(infoQuery, conn)
                cmd.Parameters.AddWithValue("@orderId", orderId)
                Using reader As SqlDataReader = cmd.ExecuteReader()
                    If reader.Read() Then
                        lblTotalAmount.Text = "Total Amount: ₨" & totalAmount.ToString("N2")
                        lblPaymentInfo.Text = "<b>Payment:</b> ₨" & Convert.ToDecimal(reader("Amount_Paid")).ToString("N2") &
                      " via " & reader("Payment_Mode") &
                      " on " & CDate(reader("Payment_Date")).ToShortDateString()

                    End If
                End Using
            End Using
        End Using

        lblTotalAmount.Text = "Total Amount: ₨" & totalAmount.ToString("N2")
    End Sub
End Class
