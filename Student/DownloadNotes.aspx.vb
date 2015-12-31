
Partial Class Student_DownloadNotes
    Inherits System.Web.UI.Page

    Protected Sub GridView1_SelectedIndexChanged(ByVal sender As Object, ByVal e As System.EventArgs) Handles GridView1.SelectedIndexChanged

    End Sub

    Protected Sub LinkButton1_Click(ByVal sender As Object, ByVal e As System.EventArgs)
        DownloadFile(Server.MapPath("~\Uploadnotes\" & sender.text))
    End Sub
    Public Sub DownloadFile(ByVal FilePath As String)
        Response.ContentType = "application/octet-stream"
        Response.AddHeader("Content-Disposition", "attachment; filename=" + System.IO.Path.GetFileName(FilePath))
        Response.Clear()
        Response.WriteFile(FilePath)
        Response.End()
    End Sub
End Class
