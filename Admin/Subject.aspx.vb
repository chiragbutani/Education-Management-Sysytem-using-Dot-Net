
Partial Class Admin_Subject
    Inherits System.Web.UI.Page
    Dim dm As New datasubject

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        TextBox1.Text = ""
        DropDownList1.DataBind()
        button2.Text = "Insert"
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles button2.Click
        If button2.Text = "Update" Then
            SqlDataSource1.Update()
        Else
            SqlDataSource1.Insert()
        End If
        GridView1.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles button3.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        Dim dt As Data.DataTable = dm.getdata("select * from Subject_master where Subject_id=" & GridView1.SelectedValue)
        TextBox1.Text = dt.Rows(0).Item(1).ToString
        DropDownList1.SelectedValue = dt.Rows(0).Item(2).ToString
        MultiView1.ActiveViewIndex = 1
        button2.Text = "Update"
    End Sub
End Class
