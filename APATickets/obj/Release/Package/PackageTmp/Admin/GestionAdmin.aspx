<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="GestionAdmin.aspx.cs" Inherits="APATickets.Admin.GestionAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>
    <table style="width: 90%; padding:2px; border-spacing:2px" border="0" align="center">
        <tr>
            <td style="text-align: center">
                <br />
                <dx:ASPxLabel ID="TituloTickets" runat="server" Text="GESTIÓN DE USUARIOS ADMINISTRADORES" Font-Bold="True"
                    ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <dx:ASPxGridView ID="GrdVwGestionAdmin" runat="server" Width="95%" KeyFieldName="RESP_ID" AutoGenerateColumns="False"
                    ClientInstanceName="GrdVwGestionAdmin" DataSourceID="GrdVwGestionAdminSQL" EnableCallbackAnimation="False"
                    OnHtmlEditFormCreated="GrdVwGestionAdmin_HtmlEditFormCreated"
                    OnStartRowEditing="GrdVwGestionAdmin_StartRowEditing"
                    OnRowInserting="GrdVwGestionAdmin_RowInserting"
                    OnRowUpdating="GrdVwGestionAdmin_RowUpdating"
                    OnRowDeleting="GrdVwGestionAdmin_RowDeleting"
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
                                        <td style="text-align:left">
                                            <dx:ASPxLabel ID="lblResponsable" runat="server" ClientInstanceName="lblResponsable"
                                                Text="Información del Usuario" ForeColor="Black" Font-Bold="true" Font-Size="Large">
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
                        <EditForm Width="600" HorizontalAlign="WindowCenter" VerticalAlign="WindowCenter" Modal="true" ShowHeader="true" />
                    </SettingsPopup>
                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="RESP_ID" Caption="ID" Visible="false">
                            <EditFormSettings Visible="false" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_NOMBRE" Caption="NOMBRE" Visible="true" VisibleIndex="1">
                            <EditFormSettings Visible="true" VisibleIndex="1" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_CARGO" Caption="CARGO" Visible="true" VisibleIndex="2">
                            <EditFormSettings Visible="true" VisibleIndex="2" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_EMAIL" Caption="E-MAIL" Visible="true" VisibleIndex="3">
                            <EditFormSettings Visible="true" VisibleIndex="3" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="RESP_STATUS" Caption="ESTADO" Visible="false" VisibleIndex="4" ReadOnly="true">
                            <EditFormSettings Visible="false" VisibleIndex="4" />
                        </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_USUARIO" Caption="USUARIO" Visible="false">
                            <EditFormSettings Visible="true" VisibleIndex="5" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_CLAVE" Caption="CLAVE" Visible="false">
                            <EditFormSettings Visible="true" VisibleIndex="6" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataComboBoxColumn FieldName="TIPO_ID" Caption="TIPO" Visible="true" PropertiesComboBox-ValueType="System.Int32" >
                            <EditFormSettings Visible="True" VisibleIndex="7" />
                            <PropertiesComboBox DataSourceID="SqlCargaTipo" ValueField="TIPO_ID" TextField="TIPO_DETALLE">
                            </PropertiesComboBox>
                        </dx:GridViewDataComboBoxColumn>

                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" Width="65" CellStyle-BackColor="#ffcc99">
                            <%--Boton Modificar Administrador--%>
                            <EditButton Visible="True" Text="Modificar Usuario">
                                <Image Url="../Images/Iconos/ModificarRegistro.png" ToolTip="Modificar Usuario" Width="20px" Height="20px"></Image>
                            </EditButton>
                            <%--Boton Nuevo Administrador--%>
                            <HeaderCaptionTemplate>
                                <dx:ASPxHyperLink ID="btnNuevo" runat="server" Text="Nuevo Usuario" ImageUrl="~/Images/Iconos/AgregarRegistro.png" ToolTip="Nuevo Usuario"
                                    ImageHeight="20px" ImageWidth="20px">
                                    <ClientSideEvents Click="function (s, e) { GrdVwGestionAdmin.AddNewRow();}" />
                                </dx:ASPxHyperLink>
                            </HeaderCaptionTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <DeleteButton Visible="true">
                                <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Eliminar Usuario" Width="20px" Height="20px"></Image>
                            </DeleteButton>

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

                <asp:SqlDataSource ID="GrdVwGestionAdminSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, RESPONSABLE.RESP_CARGO, RESPONSABLE.RESP_STATUS, RESPONSABLE.TIPO_ID, TIPO_RESPONSABLE.TIPO_DETALLE, RESPONSABLE.RESP_USUARIO, RESPONSABLE.RESP_CLAVE, RESPONSABLE.RESP_EMAIL 
                                    FROM TIPO_RESPONSABLE INNER JOIN RESPONSABLE ON TIPO_RESPONSABLE.TIPO_ID = RESPONSABLE.TIPO_ID
                                    WHERE RESPONSABLE.RESP_STATUS='A'
                                    ORDER BY RESPONSABLE.RESP_NOMBRE">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="SqlCargaTipo" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                        SelectCommand="SELECT TIPO_ID,TIPO_DETALLE FROM TIPO_RESPONSABLE">
                </asp:SqlDataSource>
                <br />

            </td>
        </tr>

    </table>
</asp:Content>
