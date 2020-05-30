using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using APATickets.LogicaDeNegocio;

namespace APATickets.Admin
{
    public partial class CambioClaveAdmin : System.Web.UI.Page
    {
        clsCambioClaveAdmin clsCambioClaveAdmin = new clsCambioClaveAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }

            txtClave.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtNuevaClave.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtRNuevaClave.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void btnActualizar_Click(object sender, EventArgs e)
        {
            String var = Session["RESP_CLAVE"].ToString();
            if (txtClave.Text == var)
            {
                if (txtNuevaClave.Text == txtRNuevaClave.Text)
                {
                    Session["nueva_clave"] = txtNuevaClave.Text;
                    clsCambioClaveAdmin.ActulizaClave();

                    string script = @"<script type='text/javascript'>
                                alert('Clave modificada correctamente.');
                            </script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

                    txtClave.Text = "";
                    txtNuevaClave.Text = "";
                    txtRNuevaClave.Text = "";
                }
                else
                {
                    string script = @"<script type='text/javascript'>
                                alert('Las claves nuevas no coinciden.');
                            </script>";

                    ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                }
            }
            else
            {
                string script = @"<script type='text/javascript'>
                                alert('La clave original está incorrecta.');
                            </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
            }

        }
    }
}