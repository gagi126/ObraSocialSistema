Public Class ClasePlanes
    Inherits ClaseMaestra

    Public Function RecuperarCambioPlanes(ardataset As DataSet, arpendiente As String) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "Select apellido + nombre as 'ape_nomb',plan_actual as'plan_actual',plan_nuevo as 'plan_solicitado', tramites_cambio_plan.estado as 'estado', nro_tramite as 'nro_tramite' from tramites_cambio_plan,socios where (tramites_cambio_plan.nro_socio = socios.nro_socio) and( (tramites_cambio_plan.estado='PEN') or (fecha_resolucion > DATEDIFF(DAY,fecha_resolucion,35)))"
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "solicitudes")
        Return intresultado
    End Function
    Public Function Aplicarcambionuevoplan(ByVal artram As ListItemCollection) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        Dim fechatramite As String
        fechatramite = DateTime.Now.ToString("dd-MM-yyyy HH:mm:ss:fff")
        strsql = "UPDATE tramites_cambio_plan SET Estado = 'APL', fecha_resolucion = '" & fechatramite & "', usuario_ult_modif = '" & HttpContext.Current.Session("user") & "' WHERE nro_tramite In ("
        For Each tramite As ListItem In artram
            strsql &= tramite.ToString() & ","
        Next tramite
        strsql = strsql.TrimEnd(",") + ");"
        strsql &= " DECLARE @nro_socio char(8); DECLARE @plan_nuevo char(4);DECLARE cursor_socios CURSOR FOR select nro_socio, plan_nuevo FROM Tramites_cambio_plan WHERE Estado = 'APL' AND fecha_resolucion = '" & fechatramite & "' AND usuario_ult_modif = '" & HttpContext.Current.Session("user") & "'; OPEN cursor_socios; FETCH NEXT FROM cursor_socios INTO @nro_socio, @plan_nuevo; WHILE @@FETCH_STATUS = 0 BEGIN UPDATE Socios SET plan_os = @plan_nuevo WHERE nro_socio_titular = @nro_socio;FETCH NEXT FROM cursor_socios INTO @nro_socio, @plan_nuevo; END CLOSE cursor_socios; DEALLOCATE cursor_socios;"
        intresultado = Me.Ejecutar(strsql)
        Return intresultado
    End Function

    Public Function InsertarCambioPlan(ByVal strnrosocio As String, ByVal strnuevoplan As String) As String
        Dim strsql As String
        Dim intresultado As Integer
        strsql = "insert into Tramites_cambio_plan values (case when not exists(select top 1 1 from Tramites_cambio_plan) then 1 else (select top 1 nro_tramite + 1 as nro_tramite from tramites_cambio_plan order by nro_tramite desc) end,'" & strnrosocio & "'," & "(select top 1 plan_os from Socios where nro_socio = '" & strnrosocio & "'),'" & strnuevoplan & "', 'PEN', '23/02/2020', 'User');"
        intresultado = Me.Ejecutar(strsql)
        Return intresultado
    End Function
    Public Function BuscarPendientes(ardataset As DataSet, ByVal strnrosocio As Integer) As Integer
        Dim strsql As String
        Dim intresultado As Integer
        strsql = "select * from tramites_cambio_plan where tramites_cambio_plan.nro_socio = '" & strnrosocio & "' and tramites_cambio_plan.estado ='PEN'"
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "solicitudes")
        Return intresultado
    End Function
    Public Function RecuperarTramitesPendientes(ByRef ardataset As DataSet) As Integer
        Dim strsql As String
        Dim intresultado As Integer

        strsql = "SELECT ltrim(rtrim(s.apellido)) + ' ' + ltrim(rtrim(s.nombre)) as apenomb, t.* FROM tramites_cambio_plan t INNER JOIN Socios s ON t.nro_socio = s.nro_socio WHERE t.estado = 'PEN' OR (t.estado != 'PEN' AND DATEDIFF(DAY, getdate(), t.fecha_resolucion) < 35)"

        intresultado = Me.RecuperaDataSet(ardataset, strsql, "planes")
        Return intresultado
    End Function


End Class
