Imports Microsoft.VisualBasic
Imports System.Data
Imports System.Data.SqlClient
Public Class ClaseMaestra
    Public Function Conectar(ByRef objConexion As SqlConnection) As Integer
        Dim strConexion As String
        Dim intResultado As Integer

        intResultado = 1

        Try
            strConexion = "Data Source=DESKTOP-GGNH13Q;Initial Catalog=SBDObraSocial;Integrated Security=True"

            objConexion.ConnectionString = strConexion
            objConexion.Open()
        Catch ex As Exception

            intResultado = -1

        End Try

        Return intResultado
    End Function

    Public Function RecuperaDataSet(ByRef dtsDatos As DataSet, ByVal strSqltext As String, ByVal strTabla As String) As Integer
        Dim objConexion As New SqlConnection
        Dim intRetorno As Integer

        Me.Conectar(objConexion)
        Dim objCommand As New SqlCommand(strSqltext, objConexion)
        Dim objAdapter As New SqlDataAdapter
        objAdapter.SelectCommand = objCommand
        intRetorno = objAdapter.Fill(dtsDatos, strTabla)
        objConexion.Close()

        Return intRetorno

    End Function

    Public Function Ejecutar(ByVal strSqlText As String) As Integer
        Dim objConexion As New SqlConnection
        Dim intRetorno As Integer

        Me.Conectar(objConexion)

        Dim objCommand As New SqlCommand(strSqlText, objConexion)
        intRetorno = objCommand.ExecuteNonQuery()

        Return intRetorno

    End Function


End Class
