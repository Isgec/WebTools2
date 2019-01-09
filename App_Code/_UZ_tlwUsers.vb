Imports System
Imports System.Collections.Generic
Imports System.Data
Imports System.Data.SqlClient
Imports System.ComponentModel
Namespace SIS.TLW
  Partial Public Class tlwUsers
    Public Function GetColor() As System.Drawing.Color
      Dim mRet As System.Drawing.Color = Drawing.Color.Blue
      Return mRet
    End Function
    Public Function GetVisible() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEnable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public Function GetEditable() As Boolean
      Dim mRet As Boolean = True
      Return mRet
    End Function
    Public ReadOnly Property Editable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEditable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property Deleteable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEditable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property InitiateWFVisible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property InitiateWFEnable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property ApproveWFVisible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property ApproveWFEnable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property RejectWFVisible() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetVisible()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public ReadOnly Property RejectWFEnable() As Boolean
      Get
        Dim mRet As Boolean = True
        Try
          mRet = GetEnable()
        Catch ex As Exception
        End Try
        Return mRet
      End Get
    End Property
    Public Shared Function InitiateWF(ByVal LoginID As String, ByVal wp_user As String) As SIS.TLW.tlwUsers
      Dim Results As SIS.TLW.tlwUsers = tlwUsersGetByID(LoginID)
      If Not wp_user = String.Empty Then
        Dim oUsr As MembershipUser = Membership.GetUser(LoginID)
        If SIS.SYS.Utilities.GlobalVariables.mkPass(LoginID) Then
          If Not oUsr Is Nothing Then
            oUsr.ChangePassword("lg", wp_user)
          End If
        End If
      End If
      Return Results
    End Function
    Public Shared Function ApproveWF(ByVal LoginID As String, ByVal wp_user As String) As SIS.TLW.tlwUsers
      Dim Results As SIS.TLW.tlwUsers = tlwUsersGetByID(LoginID)
      Dim oUsr As MembershipUser = Membership.GetUser(LoginID)
      If Not oUsr Is Nothing Then
        oUsr.UnlockUser()
      End If
      Return Results
    End Function
    Public Shared Function RejectWF(ByVal LoginID As String, ByVal wp_user As String) As SIS.TLW.tlwUsers
      Dim Results As SIS.TLW.tlwUsers = tlwUsersGetByID(LoginID)
      Dim oUsr As MembershipUser = Membership.GetUser(LoginID)
      If Not oUsr Is Nothing Then
      End If
      Return Results
    End Function
    Public Shared Function UZ_tlwUsersSelectList(ByVal StartRowIndex As Integer, ByVal MaximumRows As Integer, ByVal OrderBy As String, ByVal SearchState As Boolean, ByVal SearchText As String, ByVal C_CompanyID As String, ByVal C_DivisionID As String, ByVal C_OfficeID As Int32, ByVal C_DepartmentID As String, ByVal C_DesignationID As Int32) As List(Of SIS.TLW.tlwUsers)
      Dim Results As List(Of SIS.TLW.tlwUsers) = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString())
        Using Cmd As SqlCommand = Con.CreateCommand()
          Cmd.CommandType = CommandType.StoredProcedure
          If SearchState Then
            Cmd.CommandText = "sptlw_LG_UsersSelectListSearch"
            Cmd.CommandText = "sptlwUsersSelectListSearch"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@KeyWord", SqlDbType.NVarChar, 250, SearchText)
          Else
            Cmd.CommandText = "sptlw_LG_UsersSelectListFilteres"
            Cmd.CommandText = "sptlwUsersSelectListFilteres"
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_C_CompanyID", SqlDbType.NVarChar, 6, IIf(C_CompanyID Is Nothing, String.Empty, C_CompanyID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_C_DivisionID", SqlDbType.NVarChar, 6, IIf(C_DivisionID Is Nothing, String.Empty, C_DivisionID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_C_OfficeID", SqlDbType.Int, 10, IIf(C_OfficeID = Nothing, 0, C_OfficeID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_C_DepartmentID", SqlDbType.NVarChar, 6, IIf(C_DepartmentID Is Nothing, String.Empty, C_DepartmentID))
            SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@Filter_C_DesignationID", SqlDbType.Int, 10, IIf(C_DesignationID = Nothing, 0, C_DesignationID))
          End If
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@StartRowIndex", SqlDbType.Int, -1, StartRowIndex)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@MaximumRows", SqlDbType.Int, -1, MaximumRows)
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@LoginID", SqlDbType.NvarChar, 9, HttpContext.Current.Session("LoginID"))
          SIS.SYS.SQLDatabase.DBCommon.AddDBParameter(Cmd, "@OrderBy", SqlDbType.NVarChar, 50, OrderBy)
          Cmd.Parameters.Add("@RecordCount", SqlDbType.Int)
          Cmd.Parameters("@RecordCount").Direction = ParameterDirection.Output
          _RecordCount = -1
          Results = New List(Of SIS.TLW.tlwUsers)()
          Con.Open()
          Dim Reader As SqlDataReader = Cmd.ExecuteReader()
          While (Reader.Read())
            Results.Add(New SIS.TLW.tlwUsers(Reader))
          End While
          Reader.Close()
          _RecordCount = Cmd.Parameters("@RecordCount").Value
        End Using
      End Using
      Return Results
    End Function
    Public Shared Function GetUserID(ByVal UserName As String) As Guid
      Dim _Result As Guid = Nothing
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString)
        Using Cmd As SqlCommand = Con.CreateCommand()
          Dim mSql As String = "SELECT TOP 1 [aspnet_Users].[UserID] FROM [aspnet_Users] WHERE [aspnet_Users].[UserName] = '" & UserName & "'"
          Cmd.CommandType = System.Data.CommandType.Text
          Cmd.CommandText = mSql
          Con.Open()
          _Result = Cmd.ExecuteScalar()
        End Using
      End Using
      Return _Result
    End Function
    Public Shared Function mkPass(ByVal UserName As String) As Boolean
      Dim UserID As Guid = GetUserID(UserName)
      If UserID.ToString = String.Empty Then
        Return False
      End If
      Using Con As SqlConnection = New SqlConnection(SIS.SYS.SQLDatabase.DBCommon.GetConnectionString)
        Using Cmd As SqlCommand = Con.CreateCommand()
          Dim mSql As String = "UPDATE aspnet_Membership SET Password='3DrEKbtItX/00J/1GLEvpX1PdnA=', PasswordSalt='J9WC17LFQxkVD1NpH1V3Ow==' WHERE UserID='" & Convert.ToString(UserID) & "'"
          Cmd.CommandType = System.Data.CommandType.Text
          Cmd.CommandText = mSql
          Con.Open()
          Cmd.ExecuteNonQuery()
        End Using
      End Using
      Return True
    End Function
    Public Shared Function ValidatePassword(ByVal owUsr As SIS.TLW.tlwUsers) As SIS.TLW.tlwUsers
      If owUsr.pw = "" Then
        owUsr.pw = IO.Path.GetRandomFileName()
        SIS.TLW.tlwUsers.ChangePassword(owUsr.UserName, owUsr.pw)
        SIS.TLW.tlwUsers.UpdateData(owUsr)
      End If
      Return owUsr
    End Function
    Public Shared Function ChangePassword(ByVal UserName As String, ByVal NewPassword As String) As Boolean
      Dim oUsr As MembershipUser = Membership.GetUser(UserName)
      If mkPass(UserName) Then
        If Not oUsr Is Nothing Then
          oUsr.ChangePassword("lg", NewPassword)
        End If
      End If
      Return True
    End Function
    Public Shared Function CreateWebUser(ByVal oUser As SIS.TLW.tlwUsers) As String
      Dim oUsr As MembershipUser = Membership.GetUser(oUser.UserName)
      Dim Password As String = ""
      If oUsr Is Nothing Then
        Password = oUser.UserName
        oUsr = Membership.CreateUser(oUser.UserName, Password)
      End If
      Return Password
    End Function

    Public Shared Function UZ_tlwUsersInsert(ByVal Record As SIS.TLW.tlwUsers) As SIS.TLW.tlwUsers
      Try
        CreateWebUser(Record)
        tlwUsersUpdate(Record)
      Catch ex As Exception
      End Try
      Return Record
    End Function
    Public Shared Function UZ_tlwUsersUpdate(ByVal Record As SIS.TLW.tlwUsers) As SIS.TLW.tlwUsers
      Dim _Result As SIS.TLW.tlwUsers = tlwUsersUpdate(Record)
      Return _Result
    End Function
    Public Shared Function UZ_tlwUsersDelete(ByVal Record As SIS.TLW.tlwUsers) As Integer
      Dim _Result as Integer = tlwUsersDelete(Record)
      Return _Result
    End Function
    Public Shared Function SetDefaultValues(ByVal sender As System.Web.UI.WebControls.FormView, ByVal e As System.EventArgs) As System.Web.UI.WebControls.FormView
      With sender
        Try
        CType(.FindControl("F_LoginID"), TextBox).Text = ""
        CType(.FindControl("F_UserFullName"), TextBox).Text = ""
        CType(.FindControl("F_ExtnNo"), TextBox).Text = ""
        CType(.FindControl("F_MobileNo"), TextBox).Text = ""
        CType(.FindControl("F_EMailID"), TextBox).Text = ""
        CType(.FindControl("F_C_DateOfJoining"), TextBox).Text = ""
        CType(.FindControl("F_C_CompanyID"),Object).SelectedValue = ""
        CType(.FindControl("F_C_DivisionID"),Object).SelectedValue = ""
        CType(.FindControl("F_C_OfficeID"),Object).SelectedValue = ""
        CType(.FindControl("F_C_DepartmentID"),Object).SelectedValue = ""
        CType(.FindControl("F_C_DesignationID"),Object).SelectedValue = ""
        CType(.FindControl("F_ActiveState"), CheckBox).Checked = False
        CType(.FindControl("F_Contractual"), CheckBox).Checked = False
        Catch ex As Exception
        End Try
      End With
      Return sender
    End Function
  End Class
End Namespace
