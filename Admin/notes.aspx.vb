
Partial Class Admin_notes
    Inherits System.Web.UI.Page

    Protected Sub Button1_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button1.Click
        MultiView1.ActiveViewIndex = 1
    End Sub

    Protected Sub Button2_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button2.Click
        If FileUpload1.HasFile Then
            If FileUpload1.FileName.EndsWith(".pdf") Or FileUpload1.FileName.EndsWith(".docx") Or FileUpload1.FileName.EndsWith(".ppt") Then
                FileUpload1.SaveAs(Server.MapPath("~\Uploadnotes\" & FileUpload1.FileName))
                MsgBox("file uploaded successfully")
            Else
                MsgBox("only files")
            End If
        Else
            MsgBox("select a file to upload")
        End If
        SqlDataSource1.Insert()
        GridView1.DataBind()
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub Button3_Click(ByVal sender As Object, ByVal e As System.EventArgs) Handles Button3.Click
        MultiView1.ActiveViewIndex = 0
    End Sub

    Protected Sub MultiView1_ActiveViewChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles MultiView1.ActiveViewChanged

    End Sub
End Class
