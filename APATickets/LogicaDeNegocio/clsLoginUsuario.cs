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
    public class clsLoginUsuario
    {
        //Valida si el usuario existe
        public static bool Autenticar(string usuario, string clave)
        {
            //consulta a la base de datos
            string sql = @"SELECT COUNT(*)
                          FROM CLIENTE C, CLIENTE_SOFTWARE CS
                          WHERE C.CLI_STATUS='A' AND C.CLI_USUARIO = @user AND C.CLI_CLAVE = @pass AND CS.CS_FECHA_FIN >='" + DateTime.Today.Date + "'";
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
                {
                    return false;
                }
                else
                {
                    return true;
                }
            }
        }
    }
}