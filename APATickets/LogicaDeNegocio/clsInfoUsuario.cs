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
    public class clsInfoUsuario
    {
        public DataTable CargarInformacion()
        {
            //consulta a la base de datos
            string sql = @"SELECT CLIENTE.CLI_ID, CLIENTE.CLI_EMPRESA, CLIENTE.CLI_DIRECCION, CLIENTE.CLI_TELEFONO, CLIENTE.CLI_USUARIO, CLIENTE.CLI_CLAVE, CLIENTE.CLI_CONTACTO, CLIENTE.CLI_CELULAR, CLIENTE.CLI_EMAIL, CLIENTE.CLI_CIUDAD, PAIS.PA_NOMBRE, CLIENTE.PA_ID 
                       FROM CLIENTE LEFT OUTER JOIN PAIS ON CLIENTE.PA_ID = PAIS.PA_ID 
                       WHERE CLIENTE.CLI_ID = " + HttpContext.Current.Session["ID_USUARIO"];

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

            public void ModificarUsuario()
        {

            string sql = @"UPDATE CLIENTE SET CLI_DIRECCION='" + HttpContext.Current.Session["direccion"] + "' ,CLI_TELEFONO='" + HttpContext.Current.Session["telf"] + "' ,PA_ID='" + HttpContext.Current.Session["pais"] + "' ,CLI_CIUDAD='" + HttpContext.Current.Session["ciudad"] + "' ,CLI_CONTACTO='" + HttpContext.Current.Session["contacto"] + "' ,CLI_CELULAR='" + HttpContext.Current.Session["celular"] + "' ,CLI_EMAIL='" + HttpContext.Current.Session["email"] + "' ,CLI_USUARIO='" + HttpContext.Current.Session["usuario"] + "' ,CLI_CLAVE='" + HttpContext.Current.Session["clave"] + "'" +
            " WHERE CLI_ID=" + HttpContext.Current.Session["ID_USUARIO"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }
        
    }
}