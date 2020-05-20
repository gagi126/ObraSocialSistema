Public Class ClaseSeguridad
    Inherits ClaseMaestra
    Public Function RecuperarUsuario(ardataset As DataSet, arusuario As String) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "Select * from sys_usuarios where usuario = '" & arusuario & "'"
        intresultado = Me.RecuperaDataSet(ardataset, strsql, "usuarios")
        Return intresultado
    End Function
    Public Function RecuperarMenu(menudataset As DataSet) As Integer
        Dim intresultado As Integer
        Dim strsql As String
        strsql = "Select * from sys_formularios where estado ='ACT' order by formulario"
        intresultado = Me.RecuperaDataSet(menudataset, strsql, "sys_formularios")
        Return intresultado
    End Function
End Class
