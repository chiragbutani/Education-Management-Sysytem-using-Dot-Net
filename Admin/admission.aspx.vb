Partial Class Admin_Admission
    Inherits System.Web.UI.Page
    Dim dm As New datamanager
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        Dim id As String = dm.getValue("select max(Admission_id) from Admission_master")
        If id = "" Then
            id = "1"
        Else
            id = id + 1
        End If
        dm.setdata("insert into Admission_master values(" + id + ",'" + Date.Now.ToString("MM-dd-yyyy") + "'," + DropDownList1.SelectedValue + "," + TextBox1.Text + ")")
        For i = 0 To CheckBoxList1.Items.Count - 1
            If (CheckBoxList1.Items(i).Selected = True) Then
                dm.setdata("insert into Admission_details values(" + id + "," + CheckBoxList1.Items(i).Value + ")")
            End If
        Next
        MultiView1.ActiveViewIndex = 0
        GridView1.DataBind()
    End Sub

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub DropDownList2_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles DropDownList2.SelectedIndexChanged
        CheckBoxList1.DataBind()
    End Sub
End Class
