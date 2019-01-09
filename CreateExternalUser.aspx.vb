
Partial Class CreateExternalUser
  Inherits System.Web.UI.Page

  Private Sub CreateExternalUser_Load(sender As Object, e As EventArgs) Handles Me.Load
    Dim LoginID As String = ""
    Dim Password As String = ""
    Dim UserName As String = ""
    Dim EMailID As String = ""
    Try
      LoginID = Request.QueryString("LoginID")
      Password = Request.QueryString("Password")
      UserName = Request.QueryString("UserName")
      EMailID = Request.QueryString("EMailID")
    Catch ex As Exception
    End Try
    If LoginID = "" OrElse Password = "" OrElse UserName = "" OrElse EMailID = "" Then
      Response.Write("Error: All Parameters not Provided")
      Response.End()
    End If
    HttpContext.Current.Session("LoginID") = "0340"
    If SIS.SYS.Utilities.GlobalVariables.CreateWebUserNonEmployee(LoginID, Password, UserName, EMailID) Then
      Response.Write("Success")
      Response.End()
    End If
    Response.Write("Failed")
    Response.End()
  End Sub

End Class
