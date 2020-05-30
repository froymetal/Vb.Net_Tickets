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
    public class clsAsignacionResponsablesAdmin
    {
        public void AsignarResponsable()
        {
            string sql = @"UPDATE TICKET SET RESP_ID=" + HttpContext.Current.Session["responsable_id"] +
                           " WHERE TIC_ID = " + HttpContext.Current.Session["TIC_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void ReasignarResponsable()
        {
            string sql = @"UPDATE TICKET SET RESP_ID=" + HttpContext.Current.Session["responsable_id"] +
                           " WHERE TIC_ID = " + HttpContext.Current.Session["TIC_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable DetallesTicketResponsable(int id_ticket)
        {
            // Con el ID del registro ingresado recupero otra información


            string sql = @"SELECT RESPONSABLE.RESP_NOMBRE, RESPONSABLE.RESP_EMAIL, INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE
                           FROM TICKET INNER JOIN RESPONSABLE ON TICKET.RESP_ID = RESPONSABLE.RESP_ID INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID
                           WHERE TICKET.TIC_ID = " + id_ticket;

            SqlDataAdapter dap;

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();//abrimos conexion

                SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

                dap = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                dap.Fill(dt);
                conn.Close();
                return dt;
            }

        }
    }
}