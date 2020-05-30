<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="TicketsAdmin.aspx.cs" Inherits="APATickets.Admin.TicketsAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>
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
                    <dx:ASPxGridView ID="GrdVwTicketsAdmin" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                        ClientInstanceName="GrdVwTicketsAdmin" DataSourceID="GrdVwTicketsAdminSQL" EnableCallbackAnimation="True"
                        OnHtmlEditFormCreated="GrdVwTicketsAdmin_HtmlEditFormCreated"
                        OnStartRowEditing="GrdVwTicketsAdmin_StartRowEditing"
                        OnRowUpdating="GrdVwTicketsAdmin_RowUpdating"
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
                                                    Text="Responder Ticket" ForeColor="Black" Font-Bold="true" Font-Size="Large">
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
                            <dx:GridViewDataTextColumn FieldName="CLI_ID" Caption="CLI_ID" Visible="false" Width="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SOFT_ID" Caption="SOFT_ID" Visible="false" Width="0">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="TICKET #" Visible="true" VisibleIndex="1" ReadOnly="true">
                                <EditFormSettings Visible="false" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" ReadOnly="true">
                                <EditFormSettings Visible="true" VisibleIndex="2" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_PERSONA" Caption="PERSONA" Visible="true" VisibleIndex="3" ReadOnly="true">
                                <EditFormSettings Visible="true" VisibleIndex="3" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_CARGO" Caption="CARGO" Visible="true" VisibleIndex="4" ReadOnly="true">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_EMAIL" Caption="EMAIL" Visible="false" ReadOnly="true">
                                <EditFormSettings Visible="true" VisibleIndex="5" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SISTEMA" Visible="true" VisibleIndex="5" ReadOnly="true">
                                <EditFormSettings Visible="true" VisibleIndex="6" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="6" ReadOnly="true">
                                <EditFormSettings Visible="true" VisibleIndex="7" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataComboBoxColumn FieldName="NIV_DETALLE" Caption="NIVEL COMPLEJIDAD" Visible="true" VisibleIndex="7" >
                                <EditFormSettings Visible="true" VisibleIndex="8" Caption="RECATEGORIZAR NIVEL"/>
                                <PropertiesComboBox DataSourceID="SqlCargaNiveles" ValueField="NIV_DETALLE" TextField="NIV_DETALLE">
                            </PropertiesComboBox>
                            </dx:GridViewDataComboBoxColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_NIVEL_COMPLEJIDAD" Caption="NIVEL RECATEGORIZADO" Visible="true" VisibleIndex="8">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            
                            <dx:GridViewDataMemoColumn FieldName="RSP_DETALLE" Caption="DETALLE DEL TICKET" Visible="false" >
                                <EditFormSettings Visible="True" VisibleIndex="9" />
                                <EditItemTemplate>
                                <dx:ASPxMemo ID="DETALLE" runat="server" ClientInstanceName="DETALLE" Value='<%# Bind("RSP_DETALLE") %>' Height="180px" Width="100%"></dx:ASPxMemo>
                            </EditItemTemplate>
                            </dx:GridViewDataMemoColumn>
                            <dx:GridViewDataDateColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA APERTURA" VisibleIndex="9" ReadOnly="true">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_STATUS" Caption="ESTADO" Visible="false" ReadOnly="true">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataDateColumn FieldName="TIC_FECHA_CIERRE" Visible="false" Caption="FECHA CIERRE" ReadOnly="true">
                                <EditFormSettings Visible="False" />
                            </dx:GridViewDataDateColumn>
                            <dx:GridViewDataTextColumn FieldName="CLI_HORAS_SOPORTE" Caption="HORAS SOPORTE" VisibleIndex="10" ReadOnly="true">
                                <EditFormSettings Visible="false"/>
                            </dx:GridViewDataTextColumn>
                            <dx:GridViewDataTextColumn FieldName="TIC_HORAS_DESCONTAR" Caption="HORAS DESCONTAR" VisibleIndex="11" ReadOnly="true">
                                <EditFormSettings Visible="false"/>
                            </dx:GridViewDataTextColumn>
