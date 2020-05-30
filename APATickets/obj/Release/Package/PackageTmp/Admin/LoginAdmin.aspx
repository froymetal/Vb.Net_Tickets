<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginAdmin.aspx.cs" Inherits="APATickets.Administrador.LoginAdmin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
</head>
<body style="background-image:url('http://support.apaconsultores.com/Imagenes/fondologinadmin.jpg')">
    <br />
    <table width="880" align="center" border="1" style="vertical-align:middle">
        <tr>
            <td bgcolor="#FFFFFF">
                <br />
                <table style="width:100%"; border="0" cellpadding="2" cellspacing="2" align="center" >
                    <tr>
                        <td>

                            <form id="form1" runat="server">
                                <div style="text-align: center">

                                    <dx:ASPxLabel ID="ASPxLabel4" runat="server" Text="SISTEMA DE GESTIÓN DE SOPORTE A USUARIOS" Font-Bold="True"
                                        ForeColor="#F46606" Font-Size="X-Large" Font-Names="Arial">
                                    </dx:ASPxLabel>
                                    <hr />
                                    <br />

                                </div>

                                <table style="text-align: center" cellpadding="2" cellspacing="2" style="width: 51%" align="center">
                                    <tr>
                                        <td>
                                            <table style="width: 100%">
                                                <tr>
                                                    <td align="right" style="width: 65px;">
                                                        <dx:ASPxImage ID="imgCandado" runat="server" ClientInstanceName="imgCandado" Height="44px" ImageUrl="~/Images/llave.png" Width="53px">
                                                        </dx:ASPxImage>
                                                    </td>
                                                    <td style="text-align: center">
                                                        <dx:ASPxLabel ID="lblTipo" runat="server" Font-Bold="True" Font-Names="Arial" Font-Size="X-Large" ForeColor="#263969" Text="Inicio de Sesión">
                                                        </dx:ASPxLabel>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="auto-style2">
                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Font-Bold="true" Font-Names="Arial" Font-Size="Medium" ForeColor="#263969" Text="Ingrese su nombre de usuario y contraseña del administrador">
                                            </dx:ASPxLabel>
                                            <br />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="auto-style2">
                                            <br />
                                            <asp:Login ID="logAdmin" runat="server" OnAuthenticate="logAdminAutenticacion" BackColor="#F7F7DE" BorderColor="#CCCC99" BorderStyle="Solid" BorderWidth="1px" Font-Names="Verdana" Font-Size="10pt" Height="128px" Width="459px">
                                                <LayoutTemplate>
                                                    <table cellpadding="1" cellspacing="0" style="border-collapse: collapse;">
                                                        <tr>
                                                            <td>
                                                                <table cellpadding="0" style="height: 128px; width: 459px;">
                                                                    <tr>
                                                                        <td align="center" colspan="2" style="color: White; background-color: #6B696B; font-weight: bold;">Iniciar sesión</td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." ValidationGroup="logAdmin">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="right">
                                                                            <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                                                        </td>
                                                                        <td>
                                                                            <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                            <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="logAdmin">*</asp:RequiredFieldValidator>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td colspan="2">
                                                                            <asp:CheckBox ID="RememberMe" runat="server" Text="Recordármelo la próxima vez." />
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="2" style="color: Red;">
                                                                            <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                                                        </td>
                                                                    </tr>
                                                                    <tr>
                                                                        <td align="center" colspan="2">
                                                                            <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Inicio de sesión" ValidationGroup="logAdmin" />
                                                                        </td>
                                                                    </tr>
                                                                </table>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </LayoutTemplate>
                                                <TitleTextStyle BackColor="#6B696B" Font-Bold="True" ForeColor="#FFFFFF" />
                                            </asp:Login>

                                        </td>
                                    </tr>
                                </table>
                                <br />
                                <div style="text-align: center">
                                    <dx:ASPxImage ID="imgAPA" runat="server" ClientInstanceName="imgAPA" ImageUrl="~/Images/apa.jpg" ImageAlign="Middle" Height="113px" Width="428px">
                                    </dx:ASPxImage>
                                </div>
                                <br />
                            </form>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</body>
</html>
