<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LoginUsuario.aspx.cs" Inherits="APATickets.LoginUsuario.LoginUsuario" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title></title>
    <style type="text/css">
        body {
	background-color: #D8D8FE;
}
        .dxsplControl_Moderno {
            font-family: Segoe UI;
        }

            .dxsplControl_Moderno .headerPane,
            .dxsplControl_Moderno .footerMenu li {
                background-color: tan;
                color: Black;
            }

        .headerPane {
            background-color: #EDEDED;
            background-position: left top;
            background-repeat: no-repeat;
            font-family: Tahoma;
        }

            .headerPane .headerTop {
                height: 45px;
            }

        .templateTitle {
            float: left;
            margin-left: 15px;
            margin-top: 11px;
        }

        .loginControl {
            float: right;
            margin-top: 17px;
            margin-right: 25px;
            font-size: 12px;
        }

        .dxsplControl_Moderno .loginControl a,
        .dxsplControl_Moderno .templateTitle a {
            color: #0072c6;
            border-color: #0072c6;
        }

        .loginControl a {
            color: black;
            text-decoration: none;
            border-bottom: dashed 1px black;
            display: inline-block;
        }

        .dxsplControl_Moderno .headerMenu {
            margin-top: 13px;
        }

        .headerMenu {
            margin-top: 11px;
        }


        .dxsplControl_Moderno .footerPane {
            background: #EDEDED;
        }

        .footerPane {
            background-color: #EDEDED;
            height: 100%;
            font-family:Arial;
            font-size:small;
            font-style:oblique;
          
        }

        .footerMenu {
            float: right;
            padding-top: 7px;
        }

        .copyright {
            float: left;
            margin-left: 15px;
            margin-top: 100px;
        }

        .auto-style2 {
            height: 25px;
        }
        .auto-style3 {
            width: 846px;
        }
        .auto-style4 {
            background-color: #EDEDED;
            height: 100%;
            font-family: Arial;
            font-size: small;
            font-style: oblique;
            width: 846px;
        }
        .auto-style5 {
            width: 846px;
            height: 146px;
        }
    </style>
