Public Class ClaseTramites
    Inherits ClaseMaestra
    Public Function insertarnuevoplan(arplanrow As DataSet) As Integer
        Return True
    End Function
    Public Function RecuperarPersonaPorIngreso(ByRef ardataset As DataSet, ByVal arapellido As String, ByVal arnombre As String) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "Select *,ltrim(rtrim(apellido))+', ' + ltrim(rtrim(nombre)) as apenomb,CONVERT(CHAR(10), fecha_nac, 120),case when sexo = 'F' then 'Femenino' Else 'Masculino' end as sexo1, case when parentesco = 'TIT' then 'Titular' when parentesco = 'HIJ' then 'Hijo/a' when parentesco = 'CON' then 'Conyuge' else 'Hijo'  end as par, case when estado = 'ACT' then 'Activo' else 'Baja' end as est from socios where apellido like '" & arapellido.Trim() & "%' and nombre like '" & arnombre.Trim() & "%' "
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "socios")
        Return intresultado
    End Function

    Public Function RecuperaSocioPorNroParaCambios(ByRef ardataset As DataSet, ByVal arnrosocio As String) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "SELECT ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apenomb, plan_os, nro_socio FROM socios WHERE nro_socio = " & arnrosocio.Trim() & "AND Parentesco = 'TIT' AND estado = 'ACT' AND nro_socios NOT IN (SELECT DISTINCT nro_socio FROM Tramites_cambio_plan WHERE Estado = 'PEN')"
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "socio")
        Return intresultado
    End Function

    Public Function RecuperarPersonPorNroSocioTit(ByRef ardataset As DataSet, ByVal arnrosocio As String) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "SELECT *, ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apenomb, case when sexo = 'F' then 'Femenino' else 'Masculino' end as sexo1, case when parentesco = 'TIT' then 'Titular' when parentesco = 'CON' then 'Conyugue' else 'Hijo' end as par, case when estado = 'ACT' then 'Activo' else 'Baja' end As est from Socios where nro_socios = " & arnrosocio.Trim()
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "socio")
        Return intresultado
    End Function
    Public Function RecuperaFamiliaPorNroSocio(ByRef ardataset As DataSet, ByVal arnrosocio As String) As Integer
        Dim strsql As String
        Dim intresultado As Integer
        strsql = "SELECT *, ltrim(rtrim(apellido)) + ', ' + ltrim(rtrim(nombre)) as apenomb, ltrim(rtrim(nro_documento)) as documento, case when sexo = 'F' then 'Femenino' else 'Masculino' end as sexo1, case when parentesco = 'TIT' then 'Titular' when parentesco = 'CON' then 'Cónyugue' else 'Hijo' end as par, case when estado = 'ACT' then 'Activo' else 'Baja' end As est  from Socios where nro_socio_titular = (select top 1 nro_socio_titular from Socios where nro_socio = '" & arnrosocio.Trim() & "') and nro_socio != '" & arnrosocio.Trim() & "'"
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "familia")
        Return intresultado
    End Function
End Class
