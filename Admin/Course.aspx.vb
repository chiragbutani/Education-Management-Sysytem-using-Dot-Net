
Partial Class Admin_Course
    Inherits System.Web.UI.Page
    Dim dm As New Datamanager

    Protected Sub btnNew_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnNew.Click
        txtCourse.Text = ""
        btnInsert.Text = "insert"
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub btnInsert_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnInsert.Click
        If btnInsert.Text = "update" Then
            SqlDataSource1.Update()
        Else
            SqlDataSource1.Insert()
        End If
        GridView2.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub btnCancel_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles btnCancel.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub GridView2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView2.SelectedIndexChanged
        Dim dt As Data.DataTable = dm.getdata("select * from Course_master where Course_id=" & GridView2.SelectedValue)
        txtCourse.Text = dt.Rows(0).Item(1).ToString
        MultiView1.ActiveViewIndex = 1
        btnInsert.Text = "update"
    End Sub
End Class
