
Partial Class Login
    Inherits System.Web.UI.Page

    Protected Sub Login1_LoggedIn(ByVal sender As Object, ByVal e As System.EventArgs) Handles Login1.LoggedIn
        Dim r() As String = Roles.GetRolesForUser(Login1.UserName)
        Session("uname") = Login1.UserName
        If (r(0) = "admin") Then
            Response.Redirect("~\Admin\Home.aspx")
        ElseIf r(0) = "student" Then
            Response.Redirect("~\Student\Home.aspx")
        End If

    End Sub
End Class
