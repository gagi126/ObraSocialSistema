Public Class home
    Inherits System.Web.UI.Page

    Private Function RecuperarPersona()
        Dim objname As New ClaseTramites
        Dim objdataset As New DataSet
        Dim strapellido As String
        Dim strnombre As String
        Dim intresultado As Integer
        strapellido = Me.txtapellido.Text.Trim
        strnombre = Me.txtnombre.text.trim
        intresultado = objname.RecuperarPersonaPorIngreso(objdataset, strapellido, strnombre)
        If intresultado > 0 Then
            lblalerta.Visible = False
            gv1.Visible = True
            gv1.DataSource = objdataset.Tables("socios")
            gv1.DataBind()
        Else
            lblalerta.Visible = True
            gv1.Visible = False
        End If
        Return intresultado
    End Function

    Protected Sub btnbuscsocio_Click(sender As Object, e As EventArgs) Handles btnbuscsocio.Click
        RecuperarPersona()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class