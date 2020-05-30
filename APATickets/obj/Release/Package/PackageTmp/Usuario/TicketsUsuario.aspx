<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="TicketsUsuario.aspx.cs" Inherits="APATickets.Usuario.TicketsUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidar.js"></script>
    <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td style="text-align: center">
                <br />
                <dx:ASPxLabel ID="TituloTickets" runat="server" Text="LISTADO DE TICKET PENDIENTES" Font-Bold="True"
                    ForeColor="#263969" Font-Size="X-Large" Font-Names="Arial" Theme="Office2010Blue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <dx:ASPxGridView ID="GrdVwTicketsU" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                    ClientInstanceName="GrdVwTicketsU" DataSourceID="GrdVwTicketsUsuario" EnableCallbackAnimation="True"
                    OnRowInserting="GrdVwTicketsU_RowInserting"
                    OnStartRowEditing="GrdVwTicketsU_StartRowEditing"
                    OnRowUpdating="GrdVwTicketsU_RowUpdating"
                    OnRowDeleting="GrdVwTicketsU_RowDeleting"
                    OnHtmlEditFormCreated="GrdVwTicketsU_HtmlEditFormCreated"
                    Styles-FilterPopupItem-VerticalAlign="Top"
                    Styles-Header-BackgroundImage-ImageUrl="~/Images/cabeceramenuusuario.jpg"
                    Styles-Header-Font-Bold="true"
                    Styles-Header-HorizontalAlign="Center"
                    >
                    <SettingsText PopupEditFormCaption=" " />
                    <Templates>
                        <EditForm>
                            <span style="position: absolute; margin-top: -45px; margin-left: 15px">
                                <table>
                                    <tr>
                                        <td style="width: 65px;">
                                            <dx:ASPxImage ID="imgLogoPopup" runat="server" ImageUrl="~/Images/Iconos/AbrirTicket.png" ImageHeight="30px" ImageWidth="30px">
                                            </dx:ASPxImage>
                                        </td>
                                        <td style="text-align:left">
                                            <dx:ASPxLabel ID="lblNuevoTicket" runat="server" ClientInstanceName="lblNuevoTicket"
                                                Text="Abrir / Editar Ticket" ForeColor="White" Font-Bold="true" Font-Size="Large">
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
                        <EditForm Width="800" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" ShowHeader="true"  />
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="TICKET #" Visible="true" VisibleIndex="1">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_PERSONA" Caption="PERSONA" Visible="true" VisibleIndex="2" PropertiesTextEdit-ValidationSettings-RequiredField-IsRequired="true" PropertiesTextEdit-ValidationSettings-RequiredField-ErrorText="El nombre de la persona es un campo requerido">
                            <EditFormSettings Visible="true" VisibleIndex="1" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_CARGO" Caption="CARGO" Visible="false" >
                            <EditFormSettings Visible="true" VisibleIndex="2"/>
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_EMAIL" Caption="EMAIL" Visible="false" PropertiesTextEdit-ValidationSettings-RequiredField-IsRequired="true" PropertiesTextEdit-ValidationSettings-RequiredField-ErrorText="El email de la persona es un campo requerido">
                            <EditFormSettings Visible="true" VisibleIndex="3"/>
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="CLI_ID" Caption="CLI_ID" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="SOFT_ID" PropertiesComboBox-ValueType="System.Int32" Caption="APLICACIÓN" VisibleIndex="3" Name="SOFT_NOMBRE" >
                            <EditFormSettings VisibleIndex="4" />
                            <PropertiesComboBox DataSourceID="SqlCargaSoftware" ValueField="SOFT_ID" TextField="SOFT_NOMBRE">
                                <ClientSideEvents SelectedIndexChanged="function(s,e){cmbInconveniente.PerformCallback(s.GetValue());}" />
                            </PropertiesComboBox>

                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" VisibleIndex="4" Name="INC_DETALLE" >
                            <EditFormSettings VisibleIndex="5"/>
                            <PropertiesComboBox DataSourceID="SqlCargaInconveniente" ValueField="INC_ID" TextField="INC_DETALLE">
                            </PropertiesComboBox>
                            <EditItemTemplate>
                                <dx:ASPxComboBox ID="cmbInconveniente" runat="server" DataSourceID="SqlCargaInconveniente" ValueField="INC_ID" TextField="INC_DETALLE" Width="100%"
                                    ClientInstanceName="cmbInconveniente" OnCallback="cmbInconveniente_Callback" Value='<%# Bind("INC_DETALLE") %>'>
                                </dx:ASPxComboBox>
                            </EditItemTemplate>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewDataMemoColumn FieldName="RSP_DETALLE" Caption="DETALLE DEL TICKET" Visible="true" CellStyle-Font-Size="X-Small" >
                            <EditFormSettings Visible="True" VisibleIndex="6" />
                            <EditItemTemplate>
                                <dx:ASPxMemo ID="DETALLE" runat="server" ClientInstanceName="DETALLE" Value='<%# Bind("RSP_DETALLE") %>' Height="200px" Width="100%"></dx:ASPxMemo>
                            </EditItemTemplate>
                        </dx:GridViewDataMemoColumn>

