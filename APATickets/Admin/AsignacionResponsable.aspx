<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="AsignacionResponsable.aspx.cs" Inherits="APATickets.Admin.AsignacionResponsable" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="pageControl" ActiveTabStyle-HorizontalAlign-="center" Width="100%" TabAlign="Center">
        <TabPages>
            <%--TAB 1 --%>
            <dx:TabPage Text="Asignar responsable">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl1" runat="server">

                        <script type="text/javascript">

                            function alerta(numero) {
                                alert('Se ha presionado el boton: ' + numero);
                            }

                        </script>
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <br />
                                    <dx:ASPxLabel ID="TituloTickets" runat="server" Text="LISTADO DE TICKET GENERADOS POR EL USUARIO" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GrdVwResponsablesAdmin" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwResponsablesAdmin" DataSourceID="GrdVwResponsablesAdminSQL" EnableCallbackAnimation="True"
                                        OnHtmlEditFormCreated="GrdVwResponsablesAdmin_HtmlEditFormCreated"
                                        OnStartRowEditing="GrdVwResponsablesAdmin_StartRowEditing"
                                        OnRowUpdating="GrdVwResponsablesAdmin_RowUpdating"
                                        Styles-FilterPopupItem-VerticalAlign="Top"
                                        Styles-Header-BackgroundImage-ImageUrl="~/Images/cabeceramenuusuario.jpg"
                                        Styles-Header-Font-Bold="true"
                                        Styles-Header-HorizontalAlign="Center"
                                        >
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
                                                                <dx:ASPxLabel ID="lblRespTicket" runat="server" ClientInstanceName="lblRespTicket"
                                                                    Text="Asignar un responsable al ticket" ForeColor="Black" Font-Bold="true" Font-Size="Large">
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
                                            <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="TICKET #" Visible="true" VisibleIndex="1" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="1" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="2" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="3" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="3" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataMemoColumn FieldName="RSP_DETALLE" Caption="DETALLE" Visible="true" VisibleIndex="4" ReadOnly="true" CellStyle-Font-Size="X-Small" PropertiesMemoEdit-Height="130" PropertiesMemoEdit-ReadOnlyStyle-Font-Size="Small">
                                                <EditFormSettings Visible="true" VisibleIndex="4" />
                                            </dx:GridViewDataMemoColumn>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SISTEMA" Visible="true" VisibleIndex="5" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="5" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_DETALLE" Caption="NIVEL DE COMPLEJIDAD" Visible="true" VisibleIndex="6" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="6" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataComboBoxColumn FieldName="RESP_ID" Caption="RESPONSABLE" Visible="false">
                                                <EditFormSettings Visible="True" VisibleIndex="7" />
                                                <PropertiesComboBox DataSourceID="SqlCargaResponsable" ValueField="RESP_ID" TextField="RESP_NOMBRE">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataDateColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA DE APERTURA" VisibleIndex="8" ReadOnly="true">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" Width="65" CellStyle-BackColor="#E6E1FF">
                                                <EditButton Visible="True" Text="Asignar Responsable">
                                                    <Image Url="../Images/Iconos/AsignarResponsable.png" ToolTip="Asignar Responsable" Width="25px" Height="25px"></Image>
                                                </EditButton>

                                                <UpdateButton Visible="true" Text="Aceptar">
                                                    <Image Url="../Images/Iconos/AgregarRegistro.png" ToolTip="Aceptar" Width="30px" Height="30px"></Image>
                                                </UpdateButton>

                                                <CancelButton Text="Cancelar">
                                                    <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Cancelar" Width="30px" Height="30px"></Image>
                                                </CancelButton>
                                            </dx:GridViewCommandColumn>

                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>

                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="GrdVwResponsablesAdminSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT TICKET.TIC_ID, CLIENTE.CLI_EMPRESA, INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, SOFTWARE.SOFT_NOMBRE, NIVEL_INCONVENIENTE.NIV_DETALLE, RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, TICKET.TIC_FECHA_INICIO
                                    FROM TICKET INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID LEFT OUTER JOIN RESPONSABLE ON TICKET.RESP_ID = RESPONSABLE.RESP_ID
                                    WHERE (CLIENTE.CLI_STATUS = 'A') AND (TICKET.RESP_ID IS NULL) AND (TICKET.TIC_STATUS = 'A') AND (CLIENTE.CLI_STATUS = 'A')
                                    ORDER BY TICKET.TIC_FECHA_INICIO DESC"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="SqlCargaResponsable" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT RESP_ID,RESP_NOMBRE FROM RESPONSABLE WHERE RESP_STATUS='A'"></asp:SqlDataSource>
                                    <br />

                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <%--TAB 2 --%>
            <dx:TabPage Text="Reasignar responsable">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl2" runat="server">
                       
                        <script type="text/javascript">

                            function alerta(numero) {
                                alert('Se ha presionado el boton: ' + numero);
                            }

                        </script>
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <br />
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="LISTADO DE TICKET GENERADOS POR EL USUARIO" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwResponsablesAdmin" DataSourceID="GrdVwResponsablesReasignaSQL" EnableCallbackAnimation="True"
                                        OnHtmlEditFormCreated="GrdVwResponsablesAdmin_HtmlEditFormCreated"
                                        OnStartRowEditing="ASPxGridView1_StartRowEditing"
                                        OnRowUpdating="ASPxGridView1_RowUpdating"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
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
                                                                <dx:ASPxLabel ID="lblRespTicket" runat="server" ClientInstanceName="lblRespTicket"
                                                                    Text="Asignar un responsable al ticket" ForeColor="Black" Font-Bold="true" Font-Size="Large">
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
                                            <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="TICKET #" Visible="true" VisibleIndex="1" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="1" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="2" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="3" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="3" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataMemoColumn FieldName="RSP_DETALLE" Caption="DETALLE" Visible="false" VisibleIndex="4" ReadOnly="true" CellStyle-Font-Size="X-Small" PropertiesMemoEdit-Height="130" PropertiesMemoEdit-ReadOnlyStyle-Font-Size="Small">
                                                <EditFormSettings Visible="true" VisibleIndex="4" />
                                            </dx:GridViewDataMemoColumn>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SISTEMA" Visible="true" VisibleIndex="5" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="5" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_DETALLE" Caption="NIVEL DE COMPLEJIDAD" Visible="true" VisibleIndex="6" ReadOnly="true">
                                                <EditFormSettings Visible="true" VisibleIndex="6" />
                                            </dx:GridViewDataTextColumn>

                                            <dx:GridViewDataComboBoxColumn FieldName="RESP_ID" Caption="RESPONSABLE" Visible="true" PropertiesComboBox-ValueType="System.Int32">
                                                <EditFormSettings Visible="True" VisibleIndex="7" />
                                                <PropertiesComboBox DataSourceID="GrdVwResponsablesReasignaSQL2" ValueField="RESP_ID" TextField="RESP_NOMBRE">
                                                </PropertiesComboBox>
                                            </dx:GridViewDataComboBoxColumn>
                                            <dx:GridViewDataDateColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA DE APERTURA" VisibleIndex="8" ReadOnly="true">
                                                <EditFormSettings Visible="False" />
                                            </dx:GridViewDataDateColumn>

                                            <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" Width="65" CellStyle-BackColor="#E6E1FF">
                                                <EditButton Visible="True" Text="Reasignar Responsable">
                                                    <Image Url="../Images/Iconos/AsignarResponsable.png" ToolTip="Reasignar Responsable" Width="25px" Height="25px"></Image>
                                                </EditButton>

                                                <UpdateButton Visible="true" Text="Aceptar">
                                                    <Image Url="../Images/Iconos/AgregarRegistro.png" ToolTip="Aceptar" Width="30px" Height="30px"></Image>
                                                </UpdateButton>

                                                <CancelButton Text="Cancelar">
                                                    <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Cancelar" Width="30px" Height="30px"></Image>
                                                </CancelButton>
                                            </dx:GridViewCommandColumn>

                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>

                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="GrdVwResponsablesReasignaSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT TICKET.TIC_ID, CLIENTE.CLI_EMPRESA, INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, SOFTWARE.SOFT_NOMBRE, NIVEL_INCONVENIENTE.NIV_DETALLE, RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, TICKET.TIC_FECHA_INICIO
                                    FROM TICKET INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID LEFT OUTER JOIN RESPONSABLE ON TICKET.RESP_ID = RESPONSABLE.RESP_ID
                                    WHERE (CLIENTE.CLI_STATUS = 'A') AND (TICKET.RESP_ID IS NOT NULL) AND (TICKET.TIC_STATUS = 'A') AND (CLIENTE.CLI_STATUS = 'A')
                                    ORDER BY TICKET.TIC_FECHA_INICIO DESC"></asp:SqlDataSource>
                                    <asp:SqlDataSource ID="GrdVwResponsablesReasignaSQL2" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT RESP_ID,RESP_NOMBRE FROM RESPONSABLE WHERE RESP_STATUS='A'"></asp:SqlDataSource>
                                    <br />

                                </td>
                            </tr>

                        </table>

                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
