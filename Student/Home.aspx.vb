
Partial Class Student_Home
    Inherits System.Web.UI.Page
    Dim dm As New datamanager
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session("sid") = dm.getValue("Select Student_id from Student_master where Username='" + Session("uname") + "'")
    End Sub
End Class
