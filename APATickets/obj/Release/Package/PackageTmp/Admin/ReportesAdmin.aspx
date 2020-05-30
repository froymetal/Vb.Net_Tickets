<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="ReportesAdmin.aspx.cs" Inherits="APATickets.Admin.ReportesAdmin" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>
    <dx:ASPxPageControl ID="ASPxPageControl1" runat="server" ActiveTabIndex="0" ClientInstanceName="pageControl">
        
        <TabPages>
            <%--TAB 1 --%>
            <dx:TabPage Text="Problemas Comunes">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="RepTituloInconvenientes" runat="server" Text="PROBLEMAS COMUNES GENERADOS EN EL SISTEMA" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GrdVwInconvenientes" runat="server" Width="95%" KeyFieldName="INC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwInconvenientes" DataSourceID="SqlGrdVwInconvenientes" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SISTEMA" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CUENTA_I" Caption="# DE TICKET GENERADOS" Visible="true" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlGrdVwInconvenientes" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_ID, INCONVENIENTE.INC_DETALLE, COUNT(TICKET.TIC_ID) AS CUENTA_I
                                                       FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID
                                                       GROUP BY INCONVENIENTE.INC_DETALLE, INCONVENIENTE.INC_ID, SOFTWARE.SOFT_NOMBRE
                                                       ORDER BY CUENTA_I DESC">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterI" runat="server" GridViewID="GrdVwInconvenientes" FileName="Problemas Comunes"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="bntExportarExcel" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcel_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
           
             <%--TAB 2 --%>
            <dx:TabPage Text="Problemas Específicos">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl3" runat="server">
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="PROBLEMAS ESPECÍFICOS GENERADOS EN EL SISTEMA" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GrdVwInconvenientesEspec" runat="server" Width="95%" KeyFieldName="INC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwInconvenientesEspec" DataSourceID="SqlGrdVwInconvenientesEspec" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SISTEMA" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CUENTA_I" Caption="# DE TICKET GENERADOS" Visible="true" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlGrdVwInconvenientesEspec" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_ID, INCONVENIENTE.INC_DETALLE, COUNT(TICKET.TIC_ID) AS CUENTA_I, CLIENTE.CLI_EMPRESA
                                                       FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID
                                                       GROUP BY INCONVENIENTE.INC_DETALLE, INCONVENIENTE.INC_ID, SOFTWARE.SOFT_NOMBRE, CLIENTE.CLI_EMPRESA
                                                       ORDER BY CUENTA_I DESC">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterEspec" runat="server" GridViewID="GrdVwInconvenientesEspec" FileName="Problemas Específicos"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="bntExportarExcelIEspec" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcelIEspec_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            
            <%--TAB 3 --%>
            <dx:TabPage Text="Horas x Cliente">
                <ContentCollection>
                    <dx:ContentControl runat="server">
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="lblHorasConsumidas" runat="server" Text="HORAS DE SOPORTE CONSUMIDAS POR CLIENTE" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GridViewHoras" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GridViewHoras" DataSourceID="SqlGrdVwHoras" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="PA_NOMBRE" Caption="PAIS" Visible="true" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_CIUDAD" Caption="CIUDAD" Visible="true" VisibleIndex="2" >
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SOFTWARE" Visible="true" VisibleIndex="3" >
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CS_NUM_HORAS" Caption="HORAS SOPORTE FALTANTES" Visible="true" VisibleIndex="4" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SUMA_HORAS" Caption="HORAS SOPORTE TOMADAS" Visible="true" VisibleIndex="5" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CS_FECHA_INI" Caption="FECHA INICIAL" Visible="true" VisibleIndex="6" CellStyle-HorizontalAlign="Center">
                                               <PropertiesTextEdit DisplayFormatString="yyyy/MM/dd" />
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CS_FECHA_FIN" Caption="FECHA CADUCIDAD" Visible="true" VisibleIndex="7" CellStyle-HorizontalAlign="Center">
                                                <PropertiesTextEdit DisplayFormatString="yyyy/MM/dd" />
                                            </dx:GridViewDataTextColumn>
                                        </Columns>
                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlGrdVwHoras" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT CLIENTE.CLI_ID, CLIENTE.CLI_EMPRESA, PAIS.PA_NOMBRE, CLIENTE.CLI_CIUDAD, SOFTWARE.SOFT_NOMBRE, CLIENTE_SOFTWARE.CS_NUM_HORAS, SUM(TICKET.TIC_HORAS_DESCONTAR) AS SUMA_HORAS, CLIENTE_SOFTWARE.CS_FECHA_INI, CLIENTE_SOFTWARE.CS_FECHA_FIN
                                                       FROM PAIS INNER JOIN CLIENTE ON PAIS.PA_ID = CLIENTE.PA_ID INNER JOIN CLIENTE_SOFTWARE ON CLIENTE.CLI_ID = CLIENTE_SOFTWARE.CLI_ID INNER JOIN SOFTWARE ON CLIENTE_SOFTWARE.SOFT_ID = SOFTWARE.SOFT_ID LEFT OUTER JOIN TICKET ON CLIENTE.CLI_ID = TICKET.CLI_ID
                                                       GROUP BY CLIENTE.CLI_ID, CLIENTE.CLI_EMPRESA, PAIS.PA_NOMBRE, CLIENTE.CLI_CIUDAD, CLIENTE_SOFTWARE.CS_NUM_HORAS, CLIENTE_SOFTWARE.CS_FECHA_INI,CLIENTE_SOFTWARE.CS_FECHA_FIN, SOFTWARE.SOFT_NOMBRE
                                                       ORDER BY CLIENTE.CLI_EMPRESA,SUMA_HORAS DESC">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterH" runat="server" GridViewID="GridViewHoras" FileName="Horas de Soporte Consumidas"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="bntExportarExcelHoras" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcelHoras_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>
            <%--TAB 4 --%>
            <dx:TabPage Text="Horas Atendidas">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl4" runat="server">
                    <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="HORAS DE SOPORTE ATENDIDAS POR CONSULTOR" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GrdVwResponsables" runat="server" Width="95%" KeyFieldName="RESP_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwResponsables" DataSourceID="SqlGrdVwResponsables" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="RESP_NOMBRE" Caption="RESPONSABLE" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SUMA_HORAS" Caption="HORAS ATENDIDAS" Visible="true" VisibleIndex="1" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" >
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlGrdVwResponsables" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, SUM(TICKET.TIC_HORAS_DESCONTAR) AS SUMA_HORAS, CLIENTE.CLI_EMPRESA
                                                       FROM RESPONSABLE INNER JOIN TICKET ON RESPONSABLE.RESP_ID = TICKET.RESP_ID INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID
                                                       WHERE TICKET.TIC_STATUS='C'               
                                                       GROUP BY RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, CLIENTE.CLI_EMPRESA
                                                       ORDER BY RESPONSABLE.RESP_NOMBRE">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterR" runat="server" GridViewID="GrdVwResponsables" FileName="Horas atendidas por consultor"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="bntExportarExcelResponsable" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcelResponsable_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                        </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <%--TAB 5 --%>
            <dx:TabPage Text="Tickets Pendientes">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl5" runat="server">
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="TICKET PENDIENTES POR CONSULTOR" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="GrdVwPendientes" runat="server" Width="95%" KeyFieldName="RESP_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GrdVwPendientes" DataSourceID="SqlGrdVwPendientes" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="RESP_NOMBRE" Caption="RESPONSABLE" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TIC_ID" Caption="# TICKET" Visible="true" VisibleIndex="1" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="CLI_EMPRESA" Caption="EMPRESA" Visible="true" VisibleIndex="2" >
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SOFTWARE" Visible="true"  VisibleIndex="3">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="4">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="TIC_FECHA_INICIO" Caption="FECHA DE APERTURA" Visible="true" VisibleIndex="5">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_DETALLE" Caption="NIVEL" Visible="true" VisibleIndex="6">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO" Caption="TIEMPO DE SOLUCION" Visible="true" VisibleIndex="7">
                                            </dx:GridViewDataTextColumn>
                                        </Columns>

                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlGrdVwPendientes" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, TICKET.TIC_ID, CLIENTE.CLI_EMPRESA, SOFTWARE.SOFT_NOMBRE,INCONVENIENTE.INC_DETALLE, TICKET.TIC_FECHA_INICIO, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO
                                                       FROM RESPONSABLE INNER JOIN TICKET ON RESPONSABLE.RESP_ID = TICKET.RESP_ID INNER JOIN CLIENTE ON TICKET.CLI_ID = CLIENTE.CLI_ID INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID
                                                       WHERE TICKET.TIC_STATUS = 'A'
                                                       ORDER BY RESPONSABLE.RESP_NOMBRE">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporterP" runat="server" GridViewID="GrdVwPendientes" FileName="Tickets pendientes"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="bntExportarExcelPendientes" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcelPendientes_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

            <%--TAB 6 --%>
            <dx:TabPage Text="Inconvenientes - Soluciones">
                <ContentCollection>
                    <dx:ContentControl ID="ContentControl6" runat="server">
                        <table style="width: 90%" border="0" cellpadding="2" cellspacing="2" align="center">
                            <tr>
                                <td style="text-align: center">
                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="INCONVENIENTE - SOLUCION SISTEMAS" Font-Bold="True"
                                        ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                                    </dx:ASPxLabel>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                    <dx:ASPxGridView ID="ASPxGridView1" runat="server" Width="95%" KeyFieldName="TIC_ID" AutoGenerateColumns="true"
                                        ClientInstanceName="GridViewHoras" DataSourceID="SqlSoluciones" EnableCallbackAnimation="True"
                                        Styles-FilterPopupItem-VerticalAlign="Top">
                                        <SettingsPager PageSize="100">
                                            <PageSizeItemSettings Visible="false" ShowAllItem="true"></PageSizeItemSettings>
                                        </SettingsPager>
                                        <Columns>
                                            <dx:GridViewDataTextColumn FieldName="SOFT_NOMBRE" Caption="SOFTWARE" Visible="true"  VisibleIndex="0">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="INC_DETALLE" Caption="INCONVENIENTE" Visible="true" VisibleIndex="1">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_DETALLE" Caption="NIVEL COMPLEJIDAD" Visible="true" VisibleIndex="2" >
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO" Caption="TIEMPO CLIENTE" Visible="true" VisibleIndex="3" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="NIV_TIEMPO_DSCTO" Caption="TIEMPO DESCUENTO" Visible="true" VisibleIndex="4" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>
                                            <dx:GridViewDataTextColumn FieldName="DETALLE" Caption="SOLUCION" Visible="true" VisibleIndex="4" CellStyle-HorizontalAlign="Center">
                                            </dx:GridViewDataTextColumn>

                                        </Columns>
                                        <Styles>
                                            <AlternatingRow BackColor="#CCCCCC">
                                            </AlternatingRow>
                                        </Styles>
                                        <Settings ShowGroupPanel="false" ShowFilterRow="true" ShowFilterRowMenu="true" />
                                    </dx:ASPxGridView>

                                    <asp:SqlDataSource ID="SqlSoluciones" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                                        SelectCommand="SELECT SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_DETALLE, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO, NIVEL_INCONVENIENTE.NIV_TIEMPO_DSCTO, SOLUCION.DETALLE
                                                        FROM NIVEL_INCONVENIENTE INNER JOIN
                                                        INCONVENIENTE ON NIVEL_INCONVENIENTE.NIV_ID = INCONVENIENTE.NIV_ID INNER JOIN
                                                        SOLUCION ON INCONVENIENTE.INC_ID = SOLUCION.INC_ID INNER JOIN
                                                        SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID
                                                        ORDER BY SOFTWARE.SOFT_NOMBRE, INCONVENIENTE.INC_DETALLE">
                                    </asp:SqlDataSource>

                                    <dx:ASPxGridViewExporter ID="ASPxGridViewExporter1" runat="server" GridViewID="GridViewHoras" FileName="Horas de Soporte Consumidas"></dx:ASPxGridViewExporter>
                                    <br />
                                    <div style="text-align: center">
                                        <asp:Button ID="Button1" runat="server" Text="Exportar reporte a Excel" OnClick="bntExportarExcelHoras_Click" />
                                    </div>
                                </td>
                            </tr>

                        </table>
                    </dx:ContentControl>
                </ContentCollection>
            </dx:TabPage>

        </TabPages>
    </dx:ASPxPageControl>
</asp:Content>
