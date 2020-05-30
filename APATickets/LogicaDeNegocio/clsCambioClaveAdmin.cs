using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace APATickets.LogicaDeNegocio
{
    public class clsCambioClaveAdmin
    {
        public void ActulizaClave()
        {
            string sql = @"UPDATE RESPONSABLE SET RESP_CLAVE='" + HttpContext.Current.Session["nueva_clave"] + "'" +
                        " WHERE RESP_ID=" + HttpContext.Current.Session["RESP_ID"];

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}