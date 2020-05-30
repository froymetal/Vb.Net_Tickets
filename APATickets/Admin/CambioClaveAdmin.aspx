<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="CambioClaveAdmin.aspx.cs" Inherits="APATickets.Admin.CambioClaveAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>
    <br />
    <table style="width: 80%" border="1" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td style="text-align: center; height: 64px;">
                <table style="width: 100%" border="0" cellpadding="2" cellspacing="2" align="center">
                    <tr>
                        <td style="text-align: center; height: 64px;">
                            <br />
                            <dx:ASPxLabel ID="TituloTickets" runat="server" Text="CAMBIO DE CLAVE DEL ADMINISTRADOR" Font-Bold="True"
                                ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                            </dx:ASPxLabel>
                        </td>
                    </tr>
                    <tr>
                        <td style="height: 60px">
                            <table style="width: 90%; padding:2px; border-spacing:2px" border="0" align="center">
                                <tr>
                                    <td style="text-align: right">
                                        <dx:ASPxLabel ID="lblClaveAnterior" runat="server" Text="CLAVE ANTERIOR : " Font-Bold="True"
                                            ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td style="text-align: left;">
                                        <dx:ASPxTextBox ID="txtClave" runat="server" Width="250px" HorizontalAlign="Left"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td colspan="2">
                                        <br />
                                        <hr />
                                        <br />
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <dx:ASPxLabel ID="lblNuevaClave" runat="server" Text="NUEVA CLAVE : " Font-Bold="True"
                                            ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                                        </dx:ASPxLabel>
                                    </td>

                                    <td style="text-align: left;">
                                        <dx:ASPxTextBox ID="txtNuevaClave" runat="server" Width="250px" HorizontalAlign="Left" Password="true"></dx:ASPxTextBox>
                                    </td>
                                </tr>
                                <tr>
                                    <td style="text-align: right">
                                        <br />
                                        <dx:ASPxLabel ID="lblRNuevaClave" runat="server" Text="REPITA LA NUEVA CLAVE : " Font-Bold="True"
                                            ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                                        </dx:ASPxLabel>
                                    </td>
                                    <td style="text-align: left;">
                                        <br />
                                        <dx:ASPxTextBox ID="txtRNuevaClave" runat="server" Width="250px" HorizontalAlign="Left" Password="true"></dx:ASPxTextBox>
                                    </td>
                                </tr>


                            </table>
                        </td>

                    </tr>
                    <tr>
                        <td style="text-align: center">
                            <br />
                            <asp:Button ID="btnActualizar" runat="server" Text="Actualizar" OnClick="btnActualizar_Click" OnClientClick="return confirm('Está seguro de cambiar su clave?')" />
                            <br />
                        </td>

                    </tr>
                </table>
                <br />
            </td>

        </tr>
    </table>
</asp:Content>