<%--                        <dx:GridViewDataMemoColumn FieldName="RESPUESTA" Caption=" RESPONDER" Visible="false">
                            <EditFormSettings Visible="true" VisibleIndex="6" />
                            <EditItemTemplate>
                                <dx:ASPxMemo ID="RESPUESTA" runat="server" ClientInstanceName="RESPUESTA" Value='<%# Bind("RESPUESTA") %>' Height="100px" Width="100%"></dx:ASPxMemo>
                            </EditItemTemplate>
                        </dx:GridViewDataMemoColumn>--%>

                        <dx:GridViewDataDateColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA DE APERTURA" VisibleIndex="5">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_STATUS" Caption="ESTADO" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataDateColumn FieldName="TIC_FECHA_CIERRE" Caption="FECHA DE CIERRE" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_NOMBRE" Caption="RESPONSABLE" VisibleIndex="7">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO" Caption="TIEMPO SOPORTE" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_HORAS_DESCONTAR" Caption="TIEMPO DESCUENTO" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO" Caption="NIV_TIEMPO" Visible="false">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="Modificar" ButtonType="Image" Width="65">
                            <HeaderCaptionTemplate>
                                <dx:ASPxHyperLink ID="btnNuevo" runat="server" Text="Nuevo Ticket" ImageUrl="~/Images/Iconos/AbrirTicket.png" ToolTip="Abrir Nuevo Ticket"
                                    ImageHeight="30px" ImageWidth="30px">
                                    <ClientSideEvents Click="function (s, e) { GrdVwTicketsU.AddNewRow();}" />
                                </dx:ASPxHyperLink>
                            </HeaderCaptionTemplate>
                            <HeaderStyle HorizontalAlign="Center" />

                            <EditButton Visible="True" Text="Modificar Ticket">
                                <Image Url="../Images/Iconos/ModificarRegistro.png" ToolTip="Modificar Ticket" Width="20px" Height="20px"></Image>
                            </EditButton>

                            <DeleteButton Visible="true" Text="Cerrar Ticket">
                                <Image Url="../Images/Iconos/CerrarTicket.png" ToolTip="Cerrar Ticket" Width="23px" Height="23px"></Image>
                            </DeleteButton>

                            <UpdateButton Visible="true" Text="Aceptar">
                                <Image Url="../Images/Iconos/btnAceptar.png" ToolTip="Aceptar"></Image>
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

                <asp:SqlDataSource ID="GrdVwTicketsUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT TICKET.TIC_ID, SOFTWARE.SOFT_ID, TICKET.CLI_ID, SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_ID, INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, TICKET.TIC_PERSONA, TICKET.TIC_CARGO, TICKET.TIC_EMAIL, TICKET.TIC_STATUS, TICKET.TIC_FECHA_INICIO, TICKET.TIC_FECHA_CIERRE, RESPONSABLE.RESP_NOMBRE, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO, NIVEL_INCONVENIENTE.NIV_TIEMPO_DSCTO,TICKET.TIC_HORAS_DESCONTAR
                                FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID LEFT OUTER JOIN RESPONSABLE ON TICKET.RESP_ID = RESPONSABLE.RESP_ID
                                WHERE TICKET.TIC_STATUS = 'A' AND TICKET.CLI_ID = @CLI_ID
                                ORDER BY TICKET.TIC_FECHA_INICIO DESC">
                    <SelectParameters>
                        <asp:Parameter Name="CLI_ID" />
                        <%--<asp:SessionParameter Name="CLI_ID" SessionField="ID_USUARIO" />--%>
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlCargaSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT S.SOFT_ID,S.SOFT_NOMBRE FROM SOFTWARE S, CLIENTE_SOFTWARE CS WHERE CS.SOFT_ID = S.SOFT_ID AND CS.CLI_ID=@CLI_ID">
                    <SelectParameters>
                        <%--<asp:Parameter Name="CLI_ID" />--%>
                        <asp:SessionParameter Name="CLI_ID" Type="Int32" SessionField="ID_USUARIO" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlCargaInconveniente" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT INC_ID,INC_DETALLE FROM INCONVENIENTE WHERE SOFT_ID=@SOFTID">
                    <SelectParameters>
                        <asp:Parameter Name="SOFTID" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <br />
                <br />
                <table style="width: 200px" border="1" align="center" cellpadding="0" cellspacing="0">
                    <tr style="background-color: lightsteelblue">
                        <td colspan="2" class="headerTop" style="text-align: center">ESTADO DE UN TICKET</td>
                    </tr>
                    <tr style="background-color:white">
                        <td style="width: 20%; text-align: center">A</td>
                        <td style="width: 80%">Activo</td>
                    </tr>
                    <tr style="background-color:white">
                        <td style="width: 20%; text-align: center">C</td>
                        <td style="width: 80%">Cerrado</td>
                    </tr>
                </table>
                <br />
            </td>
        </tr>

    </table>
</asp:Content>
