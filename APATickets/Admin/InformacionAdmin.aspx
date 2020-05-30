<%@ Page Title="" Language="C#" MasterPageFile="~/MasterAdministrador.Master" AutoEventWireup="true" CodeBehind="InformacionAdmin.aspx.cs" Inherits="APATickets.Admin.InformacionAdmin" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    
    <style type="text/css">
        .auto-style1 {
            width: 267px;
        }
    </style>
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <script type="text/javascript" src="jsValidarAdmin.js"></script>
    <script type="text/javascript">

        function alerta(numero) {
            alert('Se ha presionado el boton: ' + numero);
        }

    </script>
    <br />
    <table style="width: 80%" border="2" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td>
                <table style="width: 100%" border="0" cellpadding="2" cellspacing="2" align="center">
                    <tr>
                        <td style="text-align: center;" colspan="2">
                            <br />
                            <dx:ASPxLabel ID="TituloTickets" runat="server" Text="INFORMACIÓN GENERAL DEL ADMINISTRADOR" Font-Bold="True"
                                ForeColor="#ff6600" Font-Size="Large" Font-Names="Arial" Theme="Office2010Blue">
                            </dx:ASPxLabel>
                            <br />
                            <br />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1" >
                            <dx:ASPxLabel ID="lblNombre" runat="server" Text="NOMBRE :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; width: 400px;">
                            <dx:ASPxTextBox ID="txtNombre" runat="server" Width="500px" HorizontalAlign="Left"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1">
                            <dx:ASPxLabel ID="lblCargo" runat="server" Text="CARGO :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; width: 400px;">
                            <dx:ASPxTextBox ID="txtCargo" runat="server" Width="500px" HorizontalAlign="Left"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1">
                            <dx:ASPxLabel ID="lblEmail" runat="server" Text="EMAIL :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; width: 400px;">
                            <dx:ASPxTextBox ID="txtEmail" runat="server" Width="500px" HorizontalAlign="Left"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right" class="auto-style1">
                            <dx:ASPxLabel ID="lblTipo" runat="server" Text="TIPO :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; width: 400px;">
                            <dx:ASPxComboBox ID="cmbTipo" runat="server" ValueType="System.String" HorizontalAlign="Left" Width="500px" ValueField="TIPO_ID" TextField="TIPO_DETALLE" DataSourceID="SqlCargaTipoAdm">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>

                </table>
                <br />
                <br />
            </td>
        </tr>
        <tr>
            <td>
                <br />
                <div style="text-align: center">
                    <dx:ASPxButton ID="btnAcualizarAdmin" runat="server" Text="Actualizar información" HorizontalAlign="Center" OnClick="btnAcualizarAdmin_Click" ></dx:ASPxButton>
                </div>
                <br />
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlCargaTipoAdm" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                SelectCommand="SELECT TIPO_ID,TIPO_DETALLE FROM TIPO_RESPONSABLE ORDER BY TIPO_DETALLE">
    </asp:SqlDataSource>
</asp:Content>

