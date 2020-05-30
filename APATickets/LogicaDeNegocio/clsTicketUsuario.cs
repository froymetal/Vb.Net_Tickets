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
    public class clsTicketUsuario
    {
        public int UltimoRegistro;
        public string Tipo_nivel;
        public string Tiempo_nivel;


        public void InsertarTicket()
        {
            string fechaActual;
            fechaActual = DateTime.Today.ToString("d");

            string sql = @"INSERT INTO TICKET(CLI_ID,INC_ID,TIC_PERSONA,TIC_CARGO,TIC_EMAIL,TIC_STATUS,TIC_FECHA_INICIO) 
            VALUES(" + HttpContext.Current.Session["cli_id"] + "," + HttpContext.Current.Session["inc_id"] + ",'" + HttpContext.Current.Session["tic_persona"] + "','" + HttpContext.Current.Session["tic_cargo"] + "','" + HttpContext.Current.Session["tic_email"] 
                     + "','A','" + fechaActual + "')";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());
            
            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

            

            using (cmd = new SqlCommand("SELECT IDENT_CURRENT('TICKET')",conn))
            {
                UltimoRegistro = Convert.ToInt32(cmd.ExecuteScalar());
            }

            conn.Close();

            

       }

        public DataTable DetallesTicketNuevo(int id_ticket)
        {
            // Con el ID del registro ingresado recupero otra información


            string sql = @"SELECT INCONVENIENTE.INC_DETALLE, TICKET_RESPUESTA.RSP_DETALLE, SOFTWARE.SOFT_NOMBRE, NIVEL_INCONVENIENTE.NIV_DETALLE, NIVEL_INCONVENIENTE.NIV_TIEMPO, TICKET.TIC_EMAIL, TICKET.TIC_FECHA_INICIO, TICKET.TIC_HORAS_DESCONTAR
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

        public void InsertarTicketDetalle()
        {

            string sql = @"INSERT INTO TICKET_RESPUESTA(TIC_ID,RSP_DETALLE,RSP_BANDERA) 
            VALUES(" + UltimoRegistro + ",'" + HttpContext.Current.Session["rsp_detalle"] + "',0)";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());
            conn.Open();//abrimos conexion
            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
                      
            string sql1 = @"SELECT NIVEL_INCONVENIENTE.NIV_TIEMPO_DSCTO
                            FROM TICKET INNER JOIN INCONVENIENTE ON TICKET.INC_ID = INCONVENIENTE.INC_ID INNER JOIN NIVEL_INCONVENIENTE ON INCONVENIENTE.NIV_ID = NIVEL_INCONVENIENTE.NIV_ID
                            WHERE TICKET.TIC_ID = " + UltimoRegistro;
            using (SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn1.Open();

                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                SqlDataReader dr = cmd1.ExecuteReader();

                if (dr.Read())
                {
                    string sql2 = "UPDATE TICKET SET TIC_HORAS_DESCONTAR=" + Convert.ToString(dr["NIV_TIEMPO_DSCTO"]) + " WHERE TIC_ID=" + UltimoRegistro;
                    //Console.WriteLine(Convert.ToString(dr["nombrecampo"]));
                    SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());
                    SqlCommand cmd2 = new SqlCommand(sql2, conn2); //ejecutamos la instruccion
                    conn2.Open();//abrimos conexion
                    cmd2.ExecuteNonQuery();
                    conn2.Close();
                }

                conn1.Close();
            }
            
            
        }

        public void ModificarTicket()
        {
            string sql = @"UPDATE TICKET_RESPUESTA SET RSP_DETALLE='" + " \n --------------------------------------------------- \n\n " + 
                         HttpContext.Current.Session["rsp_detalle"] + "'" +
                        " WHERE TIC_ID=" + HttpContext.Current.Session["TIC_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void CerrarTicket()
        {
            string fechaActual;
            fechaActual = DateTime.Today.ToString("d");

            string sql = @"UPDATE TICKET SET TIC_STATUS='C', TIC_FECHA_CIERRE='" + fechaActual  + "' WHERE TIC_ID=" + HttpContext.Current.Session["TIC_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
            
        }

        public void ActualizarHorasSoporte()
        {
            string sql1 = @"SELECT RSP_BANDERA FROM TICKET_RESPUESTA WHERE TIC_ID= " + HttpContext.Current.Session["TIC_ID"];
            using (SqlConnection conn1 = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString()))
            {
                conn1.Open();

                SqlCommand cmd1 = new SqlCommand(sql1, conn1);
                SqlDataReader dr = cmd1.ExecuteReader();

                if (dr.Read())
                {
                    int bandera = Convert.ToInt32(dr["RSP_BANDERA"]);
                    if (bandera == 1)
                    {
                        if (HttpContext.Current.Session["tic_tiempo_descuento"] == null)
                            HttpContext.Current.Session["tic_tiempo_descuento"] = 0;

                        double horas_actual = Convert.ToDouble(HttpContext.Current.Session["horas_soporte"]);
                        double horas_tomadas = Convert.ToDouble(HttpContext.Current.Session["tic_tiempo_descuento"]);
                        double tiempo_restante_soporte = (horas_actual - horas_tomadas);

                        string sql = @"UPDATE CLIENTE_SOFTWARE SET CS_NUM_HORAS=" + tiempo_restante_soporte + " WHERE CLI_ID=" + HttpContext.Current.Session["cli_id"] + " AND SOFT_ID=" + HttpContext.Current.Session["soft_id"];
                        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

                        conn.Open();//abrimos conexion

                        SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                        cmd.ExecuteNonQuery();
                        conn.Close();
                    }
                    else
                    {
                        string sql2 = "UPDATE TICKET SET TIC_HORAS_DESCONTAR=0 WHERE TIC_ID=" + HttpContext.Current.Session["TIC_ID"];
                        //Console.WriteLine(Convert.ToString(dr["nombrecampo"]));
                        SqlConnection conn2 = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());
                        SqlCommand cmd2 = new SqlCommand(sql2, conn2); //ejecutamos la instruccion
                        conn2.Open();//abrimos conexion
                        cmd2.ExecuteNonQuery();
                        conn2.Close();
                    }
                    
                }
                conn1.Close();
            }

        }
           
    }
}