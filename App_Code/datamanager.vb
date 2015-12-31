Imports Microsoft.VisualBasic
Imports System.Data.SqlClient
Public Class datamanager
    Dim cn As New SqlConnection
    Sub getconnection()
        cn.ConnectionString = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True"
        cn.Open()
    End Sub
    Sub setdata(ByVal query As String)
        Try
            getconnection()
            Dim cmd As New SqlCommand(query, cn)
            cmd.ExecuteNonQuery()
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            cn.Close()
        End Try
    End Sub
    Function getdata(ByVal query As String) As Data.DataTable
        Dim ds As New Data.DataSet
        Try
            getconnection()
            Dim da As New SqlDataAdapter(query, cn)
            da.Fill(ds)
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            cn.Close()
        End Try
        Return ds.Tables(0)
    End Function
    Function getValue(ByVal query As String) As String
        Dim result As String = ""
        Try
            getconnection()
            Dim cmd As New SqlCommand(query, cn)
            result = cmd.ExecuteScalar.ToString
        Catch ex As Exception
            MsgBox(ex.Message)
        Finally
            cn.Close()
        End Try
        Return result
    End Function
End Class

