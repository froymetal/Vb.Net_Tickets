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
using DevExpress.Web.ASPxGridView;

namespace APATickets.LogicaDeNegocio
{
    public class clsClientesAdmin
    {
        public void InsertarCliente()
        {

            string sql = @"INSERT INTO CLIENTE(CLI_EMPRESA,CLI_DIRECCION,CLI_TELEFONO,CLI_USUARIO,CLI_CLAVE,CLI_STATUS,PA_ID,CLI_CIUDAD,CLI_CONTACTO,CLI_CELULAR,CLI_EMAIL) 
            VALUES('" + HttpContext.Current.Session["cli_empresa"] + "','" + HttpContext.Current.Session["cli_direccion"] + "','" + HttpContext.Current.Session["cli_telefono"] + "','" + HttpContext.Current.Session["cli_usuario"] + "','" + HttpContext.Current.Session["cli_clave"]
                     + "','A'," + HttpContext.Current.Session["pa_id"] + ",'" + HttpContext.Current.Session["cli_ciudad"] + "','" + HttpContext.Current.Session["cli_contacto"] + "','" + HttpContext.Current.Session["cli_celular"] + "','" + HttpContext.Current.Session["cli_email"] + "')";
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

            conn.Close();
        }

        public void ModificarCliente()
        {
            string sql = @"UPDATE CLIENTE SET CLI_DIRECCION='" + HttpContext.Current.Session["cli_direccion"] + "',CLI_TELEFONO='" + HttpContext.Current.Session["cli_telefono"] + "' ,CLI_USUARIO='" + HttpContext.Current.Session["cli_usuario"] + "' ,CLI_CLAVE='" + HttpContext.Current.Session["cli_clave"] + "' ,PA_ID=" + HttpContext.Current.Session["pa_id"]  + " ,CLI_CONTACTO='" + HttpContext.Current.Session["cli_contacto"] + "' ,CLI_CELULAR='" + HttpContext.Current.Session["cli_celular"] + "' ,CLI_EMAIL='" + HttpContext.Current.Session["cli_email"] + "' ,CLI_CIUDAD='" + HttpContext.Current.Session["cli_ciudad"]  +
            "' WHERE CLI_ID=" + HttpContext.Current.Session["CLI_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void EliminarCliente()
        {
            
            string sql = @"UPDATE CLIENTE SET CLI_STATUS='E' WHERE CLI_ID=" + HttpContext.Current.Session["CLI_ID"];
            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();
            conn.Close();
        }

        public void GuardarSoftware(ASPxGridView GrdVwClientesSoftAdmin)
        {
            string sql = @"DELETE FROM CLIENTE_SOFTWARE WHERE CLI_ID = " + HttpContext.Current.Session["Cliente"] + " ";  

             SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

            int CantidadFilas = GrdVwClientesSoftAdmin.VisibleRowCount;

            for (int i = 0; i <= CantidadFilas - 1; i++)
			{
			    if (GrdVwClientesSoftAdmin.Selection.IsRowSelected(i))
                {
                    sql = @"INSERT INTO CLIENTE_SOFTWARE(CLI_ID, SOFT_ID)
                            VALUES( " + HttpContext.Current.Session["Cliente"] + 
                                     ", " + GrdVwClientesSoftAdmin.GetRowValues(i,"SOFT_ID") + ")";

                    cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
                    cmd.ExecuteNonQuery();
                }
			}
            
            conn.Close();
           
        }

        public void RecuperarSoftware(ASPxGridView GrdVwClientesSoftAdmin)
        {
            string sql = @"SELECT SOFT_ID FROM CLIENTE_SOFTWARE WHERE CLI_ID = " + HttpContext.Current.Session["Cliente"] + " ";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion

            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion

            SqlDataAdapter sqlAdapter = new SqlDataAdapter(cmd);
            DataTable dtSave = new DataTable();

            sqlAdapter.Fill(dtSave);
            GrdVwClientesSoftAdmin.Selection.UnselectAll();

            if (dtSave.Rows.Count > 0)
            {
                int CantidadSoft = dtSave.Rows.Count;
                //int CantidadFilas = GrdVwClientesSoftAdmin.VisibleRowCount;
                for (int i = 0; i <= CantidadSoft - 1; i++)
                {
                    GrdVwClientesSoftAdmin.Selection.SelectRowByKey(dtSave.Rows[i]["SOFT_ID"]);
                }
            }
            
            conn.Close();
        }

        public void ActualizarDatosSoftware(DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            string sql = @"UPDATE CLIENTE_SOFTWARE SET CS_FECHA_INI = '" + e.NewValues["FECHA_INICIO"] + "' " +
                        ", CS_FECHA_FIN = '" + e.NewValues["FECHA_FIN"] + "' " +
                        ", CS_NUM_HORAS = " + e.NewValues["NUM_HORAS"] + " " +
                        "WHERE CLI_ID = " + HttpContext.Current.Session["Cliente"] +
                        " AND SOFT_ID = " + HttpContext.Current.Session["Software"] + " ";

            SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["ticketsConnectionString"].ToString());

            conn.Open();//abrimos conexion
            SqlCommand cmd = new SqlCommand(sql, conn); //ejecutamos la instruccion
            cmd.ExecuteNonQuery();

            conn.Close();
        }
    }
}