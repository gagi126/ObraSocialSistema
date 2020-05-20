Public Class DetsSocio
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Not Page.IsPostBack Then
            Dim nro As String
            nro = Request.QueryString("nroSocio")
            If Not IsNothing(nro) AndAlso nro.Length > 0 Then
                nro = nro.Trim()
                Me.lbl_nrosocio_tit.Text = nro
                RecuperarInfoPorNroSocioTit(nro)
            End If
        End If
    End Sub
    Public Sub RecuperarInfoPorNroSocioTit(ByVal arnroint As String)
        Dim intresultado As Integer
        Dim objdataset As New DataSet
        Dim objsocio As New ClaseTramites
        Dim strnrsocio As String
        Dim strnrotitular As String
        intresultado = objsocio.RecuperarPersonPorNroSocioTit(objdataset, arnroint)
        If intresultado > 0 Then
            Me.gv1.Visible = True
            strnrotitular = objdataset.Tables("Socio").Rows(0).Item("nro_socio_titular").ToString.Trim()
            strnrsocio = objdataset.Tables("Socio").Rows(0).Item("nro_socio").ToString.Trim()
            Me.lbl_nro_socio.Text = strnrsocio
            Me.lbl_apellido.Text = objdataset.Tables("Socio").Rows(0).Item("apellido").ToString.Trim()
            Me.lbl_name.Text = objdataset.Tables("Socio").Rows(0).Item("nombre").ToString.Trim()
            Me.lbl_numdoc.Text = objdataset.Tables("Socio").Rows(0).Item("nro_documento").ToString.Trim()
            Me.lbl_fechanac.Text = Date.Parse(objdataset.Tables("Socio").Rows(0).Item("fecha_nac").ToString.Trim())
            Me.lbl_sexo.Text = objdataset.Tables("Socio").Rows(0).Item("sexo1").ToString.Trim()
            Me.lbl_paren.Text = objdataset.Tables("Socio").Rows(0).Item("par").ToString.Trim()
            Me.lbl_plan_os.Text = objdataset.Tables("Socio").Rows(0).Item("plan_os").ToString.Trim()
            Me.lbl_dir.Text = objdataset.Tables("Socio").Rows(0).Item("direccion").ToString.Trim()
            Me.lbl_cp.Text = objdataset.Tables("Socio").Rows(0).Item("cp").ToString.Trim()
            Me.lbl_telefono.Text = objdataset.Tables("Socio").Rows(0).Item("telefonos").ToString.Trim()
            Me.lbl_mail.Text = objdataset.Tables("Socio").Rows(0).Item("mail").ToString.Trim()
            Me.lbl_estado.Text = objdataset.Tables("Socio").Rows(0).Item("est").ToString.Trim()
            Dim intresultadotitular As Integer
            Dim objdataset1 As New DataSet
            intresultadotitular = objsocio.RecuperarPersonPorNroSocioTit(objdataset1, strnrotitular)
            If intresultadotitular <> 0 Then
                Me.lbl_nrosocio_tit.Text = objdataset1.Tables("Socio").Rows(0).Item("apenomb").ToString.Trim()
            End If
            RecuperaFamiliaPorNroSocio(strnrsocio)
        Else

            Me.lblalerta.Visible = True
            Me.gv1.Visible = False
            Me.lbl_nro_socio.Text = ""
            Me.lbl_apellido.Text = ""
            Me.lbl_name.Text = ""
            Me.lbl_numdoc.Text = ""
            Me.lbl_numdoc.Text = ""
            Me.lbl_fechanac.Text = ""
            Me.lbl_sexo.Text = ""
            Me.lbl_nrosocio_tit.Text = ""
            Me.lbl_paren.Text = ""
            Me.lbl_plan_os.Text = ""
            Me.lbl_dir.Text = ""
            Me.lbl_cp.Text = ""
            Me.lbl_telefono.Text = ""
            Me.lbl_mail.Text = ""
            Me.lbl_estado.Text = ""
            Me.gv1.DataSource = Nothing
            Me.gv1.DataBind()
        End If
        objdataset.Dispose()
    End Sub

    Public Sub RecuperaFamiliaPorNroSocio(ByVal arnrosocio As String)
        Dim intResult As Integer
        Dim objDataSet As New DataSet
        Dim objsocio As New ClaseTramites

        intResult = objsocio.RecuperaFamiliaPorNroSocio(objDataSet, arnrosocio)

        If intResult > 0 Then
            Me.gv1.DataSource = objDataSet.Tables("Familia")
            gv1.DataBind()
        Else
            Me.lblalerta.Visible = True
            Me.gv1.Visible = False
            Me.gv1.DataSource = Nothing
            Me.gv1.DataBind()
        End If
        objDataSet.Dispose()
    End Sub
End Class