<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="ListadoClientes.aspx.cs" Inherits="APATickets.Admin.ListadoClientes" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>

    <script type="text/javascript">
        function ClientesAdminFocusChanged()
        {
            GrdVwClientesAdmin.GetRowValues(GrdVwClientesAdmin.GetFocusedRowIndex(), "CLI_ID;CLI_EMPRESA", GetRowValues);
        }

        function GetRowValues(values)
        {
            var ClienteID = values[0];
            if (ClienteID != null)
            {
                FocusedCliente.Set("CLI_ID", values[0]);
                GrdVwClientesSoftAdmin.PerformCallback();
            }
        }

        function FechaInicioCambio()
        {
            ddFechaFin.SetDate(ddFechaInicio.GetDate());
            ddFechaFin.SetMinDate(ddFechaInicio.GetDate());
        }


    </script>

    <dx:ASPxHiddenField ID="FocusedCliente" runat="server" ClientInstanceName="FocusedCliente"></dx:ASPxHiddenField>

    <table style="width: 90%; padding:2px; border-spacing:2px" border="0" align="center">
  <tr>
    <td colspan="2" style="text-align:center">
        <br />
        <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="LISTADO DE CLIENTES" Font-Bold="True"
                    ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
        </dx:ASPxLabel>
        <br />
    </td>
  </tr>
  <tr style="vertical-align:top">
    <td style="height:50%">
                    <dx:ASPxGridView ID="GrdVwClientesAdmin" runat="server" Width="95%" KeyFieldName="CLI_ID" AutoGenerateColumns="false"
                        ClientInstanceName="GrdVwClientesAdmin" DataSourceID="GrdVwClientesAdminSQL" EnableCallbackAnimation="False"
                        OnHtmlEditFormCreated="GrdVwClientesAdmin_HtmlEditFormCreated"
                        OnStartRowEditing="GrdVwClientesAdmin_StartRowEditing"
                        OnRowInserting="GrdVwClientesAdmin_RowInserting"
                        OnRowUpdating="GrdVwClientesAdmin_RowUpdating"
                        OnRowDeleting="GrdVwClientesAdmin_RowDeleting"
                        Styles-FilterPopupItem-VerticalAlign="Top"
                        Styles-Header-BackgroundImage-ImageUrl="~/Images/cabeceramenuusuario.jpg"
                        Styles-Header-Font-Bold="true"
                        Styles-Header-HorizontalAlign="Center">

                        <ClientSideEvents FocusedRowChanged="function(s, e){ ClientesAdminFocusChanged(); }"/>
                        <SettingsBehavior AllowFocusedRow ="true" />
                        <SettingsText PopupEditFormCaption=" " />
                        <Templates>
                            <EditForm>
                                <span style="position: absolute; margin-top: -31px; margin-left: 5px">
                                    <table>
                                        <tr>
                                            <td style="width: 15px;">
                                                <dx:ASPxImage ID="imgLogoPopup" runat="server" ImageUrl="~/Images/Iconos/AgregarRegistro.png">
                                                </dx:ASPxImage>
                                            </td>
                                            <td style="text-align: left">
                                                <dx:ASPxLabel ID="lblCliente" runat="server" ClientInstanceName="lblCliente"
                                                    Text="Información del Cliente" ForeColor="White" Font-Bold="true" Font-Size="Large">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                    </table>
                                </span>
                                <dx:ASPxGridViewTemplateReplacement ID="TemplateReplacementContent" ReplacementType="EditFormContent" runat="server"></dx:ASPxGridViewTemplateReplacement>
                            </EditForm>
                        </Templates>
                        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1" />
                        <SettingsPopup>
                            <EditForm Width="800" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" ShowHeader="true" />
                        </SettingsPopup>
                        <Columns>
                            <dx:GridViewDataTextColumn FieldName="CLI_ID" Caption="ID" Visible="false">
                                <EditFormSettings Visible="false" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="1">
                                <EditFormSettings Visible="true" VisibleIndex="1" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_DIRECCION" Caption="DIRECCION" Visible="false" VisibleIndex="2" >
                                <EditFormSettings Visible="true" VisibleIndex="2" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="PA_ID" PropertiesComboBox-ValueType="System.Int32" Caption="PAIS" Visible="true" VisibleIndex="3" >
                                <EditFormSettings Visible="true" VisibleIndex="3" />
                                <PropertiesComboBox DataSourceID="SqlCargaPaises" ValueField="PA_ID" TextField="PA_NOMBRE">
                                </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_CIUDAD" Caption="CIUDAD" Visible="true" VisibleIndex="4">
                                <EditFormSettings Visible="true" VisibleIndex="4" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_TELEFONO" Caption="TELÉFONO" Visible="true" VisibleIndex="5">
                                <EditFormSettings Visible="true" VisibleIndex="5" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_STATUS" Caption="ESTADO" Visible="true" VisibleIndex="6">
                                <EditFormSettings Visible="false"/>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_CONTACTO" Caption="CONTACTO" Visible="false">
                                <EditFormSettings Visible="True" VisibleIndex="7" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_CELULAR" Caption="# CELULAR" Visible="false">
                                <EditFormSettings Visible="True" VisibleIndex="8" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_EMAIL" Caption="E-MAIL" Visible="false">
                                <EditFormSettings Visible="True" VisibleIndex="9" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_USUARIO" Caption="USUARIO" Visible="false">
                                <EditFormSettings Visible="True" VisibleIndex="10" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_CLAVE" Caption="CLAVE" Visible="false">
                                <EditFormSettings Visible="True" VisibleIndex="11" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" Width="65" CellStyle-BackColor="#ffcc99">
                                <%--Boton Modificar Cliente--%>
                                <EditButton Visible="True" Text="Modificar Cliente">
                                    <Image Url="../Images/Iconos/ModificarRegistro.png" ToolTip="Modificar Cliente" Width="20px" Height="20px"></Image>
                                </EditButton>
                                <%--Boton Nuevo CLiente--%>
                                <HeaderCaptionTemplate>
                                    <dx:ASPxHyperLink ID="btnNuevo" runat="server" Text="Nuevo Cliente" ImageUrl="~/Images/Iconos/AgregarRegistro.png" ToolTip="Nuevo Cliente"
                                        ImageHeight="20px" ImageWidth="20px">
                                        <ClientSideEvents Click="function (s, e) { GrdVwClientesAdmin.AddNewRow();}" />
                                    </dx:ASPxHyperLink>
                                </HeaderCaptionTemplate>
                                <HeaderStyle HorizontalAlign="Center" />
                                <%--Botón ELiminar Cliente--%>
                                <DeleteButton Visible="true">
                                    <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Desactivar Cliente" Width="20px" Height="20px"></Image>
                                </DeleteButton>
                                <%--Boton Aceptar en formulario--%>
                                <UpdateButton Visible="true" Text="Aceptar">
                                    <Image Url="../Images/Iconos/btnAceptar.png" ToolTip="Aceptar"></Image>
                                </UpdateButton>
                                <%--Botón cancelar en formulario--%>
                                <CancelButton Text="Cancelar">
                                    <Image Url="../Images/Iconos/btnCancelar.png" ToolTip="Cancelar"></Image>
                                </CancelButton>
                            </dx:GridViewCommandColumn>

                        </Columns>

                        <Styles>
                            <AlternatingRow BackColor="#CCCCCC">
                            </AlternatingRow>
                        </Styles>

                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="GrdVwClientesAdminSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT CLIENTE.CLI_ID, CLIENTE.CLI_EMPRESA, CLIENTE.CLI_DIRECCION, CLIENTE.CLI_TELEFONO, CLIENTE.CLI_USUARIO, CLIENTE.CLI_CLAVE, CLIENTE.CLI_STATUS, CLIENTE.PA_ID, PAIS.PA_NOMBRE, CLIENTE.CLI_CIUDAD, CLIENTE.CLI_CONTACTO, CLIENTE.CLI_CELULAR, CLIENTE.CLI_EMAIL
                                       FROM CLIENTE INNER JOIN PAIS ON CLIENTE.PA_ID = PAIS.PA_ID
                                       WHERE CLIENTE.CLI_STATUS='A'
                                       ORDER BY CLIENTE.CLI_EMPRESA">
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlCargaPaises" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT PA_ID,PA_NOMBRE FROM PAIS ORDER BY PA_NOMBRE">
                    </asp:SqlDataSource>

                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GrdVwClientesAdmin" FileName="Listado de Clientes"></dx:ASPxGridViewExporter>
                    <br />
                    <br />
                    <div style="text-align: center; vertical-align:bottom">
                        <asp:Button ID="bntExportarExcel" runat="server" Text="Exportar información a Excel" OnClick="bntExportarExcel_Click" />
                    </div>
        
    </td>
    <td style="height:50%">

        <dx:ASPxGridView ID="GrdVwClientesSoftAdmin" runat="server" Width="95%" KeyFieldName="SOFT_ID" AutoGenerateColumns="false"
                        ClientInstanceName="GrdVwClientesSoftAdmin" DataSourceID="GrdVwClientesSoftAdminSql" EnableCallbackAnimation="False"
                        OnCustomCallback="GrdVwClientesSoftAdmin_CustomCallback"
                        OnAfterPerformCallback="GrdVwClientesSoftAdmin_AfterPerformCallback"
                        OnStartRowEditing="GrdVwClientesSoftAdmin_StartRowEditing"
                        OnRowUpdating="GrdVwClientesSoftAdmin_RowUpdating"
                        Styles-FilterPopupItem-VerticalAlign="Top"
                        Styles-Header-BackgroundImage-ImageUrl="~/Images/cabeceramenuusuario.jpg"
                        Styles-Header-Font-Bold="true"
                        Styles-Header-HorizontalAlign="Center">

                        <SettingsText PopupEditFormCaption=" " />
                        <Templates>
                            <EditForm>
                                <span style="position: absolute; margin-top: -31px; margin-left: 5px">
                                    <table>
                                        <tr>
                                            <td style="width: 15px;">
                                                <dx:ASPxImage ID="imgLogoPopup" runat="server" ImageUrl="~/Images/Iconos/AgregarRegistro.png">
                                                </dx:ASPxImage>
                                            </td>
                                            <td style="text-align: left">
                                                <dx:ASPxLabel ID="lblSoftware" runat="server" ClientInstanceName="lblSoftware"
                                                    Text="Software" ForeColor="White" Font-Bold="true" Font-Size="Large">
                                                </dx:ASPxLabel>
                                            </td>
                                        </tr>
                                    </table>
                                </span>
                                <dx:ASPxGridViewTemplateReplacement ID="TemplateReplacementContent" ReplacementType="EditFormContent" runat="server"></dx:ASPxGridViewTemplateReplacement>
                            </EditForm>
                        </Templates>
                        <SettingsEditing Mode="PopupEditForm" EditFormColumnCount="1" />
                        <SettingsPopup>
                            <EditForm Width="400" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" ShowHeader="true" />
                        </SettingsPopup>

                        <Columns>
                            <%--Para que aparezca las cajas--%> 
                            <dx:GridViewCommandColumn ShowSelectCheckbox="true" VisibleIndex="0" Width="65">
                                <HeaderStyle HorizontalAlign ="Center" />
                                <HeaderTemplate >
                                        <dx:ASPxCheckBox ID="SelectAll" runat="server">
                                               <ClientSideEvents CheckedChanged="function(s,e){GrdVwClientesSoftAdmin.SelectAllRowsOnPage(s.GetChecked());}" />
                                        </dx:ASPxCheckBox>
                                </HeaderTemplate>
                            </dx:GridViewCommandColumn>

                            <dx:GridViewCommandColumn VisibleIndex="1" ButtonType="Default" Width="65" Caption=" ">
                                <EditButton Visible="true">
                                    <Image ToolTip="Editar" Width="20px" Height="20px"></Image>
                                </EditButton>

                                <CancelButton Visible="true">
                                    <Image ToolTip="Cancelar" Width="20px" Height="20px"></Image>
                                </CancelButton>

                                <UpdateButton Visible="true">
                                    <Image ToolTip="Aceptar" Width="20px" Height="20px"></Image>
                                </UpdateButton>
                            </dx:GridViewCommandColumn>


                            <dx:GridViewDataTextColumn FieldName="SOFT_ID" Caption="ID" Visible="false">
                                <EditFormSettings Visible="false" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SOFTWARE" Visible="true" VisibleIndex="1">
                                <EditFormSettings Visible="False" VisibleIndex="1" />
                            </dx:GridViewDataTextColumn>

                            <dx:GridViewDataDateColumn FieldName="FECHA_INICIO" Caption="FECHA INICIO" VisibleIndex="2">
                                <PropertiesDateEdit ClientInstanceName="ddFechaInicio">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="true"/>
                                    </ValidationSettings>
                                    <ClientSideEvents DateChanged="function(s, e){ FechaInicioCambio(); }"/>
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>

                            <dx:GridViewDataDateColumn FieldName="FECHA_FIN" Caption="FECHA FIN" VisibleIndex="3">
                                <PropertiesDateEdit ClientInstanceName="ddFechaFin">
                                    <ValidationSettings>
                                        <RequiredField IsRequired="true"/>
                                    </ValidationSettings>
                                </PropertiesDateEdit>
                            </dx:GridViewDataDateColumn>

                            <dx:GridViewDataSpinEditColumn FieldName="NUM_HORAS" Caption="NÚM HORAS" VisibleIndex="3">
                                <PropertiesSpinEdit>
                                    <ValidationSettings>
                                        <RequiredField IsRequired="true"/>
                                    </ValidationSettings>
                                    <SpinButtons ShowIncrementButtons="false"></SpinButtons>
                                </PropertiesSpinEdit>
                            </dx:GridViewDataSpinEditColumn>

                        </Columns>

                        <Styles>
                            <AlternatingRow BackColor="#CCCCCC">
                            </AlternatingRow>
                        </Styles>

                    </dx:ASPxGridView>

                    <asp:SqlDataSource ID="GrdVwClientesSoftAdminSql" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT SOFT_ID, SOFT_NOMBRE 
                                        , (SELECT CS_FECHA_INI FROM CLIENTE_SOFTWARE WHERE SOFT_ID = S.SOFT_ID AND CLI_ID = @CLI_ID) AS FECHA_INICIO
                                        , (SELECT CS_FECHA_FIN FROM CLIENTE_SOFTWARE WHERE SOFT_ID = S.SOFT_ID AND CLI_ID = @CLI_ID) AS FECHA_FIN
                                        , (SELECT CS_NUM_HORAS FROM CLIENTE_SOFTWARE WHERE SOFT_ID = S.SOFT_ID AND CLI_ID = @CLI_ID) AS NUM_HORAS
                                        FROM SOFTWARE S ORDER BY SOFT_NOMBRE">
                        <SelectParameters>
                            <asp:SessionParameter Name="CLI_ID" SessionField="Cliente" Type="Int32"/>
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <br />
                    <br />
                    <asp:Button ID="btnAceptar" runat="server" Text="Aceptar" OnClick="btnAceptar_Click"/>
    </td>
  </tr>
</table>


</asp:Content>
