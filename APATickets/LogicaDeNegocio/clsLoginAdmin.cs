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
    public class clsLoginAdmin
    {
        public static bool Autenticar(string usuario, string clave)
        {
            //consulta a la base de datos
            string sql = @"SELECT COUNT(*)
                          FROM RESPONSABLE
                          WHERE RESP_USUARIO = @user AND RESP_CLAVE = @pass";
            //cadena conexion
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();//abrimos conexion

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
                cmd.Parameters.AddWithValue("@pass", clave);

                int count = Convert.ToInt32(cmd.ExecuteScalar()); //devuelve la fila afectada
                
                conn.Close();

                if (count == 0)
                    return false;
                else
                    return true;
            }
        }

        public bool TipoAdministrador(string usuario)
        {
            string sql = "SELECT TIPO_ID FROM RESPONSABLE WHERE RESP_USUARIO= @user";
            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();//abrimos conexion

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                cmd.Parameters.AddWithValue("@user", usuario); //enviamos los parametros
                conn.Close();
                return true;
                
            }
        }
    }
}