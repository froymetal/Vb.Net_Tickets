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
    public class clsCerrarTicketAuto
    {
        public void MensajeAdvertencia()
        {
            // Saco la fecha actual
            string fechaActual;
            fechaActual = DateTime.Today.ToString("d");

            //Select de los tickets que se hayan respondido y tienen mas de 3 dias de no tener respuesta
            string sql = @"SELECT TICKET.TIC_ID,TICKET.TIC_EMAIL,TICKET.TIC_FECHA_INICIO,TICKET_RESPUESTA.RSP_FECHA
                           FROM  TICKET_RESPUESTA INNER JOIN TICKET ON TICKET_RESPUESTA.TIC_ID = TICKET.TIC_ID
                           WHERE TICKET.TIC_STATUS = 'A'AND DATEADD(day, 3, TICKET_RESPUESTA.RSP_FECHA) < GETDATE()";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    while (dr.Read())
                    {
                        string email = Convert.ToString(dr["TIC_EMAIL"]);
                        string asunto = "asunto";
                        string mensaje = "Estimados Sres., <br><br>El ticket # " + Convert.ToString(dr["TIC_ID"]) + " generado el " + Convert.ToString(dr["TIC_FECHA_INICIO"]) + " ha sido respondido por nuestros consultores con fecha " + Convert.ToString(dr["RSP_FECHA"]) + " y no hemos tenido una respuesta aún." +
                                         "<br>Si la respuesta ha resuelto su inconveniente le solicitamos por favor cierre el ticket a través de su pantalla del sistema de soporte, caso contrario el ticket se cerrará automáticamente en dos días." +
                                         "<br><br><strong>Att. <br><br>Soporte Alfredo Paredes y ASociados.Cía. Ltda.</strong><br><br>";
                        
                        clsEmail clsEmail = new clsEmail();
                        clsEmail.Enviacorreo(email, asunto, mensaje); 
                        
                    }
                }

                conn.Close();
            }

        }

        public void CierreTicket()
        {
            // Saco la fecha actual
            string fechaActual;
            fechaActual = DateTime.Today.ToString("d");

            //Select de los tickets que se hayan respondido y tienen mas de 3 dias de no tener respuesta
            string sql = @"SELECT TICKET.TIC_ID,TICKET.TIC_EMAIL,TICKET.TIC_FECHA_INICIO,TICKET_RESPUESTA.RSP_FECHA
                           FROM  TICKET_RESPUESTA INNER JOIN TICKET ON TICKET_RESPUESTA.TIC_ID = TICKET.TIC_ID
                           WHERE TICKET.TIC_STATUS = 'A'AND DATEADD(day, 5, TICKET_RESPUESTA.RSP_FECHA) < GETDATE()";

            using (SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn.Open();

                SqlCommand cmd = new SqlCommand(sql, conn);
                SqlDataReader dr = cmd.ExecuteReader();

                if (dr.Read())
                {
                    while (dr.Read())
                    {
                        string email = Convert.ToString(dr["TIC_EMAIL"]);
                        string asunto = "asunto";
                        string mensaje = "Estimados Sres., <br><br>El ticket # " + Convert.ToString(dr["TIC_ID"]) + " generado el " + Convert.ToString(dr["TIC_FECHA_INICIO"]) + " ha sido respondido por nuestros consultores con fecha " + Convert.ToString(dr["RSP_FECHA"]) + " y no hemos tenido una respuesta aún." +
                                         "<br>Si la respuesta ha resuelto su inconveniente le solicitamos por favor cierre el ticket a través de su pantalla del sistema de soporte, caso contrario el ticket se cerrará automáticamente en dos días." +
                                         "<br><br><strong>Att. <br><br>Soporte Alfredo Paredes y ASociados.Cía. Ltda.</strong><br><br>";

                        clsEmail clsEmail = new clsEmail();
                        clsEmail.Enviacorreo(email, asunto, mensaje);

                    }
                }

                conn.Close();
            }

        }
    }
}