using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APATickets.Admin
{
    public partial class CerrarSesionAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            //Session.Contents.RemoveAll();  //  Cierra todas las variables de sesión
            Session.Contents.Remove("RESP_ID");
            Session.Contents.Remove("RESP_NOMBRE");
            Session.Contents.Remove("TIPO_ID");
            Session.Contents.Remove("RESP_CLAVE");
            

            Response.Redirect("LoginAdmin.aspx");
        }
    }
}