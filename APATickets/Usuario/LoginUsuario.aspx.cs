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

namespace APATickets.LoginUsuario
{
    public partial class LoginUsuario : System.Web.UI.Page
    {

        protected void Login1_Authenticate1(object sender, AuthenticateEventArgs e)
        {
            if (clsLoginUsuario.Autenticar(logUsuario.UserName, logUsuario.Password))
            {
                FormsAuthentication.RedirectFromLoginPage(logUsuario.UserName, logUsuario.RememberMeSet);

                SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ConnectionString);
                DataSet DSdataset = new DataSet();
                conn.Open();
                SqlDataAdapter consulta = new SqlDataAdapter("SELECT C.CLI_ID, C.CLI_EMPRESA, SUM(CS.CS_NUM_HORAS) AS SUMA FROM CLIENTE C, CLIENTE_SOFTWARE CS WHERE C.CLI_ID = CS.CLI_ID AND C.CLI_USUARIO='" + logUsuario.UserName + "' AND C.CLI_STATUS='A' GROUP BY C.CLI_ID, C.CLI_EMPRESA", conn);
                consulta.Fill(DSdataset, "Data");

                if (DSdataset.Tables[0].Rows.Count > 0)
                {
                    for (int i = 0; i < DSdataset.Tables[0].Rows.Count; i++)
                    {
                        DataRow campo = DSdataset.Tables["Data"].Rows[i];
                        Session["ID_USUARIO"] = campo["CLI_ID"].ToString();
                        Session["NOMBRE_USUARIO"] = campo["CLI_EMPRESA"].ToString();
                        Session["HORAS_SOPORTE_USUARIO"] = campo["SUMA"].ToString();
                    }
                }
                conn.Close();
            }
        }
    }
}