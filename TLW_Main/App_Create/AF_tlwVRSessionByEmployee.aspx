<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="AF_tlwVRSessionByEmployee.aspx.vb" Inherits="AF_tlwVRSessionByEmployee" title="Add: Sessions By Employee" %>
<asp:Content ID="CPHtlwVRSessionByEmployee" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabeltlwVRSessionByEmployee" runat="server" Text="&nbsp;Add: Sessions By Employee"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLtlwVRSessionByEmployee" runat="server" >
  <ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLtlwVRSessionByEmployee"
    ToolType = "lgNMAdd"
    InsertAndStay = "False"
    ValidationGroup = "tlwVRSessionByEmployee"
    runat = "server" />
<asp:FormView ID="FVtlwVRSessionByEmployee"
  runat = "server"
  DataKeyNames = "RecordID"
  DataSourceID = "ODStlwVRSessionByEmployee"
  DefaultMode = "Insert" CssClass="sis_formview">
  <InsertItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <asp:Label ID="L_ErrMsgtlwVRSessionByEmployee" runat="server" ForeColor="Red" Font-Bold="true" Text=""></asp:Label>
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_RecordID" ForeColor="#CC6633" runat="server" Text="RecordID :" /><span style="color:red">*</span></b>
        </td>
        <td>
          <asp:TextBox ID="F_RecordID" Enabled="False" CssClass="mypktxt" width="70px" runat="server" Text="0" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_VRSessionID" runat="server" Text="VRSessionID :" /><span style="color:red">*</span>
        </td>
        <td>
          <LGM:LC_tlwVRSessions
            ID="F_VRSessionID"
            SelectedValue='<%# Bind("VRSessionID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="200px"
            CssClass="myddl"
            ValidationGroup = "tlwVRSessionByEmployee"
            RequiredFieldErrorMessage = "<div class='errorLG'>Required!</div>"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_UserName" runat="server" Text="UserName :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox
            ID = "F_UserName"
            CssClass = "myfktxt"
            Width="140px"
            Text='<%# Bind("UserName") %>'
            AutoCompleteType = "None"
            onfocus = "return this.select();"
            ToolTip="Enter value for UserName."
            ValidationGroup = "tlwVRSessionByEmployee"
            onblur= "script_tlwVRSessionByEmployee.validate_UserName(this);"
            Runat="Server" />
          <asp:RequiredFieldValidator 
            ID = "RFVUserName"
            runat = "server"
            ControlToValidate = "F_UserName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRSessionByEmployee"
            SetFocusOnError="true" />
          <asp:Label
            ID = "F_UserName_Display"
            Text='<%# Eval("aspnet_Users1_UserFullName") %>'
            CssClass="myLbl"
            Runat="Server" />
          <AJX:AutoCompleteExtender
            ID="ACEUserName"
            BehaviorID="B_ACEUserName"
            ContextKey=""
            UseContextKey="true"
            ServiceMethod="UserNameCompletionList"
            TargetControlID="F_UserName"
            EnableCaching="false"
            CompletionInterval="100"
            FirstRowSelected="true"
            MinimumPrefixLength="1"
            OnClientItemSelected="script_tlwVRSessionByEmployee.ACEUserName_Selected"
            OnClientPopulating="script_tlwVRSessionByEmployee.ACEUserName_Populating"
            OnClientPopulated="script_tlwVRSessionByEmployee.ACEUserName_Populated"
            CompletionSetCount="10"
            CompletionListCssClass = "autocomplete_completionListElement"
            CompletionListItemCssClass = "autocomplete_listItem"
            CompletionListHighlightedItemCssClass = "autocomplete_highlightedListItem"
            Runat="Server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_MaintainGrid" runat="server" Text="MaintainGrid :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_MaintainGrid"
           Checked='<%# Bind("MaintainGrid") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_InsertForm" runat="server" Text="InsertForm :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_InsertForm"
           Checked='<%# Bind("InsertForm") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_UpdateForm" runat="server" Text="UpdateForm :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_UpdateForm"
           Checked='<%# Bind("UpdateForm") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_DisplayGrid" runat="server" Text="DisplayGrid :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_DisplayGrid"
           Checked='<%# Bind("DisplayGrid") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_DisplayForm" runat="server" Text="DisplayForm :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_DisplayForm"
           Checked='<%# Bind("DisplayForm") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_DeleteOption" runat="server" Text="DeleteOption :" />&nbsp;
        </td>
        <td>
          <asp:CheckBox ID="F_DeleteOption"
           Checked='<%# Bind("DeleteOption") %>'
           CssClass = "mychk"
           runat="server" />
        </td>
      <td></td><td></td></tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
    </div>
  </InsertItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODStlwVRSessionByEmployee"
  DataObjectTypeName = "SIS.TLW.tlwVRSessionByEmployee"
  InsertMethod="UZ_tlwVRSessionByEmployeeInsert"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.TLW.tlwVRSessionByEmployee"
  SelectMethod = "GetNewRecord"
  runat = "server" >
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
