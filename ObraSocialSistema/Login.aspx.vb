Imports System.Data
Public Class Login
    Inherits System.Web.UI.Page

    Protected Sub btniniciar_Click(sender As Object, e As EventArgs) Handles btniniciar.Click
        Dim objseguridad As New ClaseSeguridad
        Dim objdataset As New DataSet
        Dim intresultado As Integer
        Dim strusuario As String
        Dim strpassword As String
        strusuario = txtusuario.Text.Trim
        intresultado = objseguridad.RecuperarUsuario(objdataset, strusuario)
        If intresultado = 1 Then
            strpassword = objdataset.Tables("usuarios").Rows(0).Item("clave")
            If txtpassword.Text.Trim = strpassword.Trim Then
                Response.Redirect("home.aspx")
            Else
                lblalerta.Visible = True
            End If
        Else
            lblalerta.Visible = True
        End If
    End Sub

    Protected Sub btniniciar_Click1(sender As Object, e As EventArgs) Handles btniniciar.Click

    End Sub
End Class