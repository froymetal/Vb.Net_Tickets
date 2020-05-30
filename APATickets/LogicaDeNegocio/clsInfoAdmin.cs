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

namespace APATickets.LogicaDeNegocio
{
    public class clsInfoAdmin
    {
        public DataTable CargarInformacionAmin()
        {
            //consulta a la base de datos
            string sql = @"SELECT RESPONSABLE.RESP_ID, RESPONSABLE.RESP_NOMBRE, RESPONSABLE.RESP_CARGO, RESPONSABLE.RESP_EMAIL, RESPONSABLE.TIPO_ID, TIPO_RESPONSABLE.TIPO_DETALLE
                       FROM RESPONSABLE, TIPO_RESPONSABLE 
                       WHERE RESPONSABLE.TIPO_ID = TIPO_RESPONSABLE.TIPO_ID
                       AND RESPONSABLE.RESP_ID = " + HttpContext.Current.Session["RESP_ID"];

            SqlDataAdapter variable;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();//abrimos conexion

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                variable = new SqlDataAdapter(cmd);
                DataTable variable2 = new DataTable();

                variable.Fill(variable2);
                conn.Close();
                return variable2;
            }
        }

        public void ModificarAdmin()
        {

            string sql = @"UPDATE RESPONSABLE SET RESP_NOMBRE='" + HttpContext.Current.Session["nombre"] + "' ,RESP_CARGO='" + HttpContext.Current.Session["cargo"] + "' ,TIPO_ID=" + HttpContext.Current.Session["tipo"] + " ,RESP_EMAIL='" + HttpContext.Current.Session["email"] + "'"+
            " WHERE RESP_ID=" + HttpContext.Current.Session["RESP_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}