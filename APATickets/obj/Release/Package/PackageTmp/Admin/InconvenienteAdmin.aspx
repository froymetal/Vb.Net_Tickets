<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="InconvenienteAdmin.aspx.cs" Inherits="APATickets.Admin.InconvenienteAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>

    <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td style="text-align: center">
                <br />
                <dx:ASPxLabel ID="TituloTickets" runat="server" Text="INCONVENIENTE - SOLUCION" Font-Bold="True"
                    ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td style="text-align: center">
                <br />
                <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Escoja el sistema : " Font-Bold="True" ForeColor="#ff6600" Font-Size="Small" Font-Names="Arial" Theme="Office2003Silver" AssociatedControlID="cmbSoftware">
                </dx:ASPxLabel>
                <dx:ASPxComboBox ID="cmbSoftware" runat="server" ValueType="System.String" DataSourceID="SqlCargaSoftware" ValueField="SOFT_ID" TextField="SOFT_NOMBRE" Width="300px">
                    <ClientSideEvents SelectedIndexChanged="function(s,e){GrdVwInconvenienteAdmin.PerformCallback(); cmbNiveles.PerformCallback();}" />
                </dx:ASPxComboBox>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <dx:ASPxGridView ID="GrdVwInconvenienteAdmin" runat="server" Width="95%" KeyFieldName="SOFT_ID" AutoGenerateColumns="true"
                    ClientInstanceName="GrdVwInconvenienteAdmin" DataSourceID="GrdVwInconvenienteAdminSQL" EnableCallbackAnimation="True"
                    OnAfterPerformCallback="GrdVwInconvenienteAdmin_AfterPerformCallback"
                    OnStartRowEditing="GrdVwInconvenienteAdmin_StartRowEditing"
                    OnRowInserting="GrdVwInconvenienteAdmin_RowInserting"
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
                                            <dx:ASPxLabel ID="lblInc" runat="server" ClientInstanceName="lblInc"
                                                Text="Inconveniente - Solución" ForeColor="Black" Font-Bold="true" Font-Size="Large">
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

                        <dx:GridViewDataTextColumn FieldName="SOFT_ID" Caption="SOFT_ID" Visible="false" Width="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="INC_ID" Caption="INC_ID" Visible="false" Width="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NIV_ID" Caption="NIV_ID" Visible="false" Width="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SOL_ID" Caption="SOL_ID" Visible="false" Width="0">
                            <EditFormSettings Visible="False" />
                        </dx:GridViewDataTextColumn>

                        <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="1">
                            <EditFormSettings Visible="true" VisibleIndex="1" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataComboBoxColumn FieldName="NIV_DETALLE" Caption="NIVEL COMPLEJIDAD" Visible="true" VisibleIndex="2" >
                                <EditFormSettings Visible="true" VisibleIndex="2"/>
                                <PropertiesComboBox DataSourceID="SqlCargaNiveles" ValueField="NIV_ID" TextField="NIV_DETALLE" ClientInstanceName="cmbNiveles">
                                    <ClientSideEvents SelectedIndexChanged="function(s,e){GrdVwInconvenienteAdmin.PerformCallback();}" />
                            </PropertiesComboBox> 
                            </dx:GridViewDataComboBoxColumn>
                        <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO" Caption="TIEMPO DE SOLUCIÓN" Visible="true" VisibleIndex="3">
                            <EditFormSettings Visible="false" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO_DSCTO" Caption="TIEMPO DE DESCUENTO (HORAS)" Visible="true">
                            <EditFormSettings Visible="false" />
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataMemoColumn FieldName="DETALLE" Caption="SOLUCION" Visible="true">
                            <EditFormSettings Visible="true" />
                        </dx:GridViewDataMemoColumn>


                        <dx:GridViewCommandColumn VisibleIndex="0" Caption="Opciones" ButtonType="Image" Width="65" CellStyle-BackColor="#ffcc99">
                            <%--Boton Modificar --%>
                            <EditButton Visible="True" Text="Modificar Inconveniente">
                                <Image Url="../Images/Iconos/ModificarRegistro.png" ToolTip="Modificar Inconveniente" Width="20px" Height="20px"></Image>
                            </EditButton>
                            <%--Boton Nuevo --%>
                            <HeaderCaptionTemplate>
                                <dx:ASPxHyperLink ID="btnNuevo" runat="server" Text="Nuevo Inconveniente" ImageUrl="~/Images/Iconos/AgregarRegistro.png" ToolTip="Nuevo Inconveniente"
                                    ImageHeight="20px" ImageWidth="20px">
                                    <ClientSideEvents Click="function (s, e) { GrdVwInconvenienteAdmin.AddNewRow();}" />
                                </dx:ASPxHyperLink>
                            </HeaderCaptionTemplate>
                            <HeaderStyle HorizontalAlign="Center" />
                            <%--Boton Borrar --%>
                            <DeleteButton Visible="true">
                                <Image Url="../Images/Iconos/CerrarRegistro.png" ToolTip="Eliminar Inconveniente" Width="20px" Height="20px"></Image>
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

                <asp:SqlDataSource ID="GrdVwInconvenienteAdminSQL" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT SOFTWARE.SOFT_ID, INCONVENIENTE.INC_ID, INCONVENIENTE.INC_DETALLE, NIVEL_INCONVENIENTE.NIV_ID, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO, NIVEL_INCONVENIENTE.NIV_TIEMPO_DSCTO, SOLUCION.SOL_ID,SOLUCION.DETALLE
                                        FROM NIVEL_INCONVENIENTE INNER JOIN
                                        INCONVENIENTE ON NIVEL_INCONVENIENTE.NIV_ID = INCONVENIENTE.NIV_ID INNER JOIN
                                        SOLUCION ON INCONVENIENTE.INC_ID = SOLUCION.INC_ID INNER JOIN
                                        SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID
										WHERE SOFTWARE.SOFT_ID=@SOFTWARE
                                        ORDER BY SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_DETALLE">
                    <SelectParameters>
                        <asp:Parameter Name="SOFTWARE" Type="Int32" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlCargaSoftware" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT SOFT_ID,SOFT_NOMBRE FROM SOFTWARE">
                </asp:SqlDataSource>

                <asp:SqlDataSource ID="SqlCargaNiveles" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand ="SELECT DISTINCT NIVEL_INCONVENIENTE.NIV_ID, NIVEL_INCONVENIENTE.NIV_DETALLE
                                    FROM NIVEL_INCONVENIENTE INNER JOIN INCONVENIENTE ON NIVEL_INCONVENIENTE.NIV_ID = INCONVENIENTE.NIV_ID
                                    WHERE INCONVENIENTE.SOFT_ID = @SOFTWARE
                                    ORDER BY NIVEL_INCONVENIENTE.NIV_ID">
                        <SelectParameters>
                            <asp:Parameter Name="SOFTWARE" Type="Int32" />
                        </SelectParameters>
                    </asp:SqlDataSource>

                <br />
                <br />
            </td>
        </tr>
    </table>
</asp:Content>
