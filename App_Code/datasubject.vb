Imports Microsoft.VisualBasic
Imports System.Data.SqlClient

Public Class datasubject
    Dim cn As New SqlConnection

    Sub getconnection()
        cn.ConnectionString = "Data Source=.\SQLEXPRESS;AttachDbFilename=|DataDirectory|\Database.mdf;Integrated Security=True;User Instance=True"
        cn.Open()

    End Sub
    Function getdata(ByVal query As String) As Data.DataTable
        Dim ds As New Data.DataSet
        Try
            getconnection()
            Dim da As New SqlDataAdapter(query, cn)
            da.Fill(ds)
        Catch ex As Exception
            MsgBox(ex.Message)

        End Try
        Return ds.Tables(0)
    End Function


End Class
