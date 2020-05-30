<%@ Page Title="" Language="C#" MasterPageFile="~/Root.master" AutoEventWireup="true" CodeBehind="InformacionUsuario.aspx.cs" Inherits="APATickets.Usuario.InformacionUsuario" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
   <script type="text/javascript" src="jsValidar.js"></script>
    <table style="width: 80%" border="2" cellpadding="2" cellspacing="2" align="center">
        <tr>
            <td>
                <table style="width: 100%; background-color:whitesmoke" border="0" cellpadding="2" cellspacing="2" align="center">
                    <tr>
                        <td style="text-align: center; height: 64px;" colspan="2">
                            <dx:ASPxLabel ID="ASPxLabel3" runat="server" Text="INFORMACIÓN GENERAL" Font-Bold="True"
                                Font-Size="Medium" Font-Names="Arial" Theme="iOS">
                            </dx:ASPxLabel>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblEmpresa" runat="server" Text="EMPRESA :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; ">
                            <dx:ASPxTextBox ID="txtEmpresa" runat="server" Width="400px" HorizontalAlign="Left" ReadOnly="true"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblDireccion" runat="server" Text="DIRECCIÓN :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxTextBox ID="txtDireccion" runat="server" Width="400px" HorizontalAlign="Left" ValidationSettings-RequiredField-IsRequired="true" ValidationSettings-RequiredField-ErrorText="La dirección es un campo obligatorio." >
                                <ClientSideEvents /> 
                            </dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblTelf" runat="server" Text="TELÉFONO :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxTextBox ID="txtTelf" runat="server" Width="400px" HorizontalAlign="Left" Text="(___) __ " ValidationSettings-RequiredField-IsRequired="true" ValidationSettings-RequiredField-ErrorText="El teléfono es un campo obligatorio."></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblPaís" runat="server" Text="PAÍS :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxComboBox ID="cmbPais" runat="server" ValueField="PA_ID" TextField="PA_NOMBRE" ValueType="System.String" HorizontalAlign="Left" Width="400px" DataSourceID="SqlCargaPaises">
                            </dx:ASPxComboBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblCiudad" runat="server" Text="CIUDAD :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxTextBox ID="txtCiudad" runat="server" Width="400px" HorizontalAlign="Left" ValidationSettings-RequiredField-IsRequired="true" ValidationSettings-RequiredField-ErrorText="Ciudad es un campo obligatorio."></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: center" colspan="2">
                            <br />
                            <dx:ASPxLabel ID="ASPxLabel2" runat="server" Text="INFORMACIÓN DEL CONTACTO" Font-Bold="True"
                                Font-Size="Medium" Font-Names="Arial" Theme="iOS">
                            </dx:ASPxLabel>
                            <hr />
                        </td>

                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblContacto" runat="server" Text="CONTACTO :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxTextBox ID="txtContacto" runat="server" Width="400px" HorizontalAlign="Left"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblCelular" runat="server" Text="TELF. CELULAR :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left;">
                            <dx:ASPxTextBox ID="txtCelular" runat="server" Width="400px" HorizontalAlign="Left"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblEmail" runat="server" Text="E-MAIL :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left; ">
                            <dx:ASPxTextBox ID="txtEmail" runat="server" Width="400px" HorizontalAlign="Left" AutoCompleteType="Email"></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: center" colspan="2">
                            <br />
                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="INFORMACIÓN DE LA CUENTA" Font-Bold="True"
                                Font-Size="Medium" Font-Names="Arial" Theme="iOS">
                            </dx:ASPxLabel>
                            <hr />
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblUsuario" runat="server" Text="USUARIO :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left">
                            <dx:ASPxTextBox ID="txtUsuario" runat="server" Width="300px" HorizontalAlign="Left" ValidationSettings-RequiredField-IsRequired="true" ValidationSettings-RequiredField-ErrorText="Usuario es un campo obligatorio."></dx:ASPxTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="text-align: right; width: 339px;">
                            <dx:ASPxLabel ID="lblPass" runat="server" Text="CONTRASEÑA :" Font-Bold="True"
                                ForeColor="#263969" Font-Size="Small" Font-Names="Arial" Theme="PlasticBlue">
                            </dx:ASPxLabel>
                        </td>
                        <td style="text-align: left">
                            <dx:ASPxTextBox ID="txtPass" runat="server" Width="300px" HorizontalAlign="Left" ValidationSettings-RequiredField-IsRequired="true" ValidationSettings-RequiredField-ErrorText="Contraseña es un campo obligatorio."></dx:ASPxTextBox>
                        </td>
                    </tr>


                </table>
                <br />
                <div style="text-align: center">
                    <dx:ASPxButton ID="btnAcualizar" runat="server" Text="Actualizar información" HorizontalAlign="Center" OnClick="btnAcualizar_Click" AutoPostBack="true"></dx:ASPxButton>
                </div>
                <br />
            </td>
        </tr>
    </table>

    <asp:SqlDataSource ID="SqlCargaPaises" runat="server" ConnectionString="<%$ ConnectionStrings:ticketsConnectionString %>"
                SelectCommand="SELECT PA_ID,PA_NOMBRE FROM PAIS ORDER BY PA_NOMBRE">
    </asp:SqlDataSource>
</asp:Content>


