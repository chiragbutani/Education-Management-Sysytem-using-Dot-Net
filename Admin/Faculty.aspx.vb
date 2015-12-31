Partial Class Admin_Faculty
    Inherits System.Web.UI.Page
    Dim dm As New datamanager
    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        Button2.Text = "Insert"
        MultiView1.ActiveViewIndex = 1
    End Sub
    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If Button2.Text = "Update" Then
            If FileUpload1.Visible = True Then
                If FileUpload1.HasFile Then
                    If FileUpload1.FileName.EndsWith(".jpg") Or FileUpload1.FileName.EndsWith(".gif") Or FileUpload1.FileName.EndsWith(".png") Then
                        FileUpload1.SaveAs(Server.MapPath("~\UploadDoc\" & FileUpload1.FileName))
                        Label1.Text = FileUpload1.FileName
                        SqlDataSource1.Update()
                    Else
                        MsgBox("only image files")
                    End If
                Else
                    MsgBox("select a file to upload")
                End If
            Else
                SqlDataSource1.Update()
            End If
        Else
            If FileUpload1.HasFile Then
                If FileUpload1.FileName.EndsWith(".jpg") Or FileUpload1.FileName.EndsWith(".gif") Or FileUpload1.FileName.EndsWith(".png") Then
                    FileUpload1.SaveAs(Server.MapPath("~\UploadDoc\" & FileUpload1.FileName))
                Else
                    MsgBox("only image files")
                End If
            Else
                MsgBox("select a file to upload")
            End If
            SqlDataSource1.Insert()
        End If
        GridView1.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 0
    End Sub
    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged
        MultiView1.ActiveViewIndex = 1

        Dim dt As Data.DataTable = dm.getdata("Select * from Faculty_master where Faculty_id=" & GridView1.SelectedValue)
        TextBox1.Text = dt.Rows(0).Item(1).ToString()
        TextBox2.Text = dt.Rows(0).Item(2).ToString()
        TextBox3.Text = dt.Rows(0).Item(3).ToString()
        TextBox4.Text = dt.Rows(0).Item(4).ToString()
        TextBox5.Text = dt.Rows(0).Item(5).ToString()
        TextBox6.Text = dt.Rows(0).Item(6).ToString()
        TextBox7.Text = dt.Rows(0).Item(7).ToString()
        Image1.Visible = True
        LinkButton1.Visible = True
        FileUpload1.Visible = False
        Image1.ImageUrl = "~\UploadDoc\" & dt.Rows(0).Item(8).ToString()
        Label1.Text = dt.Rows(0).Item(8).ToString()
        Button2.Text = "Update"
    End Sub
    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles LinkButton1.Click
        Image1.Visible = False
        LinkButton1.Visible = False
        FileUpload1.Visible = True
    End Sub
End Class
