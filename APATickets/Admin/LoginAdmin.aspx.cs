using APATickets.LogicaDeNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;


namespace APATickets.Administrador
{
    public partial class LoginAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            clsCerrarTicketAuto clsCerrarTicketAuto = new clsCerrarTicketAuto();
            clsCerrarTicketAuto.MensajeAdvertencia();
        }

        protected void logAdminAutenticacion(object sender, AuthenticateEventArgs e)
        {
            if (clsLoginAdmin.Autenticar(logAdmin.UserName, logAdmin.Password))
            {
                //Response.Redirect("~/Admin/MenuAdmin.aspx");
                FormsAuthentication.RedirectFromLoginPage(logAdmin.UserName, logAdmin.RememberMeSet);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ConnectionString);
                DataSet DSdataset = new DataSet();
                conn.Open();
                SqlDataAdapter consulta = new SqlDataAdapter("SELECT RESP_ID, RESP_NOMBRE, RESP_STATUS, TIPO_ID, RESP_CLAVE FROM RESPONSABLE WHERE RESP_USUARIO='" + logAdmin.UserName + "'", conn);
                consulta.Fill(DSdataset, "Data");

                if (DSdataset.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < DSdataset.Tables[0].Rows.Count; i++)
                    {
                        DataRow campo = DSdataset.Tables["Data"].Rows[i];
                        Session["RESP_ID"] = campo["RESP_ID"];
                        Session["RESP_NOMBRE"] = campo["RESP_NOMBRE"].ToString();
                        Session["RESP_CLAVE"] = campo["RESP_CLAVE"].ToString();
                        Session["TIPO_ID"] = campo["TIPO_ID"];
                    }
                    Response.Redirect("~/Admin/TicketsAdmin.aspx");
                }
                conn.Close();
            }
        }

    }
}