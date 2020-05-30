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
    public class clsGestionAdmin
    {
        public void ModificarAdmin()
        {
            string sql = @"UPDATE RESPONSABLE SET RESP_NOMBRE='" + HttpContext.Current.Session["resp_nombre"] + "',RESP_CARGO='" + HttpContext.Current.Session["resp_cargo"] + "',RESP_USUARIO='" + HttpContext.Current.Session["resp_usuario"] + "',RESP_CLAVE='" + HttpContext.Current.Session["resp_clave"] + "',RESP_EMAIL='" + HttpContext.Current.Session["resp_email"] + "',TIPO_ID=" + HttpContext.Current.Session["tipo_admin"] +
                        " WHERE RESP_ID=" + HttpContext.Current.Session["RESP_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void InsertarAdmin()
        {
            string sql = @"INSERT INTO RESPONSABLE(RESP_NOMBRE,RESP_CARGO,RESP_STATUS,TIPO_ID,RESP_USUARIO,RESP_CLAVE,RESP_EMAIL) 
            VALUES('" + HttpContext.Current.Session["resp_nombre"] + "','" + HttpContext.Current.Session["resp_cargo"] + "','A'," + HttpContext.Current.Session["tipo_admin"] + ",'" + HttpContext.Current.Session["resp_usuario"] + "','" + HttpContext.Current.Session["resp_clave"] + "','" + HttpContext.Current.Session["resp_email"] + "')";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

        }

        public void EliminarAdmin()
        {

            string sql = @"UPDATE RESPONSABLE SET RESP_STATUS='E' WHERE RESP_ID=" + HttpContext.Current.Session["RESP_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }
    }
}