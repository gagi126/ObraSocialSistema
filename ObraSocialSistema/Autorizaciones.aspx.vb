Public Class Autorizaciones
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            CargaTramitesPendientes()
        End If
    End Sub
    Private Sub CargaTramitesPendientes()
        Dim objplan As New ClasePlanes
        Dim objdataset As New DataSet
        Dim intresultado As Integer
        intresultado = objplan.RecuperarTramitesPendientes(objdataset)
        If intresultado > 0 Then
            Me.gv1.DataSource = objdataset.Tables("planes")
            Me.gv1.DataBind()
        End If
        objdataset.Dispose()
    End Sub

    Protected Sub btnenviar_Click(sender As Object, e As EventArgs) Handles btnenviar.Click
        Dim checkaplicar As CheckBox
        Dim listaseleccionados As New ListItemCollection
        Dim objplan As New ClasePlanes
        Dim intresultado As Integer = 0
        Dim intchanges As Integer = 0
        For x = 0 To Me.gv1.Rows.Count - 1
            checkaplicar = Me.gv1.Rows(x).FindControl("checkaplicar")
            If checkaplicar.Checked Then
                listaseleccionados.Add(Me.gv1.Rows(x).Cells(1).Text)
                intchanges += 1
            End If
        Next x
        If intchanges > 0 Then
            intresultado = objplan.Aplicarcambionuevoplan(listaseleccionados)
        End If
        If intresultado > 0 Then
            lblmensaje.Text = "Tramites autorizados: " + intchanges.ToString()
            CargaTramitesPendientes()
        Else
            lblmensaje.Text = "No se encontraron tramites pendientes"
        End If
    End Sub

    Private Sub gv1_RowDataBound(sender As Object, e As GridViewRowEventArgs) Handles gv1.RowDataBound
        If e.Row.RowType = DataControlRowType.DataRow Then
            If e.Row.Cells(5).Text <> "PEN" Then
                e.Row.FindControl("checkaplicar").Visible = False
                e.Row.BackColor = System.Drawing.ColorTranslator.FromHtml("#c3c3c3")
            End If
        End If
    End Sub
End Class