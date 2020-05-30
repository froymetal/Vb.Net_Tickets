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
    public class clsTicketAdmin
    {
        public void ModificarTicketAdmin()
        {
            string cabecera;
            string fechaActual;
            fechaActual = DateTime.Today.ToString("d");

            cabecera = "\n\n ---------------------------------------------------- \nSoporte Alfredo Paredes & Asociados <" + fechaActual + "> \n\n";
            //pie = " \n\n Saludos cordiales. \n ---------------------------------------------------- \n";
            
            string sql = @"UPDATE TICKET_RESPUESTA SET RSP_DETALLE='" + cabecera + HttpContext.Current.Session["rsp_detalle"] + "',RSP_FECHA='" + fechaActual + "',RSP_BANDERA=1" +
            " WHERE TIC_ID=" + HttpContext.Current.Session["TIC_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();

            

        }
        
        public void ModificarNivelComplejidad()
        {
            string sql1 = @"SELECT NIV_TIEMPO_DSCTO FROM NIVEL_INCONVENIENTE WHERE NIV_DETALLE='" + HttpContext.Current.Session["nivel_det"] + "'";
            using (SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn1.Open();

                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                SqlDataReader dr = cmd1.ExecuteReader();

                if (dr.Read())
                {
                    string sql = @"UPDATE TICKET SET TIC_NIVEL_COMPLEJIDAD='" + HttpContext.Current.Session["nivel_det"] + "', TIC_HORAS_DESCONTAR=" + Convert.ToString(dr["NIV_TIEMPO_DSCTO"]) +
                                  " WHERE TIC_ID=" + HttpContext.Current.Session["TIC_ID"];

                    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

                    conn.Open();//abrimos conexion

                    SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                    cmd.ExecuteNonQuery();
                    conn.Close();
                }
                conn1.Close();
            }

            
        }

        public void ActulizaHorasSoporte()
        {
            double horas_actual = Convert.ToDouble(HttpContext.Current.Session["cli_horas_soporte"]);
            double horas_tomadas = Convert.ToDouble(HttpContext.Current.Session["tiempo"]);
            double tiempo_restante_soporte = (horas_actual - horas_tomadas);

            string sql = @"UPDATE CLIENTE SET CLI_HORAS_SOPORTE=" + tiempo_restante_soporte +
            " WHERE CLI_ID=" + HttpContext.Current.Session["cli_id"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public DataTable DetallesTicket(int id_ticket)
        {
            // Con el ID del registro ingresado recupero otra información

            string sql = @"SELECT INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, SOFTWARE.SOFT_NOMBRE, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO, TICKET.TIC_EMAIL, TICKET.TIC_FECHA_INICIO
                         FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID INNER JOIN SOFTWARE ON INCONVENIENTE.SOFT_ID = SOFTWARE.SOFT_ID INNER JOIN TICKET_RESPUESTA ON TICKET.TIC_ID = TICKET_RESPUESTA.TIC_ID
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