using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APATickets.Usuario
{
    public partial class CerrarSesionesUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //Session.Contents.RemoveAll();  //  Cierra todas las variables de sesión
            Session.Contents.Remove("ID_USUARIO");
            Session.Contents.Remove("NOMBRE_USUARIO");
            Session.Contents.Remove("CLI_HORAS_SOPORTE");
            Response.Redirect("LoginUsuario.aspx");
        }
    }
}