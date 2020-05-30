<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="HistorialTicketsUsuario.aspx.cs" Inherits="APATickets.Usuario.HistorialTicketsUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidar.js"></script>
    <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td style="text-align: center">
                <br />
                <dx:ASPxLabel ID="TituloTickets" runat="server" Text="LISTADO DE TICKET GENERADOS" Font-Bold="True"
                    ForeColor="#428400" Font-Size="X-Large" Font-Names="Arial" Theme="Office2010Blue">
                </dx:ASPxLabel>
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <dx:ASPxGridView ID="GrdVwTicketsU" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                    ClientInstanceName="GrdVwTicketsU" DataSourceID="GrdVwTicketsUsuario" EnableCallbackAnimation="True"
                    Styles-FilterPopupItem-VerticalAlign="Top"
                    Styles-Header-BackgroundImage-ImageUrl="~/Images/cabeceramenuusuario.jpg"
                    Styles-Header-Font-Bold="true"
                    Styles-Header-HorizontalAlign="Center"
                    >
                    <SettingsText PopupEditFormCaption=" " />

                    <Columns>
                        <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="#" Visible="true" VisibleIndex="0">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_PERSONA" Caption="PERSONA" Visible="true" VisibleIndex="1" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_CARGO" Caption="CARGO" Visible="true" VisibleIndex="2" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_EMAIL" Caption="EMAIL" Visible="true" VisibleIndex="3">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SOFT_ID" Caption="SOFT_ID" Visible="false" >
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="CLI_ID" Caption="CLI_ID" Visible="false">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="APLICACIÓN" Visible="true" VisibleIndex="4">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="5">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="RSP_DETALLE" Caption="DETALLE DEL TICKET" Visible="false" VisibleIndex="6">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA DE APERTURA" VisibleIndex="7">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_STATUS" Caption="ESTADO" VisibleIndex="8">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataDateColumn FieldName="TIC_FECHA_CIERRE" Caption="FECHA DE CIERRE" VisibleIndex="9">
                        </dx:GridViewDataDateColumn>
                        <dx:GridViewDataTextColumn FieldName="RESP_NOMBRE" Caption="RESPONSABLE" VisibleIndex="10">
                        </dx:GridViewDataTextColumn>
                        <dx:GridViewDataTextColumn FieldName="TIC_HORAS_DESCONTAR" Caption="HORAS DESCONTADAS" VisibleIndex="11">
                        </dx:GridViewDataTextColumn>
                    </Columns>

                    <Styles>
                        <AlternatingRow BackColor="#CCCCCC" >
                        </AlternatingRow>
                    </Styles>
                    <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true"/>
                </dx:ASPxGridView>

                <asp:SqlDataSource ID="GrdVwTicketsUsuario" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                    SelectCommand="SELECT TICKET.TIC_ID, SOFTWARE.SOFT_ID, TICKET.CLI_ID, SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_ID, INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, TICKET.TIC_PERSONA, TICKET.TIC_CARGO,TICKET.TIC_EMAIL, TICKET.TIC_STATUS, TICKET.TIC_FECHA_INICIO, TICKET.TIC_FECHA_CIERRE, RESPONSABLE.RESP_NOMBRE, TICKET.TIC_HORAS_DESCONTAR
                                        FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID LEFT OUTER JOIN RESPONSABLE ON TICKET.RESP_ID = RESPONSABLE.RESP_ID
                                        WHERE TICKET.CLI_ID = @CLIENTE
                                        ORDER BY TICKET.TIC_FECHA_INICIO DESC">
                    <SelectParameters>
                        <asp:SessionParameter Name="CLIENTE" SessionField="ID_USUARIO" />
                    </SelectParameters>
                </asp:SqlDataSource>

                <br />
                <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GrdVwTicketsU" FileName="Historial Tickets"></dx:ASPxGridViewExporter>
                <br />
                <table style="width: 200px" border="1" align="center" cellpadding="0" cellspacing="0">
                    
                    <tr style="background-color:lightgreen">
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
                <div style="text-align:center">
                    <asp:Button ID="bntExportarExcel" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcel_Click"  />
                </div>
            </td>
        </tr>

    </table>
    
</asp:Content>
