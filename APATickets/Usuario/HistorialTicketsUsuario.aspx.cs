using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APATickets.Usuario
{
    public partial class HistorialTicketsUsuario : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_USUARIO"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            GrdVwTicketsU.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void bntExportarExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();
        }
    }
}