<%--                            <dx:GridViewDataTextColumn FieldName="TIEMPO" Caption="TIEMPO SOPORTE" Visible="false">
                                <EditFormSettings Visible="true" VisibleIndex="9"/>
                            </dx:GridViewDataTextColumn>--%>

                            <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" CellStyle-BackColor="#E6E1FF">
                                <EditButton Visible="True" Text="Responder Ticket">
                                    <Image Url="../Images/Iconos/ResponderTicket.png" ToolTip="Responder" Width="40px" Height="26px"></Image>
                                </EditButton>

                                <%--<HeaderCaptionTemplate>
                                    <dx:ASPxHyperLink ID="btnNuevo" runat="server" Text="Nuevo Ticket" ImageUrl="~/Images/Iconos/AgregarRegistro.png" ToolTip="Nuevo Ticket"
                                        ImageHeight="20px" ImageWidth="20px">
                                        <ClientSideEvents Click="function (s, e) { GrdVwTicketsU.AddNewRow();}" />
                                    </dx:ASPxHyperLink>
                                </HeaderCaptionTemplate>
                                <HeaderStyle HorizontalAlign="Center" />--%>
<%--                                <DeleteButton Visible="true">
                                    <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Cerrar Ticket" Width="20px" Height="20px"></Image>
                                </DeleteButton>--%>

                                <UpdateButton Visible="true" Text="Aceptar">
                                    <Image Url="../Images/Iconos/btnAceptar.png" ToolTip="Aceptar" ></Image>
                                </UpdateButton>

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

                    <asp:SqlDataSource ID="GrdVwTicketsAdminSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT TICKET.TIC_ID, SOFTWARE.SOFT_ID, TICKET.CLI_ID, CLIENTE.CLI_EMPRESA, SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_ID,INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_ID, TICKET_RESPUESTA.RSP_DETALLE, TICKET.TIC_PERSONA, TICKET.TIC_CARGO, TICKET.TIC_EMAIL, TICKET.TIC_STATUS, TICKET.TIC_FECHA_INICIO, TICKET.TIC_FECHA_CIERRE, CLIENTE_SOFTWARE.CS_NUM_HORAS, '' AS TIEMPO, NIVEL_INCONVENIENTE.NIV_ID, NIVEL_INCONVENIENTE.NIV_DETALLE, TICKET.TIC_NIVEL_COMPLEJIDAD, NIVEL_INCONVENIENTE.NIV_TIEMPO_DSCTO, TICKET.TIC_HORAS_DESCONTAR, CLIENTE.CLI_HORAS_SOPORTE
                                       FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID INNER JOIN CLIENTE_SOFTWARE ON CLIENTE.CLI_ID = CLIENTE_SOFTWARE.CLI_ID LEFT OUTER JOIN  TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID
                                       WHERE TICKET.RESP_ID=@RESPONSABLE AND TICKET.TIC_STATUS='A'
                                       ORDER BY TICKET.TIC_FECHA_INICIO DESC">
                        <SelectParameters>
                            <%--<asp:Parameter Name="RESPONSABLE" />--%>
                            <asp:SessionParameter Name="RESPONSABLE" SessionField="RESP_ID" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                    <asp:SqlDataSource ID="SqlCargaNiveles" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand ="SELECT DISTINCT NIVEL_INCONVENIENTE.NIV_ID, NIVEL_INCONVENIENTE.NIV_DETALLE
                                    FROM NIVEL_INCONVENIENTE INNER JOIN INCONVENIENTE ON NIVEL_INCONVENIENTE.NIV_ID = INCONVENIENTE.NIV_ID
                                    WHERE INCONVENIENTE.SOFT_ID = @SOFTID
                                    ORDER BY NIVEL_INCONVENIENTE.NIV_ID">

                        <SelectParameters>
                            <asp:SessionParameter SessionField ="soft_id" Name="SOFTID" Type="Int32"  />
                        </SelectParameters>
                    </asp:SqlDataSource>
                    <%--
                    <asp:SqlDataSource ID="SqlCargaInconveniente" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT INC_ID,INC_DETALLE FROM INCONVENIENTE WHERE SOFT_ID=@SOFTID">
                        <SelectParameters>
                            <asp:Parameter Name="SOFTID" />
                        </SelectParameters>
                    </asp:SqlDataSource>--%>
                    <br />
                    <br />
                    <%--<table style="width: 200px" border="1" align="center" cellpadding="0" cellspacing="0">
                        <tr style="background-color:lightsalmon">
                            <td colspan="2" class="headerTop" style="text-align:center">ESTADO DE UN TICKET</td>
                        </tr>
                        <tr>
                            <td style="width: 20%; text-align: center">A</td>
                            <td style="width: 80%">Activo</td>
                        </tr>
                        <tr>
                            <td style="width: 20%; text-align: center">C</td>
                            <td style="width: 80%">Cerrado</td>
                        </tr>
                    </table>--%>
                    <br />
                </td>
            </tr>
        
    </table>
</asp:Content>
