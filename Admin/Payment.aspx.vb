Partial Class Admin_Payment
    Inherits System.Web.UI.Page
    Dim dm As New datamanager
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        DropDownList1.DataBind()
        DropDownList1.Items.Insert(0, New ListItem("---SELECT---", 0))
        DropDownList2.DataBind()
        DropDownList2.Items.Insert(0, New ListItem("---SELECT---", 0))
        txtDate.Text = ""
        txtAmt.Text = ""
        txtBank.Text = ""
        Label1.Visible = False
        Label2.Visible = False
        txtChequeno.Text = ""
        txtChequeDate.Text = ""
        Button2.Text = "update"
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If RadioButtonList1.SelectedValue = "Cash" Then
            dm.setdata("Insert into Payment(Payment_date,Amount,Admission_id,[Mode of payment]) values('" + txtDate.Text + "'," + txtAmt.Text + "," + DropDownList2.SelectedValue + ",'Cash')")
        Else
            dm.setdata("Insert into Payment values('" + txtDate.Text + "'," + txtAmt.Text + "," + DropDownList2.SelectedValue + ",'Cheque','" + txtBank.Text + "'," + txtChequeno.Text + ",'" + txtChequeDate.Text + "')")
        End If
        GridView1.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim dt As Data.DataTable = dm.getdata("select * from payment where payment_id=" & GridView1.SelectedValue)
        txtDate.Text = dt.Rows(0).Item(1).ToString
        txtAmt.Text = dt.Rows(0).Item(2).ToString
        txtBank.Text = dt.Rows(0).Item(5).ToString
        txtChequeno.Text = dt.Rows(0).Item(6).ToString
        txtChequeDate.Text = dt.Rows(0).Item(7).ToString
        MultiView1.ActiveViewIndex = 1
        Button2.Text = "update"
    End Sub

    Protected Sub RadioButtonList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles RadioButtonList1.SelectedIndexChanged
        If (RadioButtonList1.SelectedValue = "Cheque") Then
            Panel1.Visible = True
        Else
            Panel1.Visible = False
        End If
    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList1.SelectedIndexChanged
        DropDownList2.DataBind()
        DropDownList2.Items.Insert(0, New ListItem("---SELECT---", 0))
    End Sub
    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        Dim amt As String = dm.getValue("Select fees from Admission_master where Admission_id=" + DropDownList2.SelectedValue)
        Dim dt As Data.DataTable = dm.getdata("Select Amount from Payment where Admission_id=" + DropDownList2.SelectedValue)
        Dim paidamt As Integer = 0
        For i = 0 To dt.Rows.Count - 1
            paidamt = paidamt + dt.Rows(i).Item(0).ToString
        Next
        Label1.Visible = True
        Label2.Visible = True
        Label2.Text = amt - paidamt
    End Sub
End Class
