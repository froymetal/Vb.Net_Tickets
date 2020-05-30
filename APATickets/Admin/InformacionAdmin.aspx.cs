using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using APATickets.LogicaDeNegocio;

namespace APATickets.Admin
{
    public partial class InformacionAdmin : System.Web.UI.Page
    {
        public int id_admin;
        public clsInfoAdmin clsInfoAdmin = new clsInfoAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {

            //Valida si está activa la sesión
            if (Session["RESP_ID"] != null)
            {
                id_admin = Convert.ToInt32(Session["RESP_ID"]);
            }
            else
            {
                Response.Redirect("LoginAdmin.aspx");
            }
            //Valida si es usuario Administrador
            if (Convert.ToInt32(Session["TIPO_ID"]) != 1)
            {
                cmbTipo.Enabled = false;
            }

            if (Page.IsPostBack == false)
            {
                DataTable dtInfo = clsInfoAdmin.CargarInformacionAmin();

                //Cargo la informacion en los objetos del formulario
                //Datos Generales
                txtNombre.Text = dtInfo.Rows[0]["RESP_NOMBRE"].ToString();
                txtCargo.Text = dtInfo.Rows[0]["RESP_CARGO"].ToString();
                cmbTipo.Text = dtInfo.Rows[0]["TIPO_DETALLE"].ToString();
                cmbTipo.Value = dtInfo.Rows[0]["TIPO_ID"].ToString();
                txtEmail.Text = dtInfo.Rows[0]["RESP_EMAIL"].ToString();

                txtNombre.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
                txtCargo.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
                txtEmail.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            }
        }

        protected void btnAcualizarAdmin_Click(object sender, EventArgs e)
        {
//            if (Convert.ToInt32(Session["TIPO_ID"]) != 1)
//            {

//                string script = @"<script type='text/javascript'>
//                                alert('Usted no tiene permisos para modificar esta información.');
//                            </script>";

//                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

//                Response.Redirect("InformacionAdmin.aspx");
//            }
//            else
//            {
                //Datos Generales
                Session["nombre"] = txtNombre.Text;
                Session["cargo"] = txtCargo.Text;
                Session["email"] = txtEmail.Text;
                Session["tipo"] = cmbTipo.Value;

                clsInfoAdmin.ModificarAdmin();

                //clsEnviaCorreo.Enviacorreo();
//            }
        }
    }
}