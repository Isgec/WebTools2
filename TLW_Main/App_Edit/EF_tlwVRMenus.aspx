<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="EF_tlwVRMenus.aspx.vb" Inherits="EF_tlwVRMenus" title="Edit: Menus" %>
<asp:Content ID="CPHtlwVRMenus" ContentPlaceHolderID="cph1" Runat="Server">
<div id="div1" class="ui-widget-content page">
<div id="div2" class="caption">
    <asp:Label ID="LabeltlwVRMenus" runat="server" Text="&nbsp;Edit: Menus"></asp:Label>
</div>
<div id="div3" class="pagedata">
<asp:UpdatePanel ID="UPNLtlwVRMenus" runat="server" >
<ContentTemplate>
  <LGM:ToolBar0 
    ID = "TBLtlwVRMenus"
    ToolType = "lgNMEdit"
    UpdateAndStay = "False"
    ValidationGroup = "tlwVRMenus"
    runat = "server" />
<asp:FormView ID="FVtlwVRMenus"
  runat = "server"
  DataKeyNames = "VRMenuID"
  DataSourceID = "ODStlwVRMenus"
  DefaultMode = "Edit" CssClass="sis_formview">
  <EditItemTemplate>
    <div id="frmdiv" class="ui-widget-content minipage">
    <table style="margin:auto;border: solid 1pt lightgrey">
      <tr>
        <td class="alignright">
          <b><asp:Label ID="L_VRMenuID" runat="server" ForeColor="#CC6633" Text="Menu ID :" /><span style="color:red">*</span></b>
        </td>
        <td>
          <asp:TextBox ID="F_VRMenuID"
            Text='<%# Bind("VRMenuID") %>'
            ToolTip="Value of VRMenuID."
            Enabled = "False"
            CssClass = "mypktxt"
            Width="70px"
            style="text-align: right"
            runat="server" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_VRMenuName" runat="server" Text="Menu Name :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_VRMenuName"
            Text='<%# Bind("VRMenuName") %>'
            Width="350px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="tlwVRMenus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for VRMenuName."
            MaxLength="50"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVVRMenuName"
            runat = "server"
            ControlToValidate = "F_VRMenuName"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRMenus"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_ToolTip" runat="server" Text="Tool Tip :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_ToolTip"
            Text='<%# Bind("ToolTip") %>'
            Width="350px" Height="40px" TextMode="MultiLine"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="tlwVRMenus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for ToolTip."
            MaxLength="100"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVToolTip"
            runat = "server"
            ControlToValidate = "F_ToolTip"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRMenus"
            SetFocusOnError="true" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_ParentVRMenuID" runat="server" Text="Parent Menu :" />
        </td>
        <td>
          <LGM:LC_tlwVRMenus
            ID="F_ParentVRMenuID"
            SelectedValue='<%# Bind("ParentVRMenuID") %>'
            OrderBy="DisplayField"
            DataTextField="DisplayField"
            DataValueField="PrimaryKey"
            IncludeDefault="true"
            DefaultText="-- Select --"
            Width="350px"
            CssClass="myddl"
            Runat="Server" />
          </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_VRMenuType" runat="server" Text="Menu Type :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_VRMenuType"
            Text='<%# Bind("VRMenuType") %>'
            Width="12px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="tlwVRMenus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for VRMenuType."
            MaxLength="1"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVVRMenuType"
            runat = "server"
            ControlToValidate = "F_VRMenuType"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRMenus"
            SetFocusOnError="true" />
        </td>
        <td class="alignright">
          <asp:Label ID="L_CSSClass" runat="server" Text="CSSClass :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_CSSClass"
            Text='<%# Bind("CSSClass") %>'
            Width="140px"
            CssClass = "mytxt"
            onfocus = "return this.select();"
            ValidationGroup="tlwVRMenus"
            onblur= "this.value=this.value.replace(/\'/g,'');"
            ToolTip="Enter value for CSSClass."
            MaxLength="20"
            runat="server" />
          <asp:RequiredFieldValidator 
            ID = "RFVCSSClass"
            runat = "server"
            ControlToValidate = "F_CSSClass"
            ErrorMessage = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRMenus"
            SetFocusOnError="true" />
        </td>
      </tr>
      <tr>
        <td class="alignright">
          <asp:Label ID="L_Sequence" runat="server" Text="Sequence :" /><span style="color:red">*</span>
        </td>
        <td>
          <asp:TextBox ID="F_Sequence"
            Text='<%# Bind("Sequence") %>'
            style="text-align: right"
            Width="70px"
            CssClass = "mytxt"
            ValidationGroup="tlwVRMenus"
            MaxLength="10"
            onfocus = "return this.select();"
            runat="server" />
          <AJX:MaskedEditExtender 
            ID = "MEESequence"
            runat = "server"
            mask = "9999999999"
            AcceptNegative = "Left"
            MaskType="Number"
            MessageValidatorTip="true"
            InputDirection="RightToLeft"
            ErrorTooltipEnabled="true"
            TargetControlID="F_Sequence" />
          <AJX:MaskedEditValidator 
            ID = "MEVSequence"
            runat = "server"
            ControlToValidate = "F_Sequence"
            ControlExtender = "MEESequence"
            EmptyValueBlurredText = "<div class='errorLG'>Required!</div>"
            Display = "Dynamic"
            EnableClientScript = "true"
            ValidationGroup = "tlwVRMenus"
            IsValidEmpty = "false"
            MinimumValue = "1"
            SetFocusOnError="true" />
        </td>
      <td></td><td></td></tr>
      <tr><td colspan="4" style="border-top: solid 1pt LightGrey" ></td></tr>
    </table>
  </div>
  </EditItemTemplate>
</asp:FormView>
  </ContentTemplate>
</asp:UpdatePanel>
<asp:ObjectDataSource 
  ID = "ODStlwVRMenus"
  DataObjectTypeName = "SIS.TLW.tlwVRMenus"
  SelectMethod = "tlwVRMenusGetByID"
  UpdateMethod="UZ_tlwVRMenusUpdate"
  DeleteMethod="UZ_tlwVRMenusDelete"
  OldValuesParameterFormatString = "original_{0}"
  TypeName = "SIS.TLW.tlwVRMenus"
  runat = "server" >
<SelectParameters>
  <asp:QueryStringParameter DefaultValue="0" QueryStringField="VRMenuID" Name="VRMenuID" Type="Int32" />
</SelectParameters>
</asp:ObjectDataSource>
</div>
</div>
</asp:Content>
