Public Class CourseInfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub

    Protected Sub DropDownList1_SelectedIndexChanged(sender As Object, e As EventArgs) Handles DropDownList1.SelectedIndexChanged
        Try
            SqlDataSource4.Insert()
            GridView7.DataBind()
        Catch ex As Exception
            LabelAlertRegister.Text = "The selected student is already registered to the course!"
        End Try




    End Sub

    Protected Sub LabelUpdateAlert2_DataBinding(sender As Object, e As EventArgs) Handles LabelUpdateAlert2ifneeded.DataBinding
        Try

        Catch ex As Exception
            LabelUpdateAlert2ifneeded.Text = "You are not authorized for this!"
        End Try
    End Sub
End Class
