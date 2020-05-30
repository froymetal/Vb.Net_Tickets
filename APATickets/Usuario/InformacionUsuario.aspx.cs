using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using APATickets.LogicaDeNegocio;

namespace APATickets.Usuario
{
    public partial class InformacionUsuario : System.Web.UI.Page
    {
        public int id_usuario;
        public clsInfoUsuario clsInfoUsuario  = new clsInfoUsuario();
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_USUARIO"] != null)
            {
                id_usuario = Convert.ToInt32(Session["ID_USUARIO"]);
            }
            else
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            if (Page.IsPostBack == false)
            {
            DataTable dtInfo = clsInfoUsuario.CargarInformacion();

            //Cargo la informacion en los objetos del formulario
            //Datos Generales
            txtEmpresa.Text = dtInfo.Rows[0]["CLI_EMPRESA"].ToString();
            txtDireccion.Text = dtInfo.Rows[0]["CLI_DIRECCION"].ToString();
            txtTelf.Text  = dtInfo.Rows[0]["CLI_TELEFONO"].ToString();
            txtCiudad.Text = dtInfo.Rows[0]["CLI_CIUDAD"].ToString();
            cmbPais.Text = dtInfo.Rows[0]["PA_NOMBRE"].ToString();
            cmbPais.Value = dtInfo.Rows[0]["PA_ID"].ToString();
            //Datos del contacto
            txtContacto.Text = dtInfo.Rows[0]["CLI_CONTACTO"].ToString();
            txtCelular.Text = dtInfo.Rows[0]["CLI_CELULAR"].ToString();
            txtEmail.Text = dtInfo.Rows[0]["CLI_EMAIL"].ToString();
            //Datos de la cuenta
            txtUsuario.Text = dtInfo.Rows[0]["CLI_USUARIO"].ToString();
            txtPass.Text = dtInfo.Rows[0]["CLI_CLAVE"].ToString();

            //Validaciones de cajas de texto con js
            txtDireccion.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtTelf.Attributes.Add("onkeypress", "return SoloNumeros(event);");
            txtCiudad.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtContacto.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtCelular.Attributes.Add("onkeypress", "return SoloNumeros(event);");
            txtEmail.Attributes.Add("onkeypress", "return SoloEmail(event);");
            txtUsuario.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            txtPass.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            }
        }
     
        protected void btnAcualizar_Click(object sender, EventArgs e)
        {
            //Datos Generales
            Session["direccion"] = txtDireccion.Text;
            Session["telf"] = txtTelf.Text;
            Session["ciudad"] = txtCiudad.Text;
            Session["pais"] = cmbPais.Value;
            //Datos del contacto
            Session["contacto"] = txtContacto.Text;
            Session["celular"] = txtCelular.Text;
            Session["email"] = txtEmail.Text;
            //Datos de la cuenta
            Session["usuario"] = txtUsuario.Text;
            Session["clave"] = txtPass.Text;

            clsInfoUsuario.ModificarUsuario();
        }
    }
}