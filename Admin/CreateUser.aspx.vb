
Partial Class Admin_CreateUser
    Inherits System.Web.UI.Page
    Dim dm As New datamanager
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub
    Protected Sub CreateUserWizard1_CreatedUser(ByVal sender As Object, ByVal e As System.EventArgs) Handles CreateUserWizard1.CreatedUser
        Roles.AddUserToRole(CreateUserWizard1.UserName, "student")
        Dim d1 As DropDownList = CType(CreateUserWizard1.CreateUserStep.ContentTemplateContainer.FindControl("DropDownList1"), DropDownList)
        dm.setdata("Update Student_master set Username ='" + CreateUserWizard1.UserName + "' where Student_id=" + d1.SelectedValue)
    End Sub
End Class
