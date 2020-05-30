using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;

namespace APATickets.LogicaDeNegocio
{
    public class clsAyudaUsuario
    {
        public DataTable  RecuperaSoftware()
        {
            string sql = @"SELECT SOFT_ID FROM CLIENTE_SOFTWARE WHERE CLI_ID=" + HttpContext.Current.Session["ID_USUARIO"];

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                DataTable dtSoftware = new DataTable();
                dtSoftware.Load(dr);
                conn.Close();
                return dtSoftware;
            }
        }
    }
}