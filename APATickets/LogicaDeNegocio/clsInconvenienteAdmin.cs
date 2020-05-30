using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Text;
using DevExpress.Web.ASPxEditors;
using System.Security.Cryptography;
using System.Data.SqlClient;
using System.Configuration;
using APATickets.LogicaDeNegocio;

namespace APATickets.LogicaDeNegocio
{
    public class clsInconvenienteAdmin
    {
        public void InsertarInconveniente()
        {
            string sql = @"INSERT INTO INCONVENIENTE(SOFT_ID,INC_DETALLE,NIV_ID) 
            VALUES(" + HttpContext.Current.Session["soft_id"] + ",'" + HttpContext.Current.Session["inc_detalle"] + "'," + HttpContext.Current.Session["niv_id"] + ")";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

        }
    }
}