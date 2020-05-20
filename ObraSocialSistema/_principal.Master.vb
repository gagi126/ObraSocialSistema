Public Class _principal
    Inherits System.Web.UI.MasterPage
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim objseguridad As New ClaseSeguridad
            Dim objdataset As New DataSet
            Dim strpagina As String
            Dim stritemenu As String
            Dim intresultado As Integer
            Dim intindice As Integer
            intresultado = objseguridad.RecuperarMenu(objdataset)
            If intresultado > 0 Then
                For intindice = 0 To intresultado - 1
                    strpagina = objdataset.Tables("sys_formularios").Rows(intindice).Item("pagina").ToString.Trim
                    stritemenu = objdataset.Tables("sys_formularios").Rows(intindice).Item("nombre_menu").ToString.Trim
                    Dim objmenuitem As New MenuItem()
                    objmenuitem.NavigateUrl = strpagina
                    objmenuitem.Text = stritemenu
                    Me.objmenu.Items.Add(objmenuitem)
                Next
            End If
        End If
    End Sub

    Protected Sub Button1_Click(sender As Object, e As EventArgs) Handles Button1.Click
        FormsAuthentication.SignOut()
        Response.Redirect("Login.aspx")
    End Sub
End Class