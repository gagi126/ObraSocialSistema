Public Class Tramites
    Inherits System.Web.UI.Page
    Dim intresultado As Integer
    Protected Sub txtnrosocio_TextChanged(sender As Object, e As EventArgs) Handles txtnrosocio.TextChanged
        Dim strnrosocioint As String
        Dim strplanactual As String
        Dim objsocio As New ClaseTramites
        Dim objdataset As New DataSet
        Dim objbusqueda As New ClasePlanes
        Dim strnrosociobusqueda As String
        strnrosocioint = Me.txtnrosocio.Text.Trim
        strnrosociobusqueda = Me.txtnrosocio.Text
        If strnrosociobusqueda <> "" Then
            intresultado = objbusqueda.BuscarPendientes(objdataset, strnrosociobusqueda)
        Else
            Me.colalert.Visible = True
            Me.divalert1.Visible = True
            Me.lblerror.Visible = True
            Me.lblerror.Text = "El campo nro de socio no puede estar vacio"
        End If
        If intresultado > 0 Then
            Me.colalert.Visible = True
            Me.divalert1.Visible = True
            Me.lblerror.Visible = True
            Me.lblerror.Text = "El socio tiene tramites pendientes de aprobacion."
            intresultado = 0
        ElseIf strnrosocioint <> "" Then
            Me.colalert.Visible = False
            Me.divalert1.Visible = False
            Me.lblerror.Visible = False
            intresultado = objsocio.RecuperaSocioPorNroParaCambios(objdataset, strnrosocioint)
            Me.cmbplanos.Items.Clear()
            Me.gv1.DataSource = Nothing
            Me.gv1.DataBind()
            If intresultado > 0 Then
                strplanactual = objdataset.Tables("socio").Rows(0).Item("plan_os")
                Me.lblapenomb.Text = objdataset.Tables("socio").Rows(0).Item("apenomb")
                Me.lblplanactual.Text = strplanactual
                Cargargvparentesco(objdataset.Tables("socio").Rows(0).Item("nro_socio"))
                CargarCBnuevoplan(strplanactual)
            Else
                Me.lblapenomb.Text = ""
                Me.lblplanactual.Text = ""
            End If
            objdataset.Dispose()
        ElseIf strnrosociobusqueda <> "" Then
            Me.colalert.Visible = False
            Me.divalert1.Visible = False
            Me.lblerror.Visible = False
            intresultado = objsocio.RecuperaSocioPorNroParaCambios(objdataset, strnrosocioint)
            Me.cmbplanos.Items.Clear()
            Me.gv1.DataSource = Nothing
            Me.gv1.DataBind()
            If intresultado > 0 Then
                strplanactual = objdataset.Tables("socio").Rows(0).Item("plan_os")
                Me.lblapenomb.Text = objdataset.Tables("socio").Rows(0).Item("apenomb")
                Me.lblplanactual.Text = strplanactual
                Cargargvparentesco(objdataset.Tables("socio").Rows(0).Item("nro_socio"))
                CargarCBnuevoplan(strplanactual)
            Else
                Me.lblapenomb.Text = ""
                Me.lblplanactual.Text = ""
            End If
            objdataset.Dispose()
        End If
    End Sub

    Public Sub Cargargvparentesco(ByVal arNroSocio As String)
        Dim objsocio As New ClaseTramites
        Dim objdataset As New DataSet
        intresultado = objsocio.RecuperaFamiliaPorNroSocio(objdataset, arNroSocio)
        If intresultado > 0 Then
            Me.gv1.DataSource = objdataset.Tables("familia")
            Me.gv1.DataBind()
        Else
            Me.divalert1.Visible = True
            Me.lblerror.Visible = True
            Me.lblerror.Text = "El socio no tiene adherentes a cargo."
        End If
        objdataset.Dispose()
    End Sub

    Public Sub CargarCBnuevoplan(Optional ByVal arplanactual As String = Nothing)
        Dim var(4) As String
        var(0) = "1000"
        var(1) = "2000"
        var(2) = "3000"
        var(3) = "5000"
        Dim x As Integer = 0
        For i = 0 To 3
            If arplanactual <> var(i) Then
                cmbplanos.Items.Insert(x, New ListItem(var(i), var(i)))
                x += 1

            End If
        Next i

    End Sub
    Protected Sub btnenviar_Click(sender As Object, e As EventArgs) Handles btnenviar.Click
        Dim strnrosocioint As String
        Dim strnuevoplan As String
        Dim intresultado As Integer
        Dim objplan As New ClasePlanes
        strnrosocioint = Me.txtnrosocio.Text
        If strnrosocioint = Nothing Then
            Me.divalert1.Visible = True
            Me.lblerror.Visible = True
            Me.lblerror.Text = "Debe buscar un socio para realizar el tramite"
            intresultado = 0
        End If
        strnuevoplan = Me.cmbplanos.SelectedValue
        If cmbplanos.SelectedValue = Nothing Then
            Me.divalert1.Visible = True
            Me.lblerror.Visible = True
            Me.lblerror.Text = "Debe elegir un plan para completar la solicitud"
            intresultado = 0
        Else
            intresultado = objplan.InsertarCambioPlan(strnrosocioint, strnuevoplan)
        End If
        If intresultado > 0 Then
            Me.divsucess.Visible = True
            Me.txtnrosocio.Text = ""
            Me.lblapenomb.Text = ""
            Me.lblplanactual.Text = ""
            Me.cmbplanos.Items.Clear()
            Me.gv1.DataSource = Nothing
            Me.gv1.DataBind()
            Response.Redirect("Autorizaciones.aspx")
        Else
            Me.lblerror.Visible = True
            Me.lblerror.Text = "Ocurrio un error por favor revise lo ingresado"
        End If
    End Sub
End Class