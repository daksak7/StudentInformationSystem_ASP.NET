Public Class StudentInfo
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

    End Sub


    Protected Sub DetailsView1_PageIndexChanging(sender As Object, e As DetailsViewPageEventArgs) Handles DetailsView1.PageIndexChanging

    End Sub

    Protected Sub GridView2_SelectedIndexChanged(sender As Object, e As EventArgs) Handles GridView2.SelectedIndexChanged

    End Sub

    Protected Sub DetailsView1_Init(sender As Object, e As EventArgs) Handles DetailsView1.Init

    End Sub

    Protected Sub DetailsView1_ModeChanging(sender As Object, e As DetailsViewModeEventArgs) Handles DetailsView1.ModeChanging

    End Sub
End Class