</head>
<body style="animation: forwards; background-image:url('http://support.apaconsultores.com/Imagenes/fondologinusuario.jpg')  " >
    <form id="form1" runat="server">
        <table style="background-image:url('http://support.apaconsultores.com/Imagenes/fondologinusuario1.png')" width="870" border="1" align="center">
            <tr>
                <td >
                    <table width="100%" border="0" cellpadding="2" cellspacing="2" align="center">
                        <tr>
                            <td>
                                <div class="headerTop" align="center">
                                    <dx:ASPxLabel ID="TituloSoporte" runat="server" Text="SISTEMA DE SOPORTE A USUARIOS" Font-Bold="True"
                                        ForeColor="#263969" Font-Size="X-Large" Font-Names="Arial">
                                    </dx:ASPxLabel>
                                    <hr />
                                </div>
                            </td>
                        </tr>
                        <br />
                        <tr align="center">
                            <td align="center">
                                <div class="templateTitle" align="center">
                                </div>
                                <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/logoAPA.png"  ImageAlign="Middle" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div>
                                    <table width="100%" style="height: 80%">
                                        <tr align="left" style="height: 60%; padding-left: 170px" valign="top">
                                            <td class="auto-style3">
                                                <table style="width: 40%" align="center" cellpadding="2" cellspacing="2">
                                                    <tr>
                                                        <td align="center">
                                                            <table style="width: 100%">
                                                                <tr>
                                                                    <td align="right" style="width: 65px;">
                                                                        <dx:ASPxImage ID="imgCandado" runat="server" ClientInstanceName="imgCandado"
                                                                            ImageUrl="~/Images/llave.png" Height="44px" Width="53px">
                                                                        </dx:ASPxImage>
                                                                    </td>
                                                                    <td align="left">
                                                                        <dx:ASPxLabel ID="lblTipo" runat="server" Text="Inicio de Sesión" Font-Bold="True"
                                                                            ForeColor="#263969" Font-Size="X-Large" Font-Names="Arial">
                                                                        </dx:ASPxLabel>
                                                                    </td>
                                                                </tr>
                                                            </table>

                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <td align="center" class="auto-style2">
                                                            <dx:ASPxLabel ID="ASPxLabel1" runat="server" Text="Ingrese su nombre de usuario y contraseña"
                                                                ForeColor="#263969" Font-Size="Medium" Font-Bold="true" Font-Names="Arial">
                                                            </dx:ASPxLabel>
                                                        </td>
                                                    </tr>
                                        </tr>
                                        <tr>
                                            <td align="center" class="auto-style2">
                                                <br/>
                                                <asp:Login ID="logUsuario" runat="server" OnAuthenticate="Login1_Authenticate1" BorderColor="Black" BorderPadding="0" BorderStyle="Solid" CssClass="dxbButton_Moderno" LoginButtonText="Aceptar" PasswordRecoveryText="Recuperar Contraseña" PasswordRecoveryUrl="http://www.apaconsultores.com/ec/index.php/contacto" TitleText="" Width="400px">
                                                    <LabelStyle Font-Bold="True" />
                                                    <LayoutTemplate>
                                                        <table cellpadding="0" cellspacing="0" style="border-collapse: collapse;">
                                                            <tr>
                                                                <td>
                                                                    <br />
                                                                    <table cellpadding="0" style="width: 430px;">
                                                                        <tr>
                                                                            <td align="right" style="font-weight: bold;">
                                                                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">Nombre de usuario:</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="UserName" runat="server"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="El nombre de usuario es obligatorio." ToolTip="El nombre de usuario es obligatorio." ValidationGroup="logUsuario">*</asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td align="right" style="font-weight: bold;">
                                                                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Contraseña:</asp:Label>
                                                                            </td>
                                                                            <td>
                                                                                <asp:TextBox ID="Password" runat="server" TextMode="Password"></asp:TextBox>
                                                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="La contraseña es obligatoria." ToolTip="La contraseña es obligatoria." ValidationGroup="logUsuario">*</asp:RequiredFieldValidator>
                                                                            </td>
                                                                        </tr>
                                                                        
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <br />
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
                                                                                <br />
                                                                                <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Aceptar" ValidationGroup="logUsuario" />
                                                                            </td>
                                                                        </tr>
                                                                        <tr>
                                                                            <td colspan="2">
                                                                                <br />
                                                                                <asp:HyperLink ID="PasswordRecoveryLink" runat="server" NavigateUrl="https://www.alfredoparedesyasociados.com/index.php/contactanos">Recuperar Contraseña</asp:HyperLink>
                                                                                <br />
                                                                            </td>

                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </LayoutTemplate>
                                                </asp:Login>
                                            </td>
                                        </tr>

                                    </table>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td style="text-align: center" class="auto-style5">
                                <br />
                                <br />
                                <dx:ASPxImage ID="imgCompers" runat="server" ClientInstanceName="imgCompers"
                                    ImageUrl="~/Images/Logos/Compers_SinFondo.png" Height="60px" Width="100px">
                                </dx:ASPxImage>
                                <dx:ASPxImage ID="imgNomina" runat="server" ClientInstanceName="imgNomina"
                                    ImageUrl="~/Images/Logos/Nomina_SinFondo.png" Height="60px" Width="100px">
                                </dx:ASPxImage>
                                <dx:ASPxImage ID="imgRHE" runat="server" ClientInstanceName="imgRHE"
                                    ImageUrl="~/Images/Logos/PHE_SinFondo.png" Height="60px" Width="140px">
                                </dx:ASPxImage>
                                <dx:ASPxImage ID="imgRHL" runat="server" ClientInstanceName="imgRHL"
                                    ImageUrl="~/Images/Logos/RHL_SinFondo.png" Height="60px" Width="140px">
                                </dx:ASPxImage>
                                <dx:ASPxImage ID="imgMRH" runat="server" ClientInstanceName="imgMRH"
                                    ImageUrl="~/Images/Logos/MRH_SinFondo.png" Height="60px" Width="140px">
                                </dx:ASPxImage>
                                <dx:ASPxImage ID="imgPsiconet" runat="server" ClientInstanceName="imgPsiconet"
                                    ImageUrl="~/Images/Logos/psiconet_SnFondo.png" Height="60px" Width="130px">
                                </dx:ASPxImage>
                                <br/>
                                <br/>
                                <tr>
                                    <td style="text-align: right" class="auto-style4">Copyright Alfredo Paredes y Asociados Cia. Ltda.<br/></td>
                                </tr>
                                <br/>
                            </td>
                        </tr>
                        
                    </table>
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
