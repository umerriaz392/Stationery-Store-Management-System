Imports System.Data
Imports System.Data.SqlClient

Partial Class PlaceOrder
    Inherits System.Web.UI.Page

    Private connStr As String = ConfigurationManager.ConnectionStrings("myconnstr").ConnectionString

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load
        If Not IsPostBack Then
            LoadCustomers()
            LoadProducts()
            InitializeCart()
        End If
    End Sub

    Private Sub LoadCustomers()
        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("SELECT Customer_ID, Customer_Name FROM Customer", conn)
            conn.Open()
            ddlCustomer.DataSource = cmd.ExecuteReader()
            ddlCustomer.DataTextField = "Customer_Name"
            ddlCustomer.DataValueField = "Customer_ID"
            ddlCustomer.DataBind()
        End Using
    End Sub

    Private Sub LoadProducts()
        Using conn As New SqlConnection(connStr)
            Dim cmd As New SqlCommand("SELECT Product_ID, Product_Name FROM Product", conn)
            conn.Open()
            ddlProduct.DataSource = cmd.ExecuteReader()
            ddlProduct.DataTextField = "Product_Name"
            ddlProduct.DataValueField = "Product_ID"
            ddlProduct.DataBind()
        End Using
    End Sub

    Private Sub InitializeCart()
        Dim dt As New DataTable()
        dt.Columns.Add("ProductID", GetType(Integer))
        dt.Columns.Add("ProductName", GetType(String))
        dt.Columns.Add("Quantity", GetType(Integer))
        ViewState("Cart") = dt
    End Sub

    Protected Sub btnAddToCart_Click(sender As Object, e As EventArgs)
        Dim cart As DataTable = CType(ViewState("Cart"), DataTable)
        Dim productId As Integer = Convert.ToInt32(ddlProduct.SelectedValue)
        Dim quantity As Integer

        If Not Integer.TryParse(txtQuantity.Text.Trim(), quantity) OrElse quantity <= 0 Then
            lblMessage.Text = "Enter a valid quantity."
            Return
        End If

        Dim productName As String = ddlProduct.SelectedItem.Text
        cart.Rows.Add(productId, productName, quantity)
        ViewState("Cart") = cart

        gvCart.DataSource = cart
        gvCart.DataBind()
    End Sub

    Protected Sub btnConfirmOrder_Click(sender As Object, e As EventArgs)
        Dim cart As DataTable = CType(ViewState("Cart"), DataTable)
        If cart.Rows.Count = 0 Then
            lblMessage.Text = "Cart is empty."
            Return
        End If

        Dim customerId As Integer = Convert.ToInt32(ddlCustomer.SelectedValue)
        Dim paymentMode As String = ddlPaymentMode.SelectedValue
        Dim orderDate As Date = Date.Today
        Dim totalAmount As Decimal = 0D

        Using conn As New SqlConnection(connStr)
            conn.Open()
            Dim trans As SqlTransaction = conn.BeginTransaction()

            Try
                'Insert the Order
                Dim sqlInsertOrder As String = "DECLARE @InsertedOrders TABLE (Order_ID INT); " &
                "INSERT INTO Order_T (Customer_ID, Order_Date) " &
                "OUTPUT INSERTED.Order_ID INTO @InsertedOrders " &
                "VALUES (@cust, @date); " &
                "SELECT Order_ID FROM @InsertedOrders;"

                Dim orderCmd As New SqlCommand(sqlInsertOrder, conn, trans)
                orderCmd.Parameters.AddWithValue("@cust", customerId)
                orderCmd.Parameters.AddWithValue("@date", orderDate)

                Dim result As Object = orderCmd.ExecuteScalar()
                Dim orderId As Integer

                If result IsNot Nothing AndAlso Not Convert.IsDBNull(result) Then
                    orderId = Convert.ToInt32(result)
                Else
                    trans.Rollback()
                    lblMessage.Text = "Failed to retrieve Order ID. Please try again."
                    Exit Sub
                End If


                ' Insert Order Items
                For Each row As DataRow In cart.Rows
                    Dim productId As Integer = Convert.ToInt32(row("ProductID"))
                    Dim quantity As Integer = Convert.ToInt32(row("Quantity"))

                    ' Insert into Order_Item
                    Dim itemCmd As New SqlCommand("INSERT INTO Order_Item (Order_ID, Product_ID, Quantity) VALUES (@oid, @pid, @qty)", conn, trans)
                    itemCmd.Parameters.AddWithValue("@oid", orderId)
                    itemCmd.Parameters.AddWithValue("@pid", productId)
                    itemCmd.Parameters.AddWithValue("@qty", quantity)
                    itemCmd.ExecuteNonQuery()

                    ' Get unit price and calculate amount
                    Dim priceCmd As New SqlCommand("SELECT Unit_Price FROM Product WHERE Product_ID = @pid", conn, trans)
                    priceCmd.Parameters.AddWithValue("@pid", productId)
                    totalAmount += Convert.ToDecimal(priceCmd.ExecuteScalar()) * quantity
                Next

                ' Insert Payment
                Dim payCmd As New SqlCommand("INSERT INTO Payment (Order_ID, Amount_Paid, Payment_Date, Payment_Mode) VALUES (@oid, @amount, @pdate, @pmode)", conn, trans)
                payCmd.Parameters.AddWithValue("@oid", orderId)
                payCmd.Parameters.AddWithValue("@amount", totalAmount)
                payCmd.Parameters.AddWithValue("@pdate", Date.Today)
                payCmd.Parameters.AddWithValue("@pmode", paymentMode)
                payCmd.ExecuteNonQuery()

                trans.Commit()

                lblMessage.Text = "Order placed successfully. Total: Rs " & totalAmount.ToString("F2")
                ViewState("Cart") = Nothing
                InitializeCart()
                gvCart.DataSource = Nothing
                gvCart.DataBind()
                txtQuantity.Text = ""
                Response.Redirect("Invoice.aspx?orderid=" & orderId)
            Catch ex As Exception
                Try
                    trans.Rollback()
                Catch rollex As Exception

                End Try
                lblMessage.Text = "Error: " & ex.Message

            End Try

        End Using
    End Sub


End Class
