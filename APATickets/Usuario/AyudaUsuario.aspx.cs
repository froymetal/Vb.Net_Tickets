using APATickets.LogicaDeNegocio;
using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APATickets.Usuario
{
    public partial class AyudaUsuario : System.Web.UI.Page
    {
        clsAyudaUsuario clsAyudaUsuario = new clsAyudaUsuario();
        DataTable dtSoftware = new DataTable();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["ID_USUARIO"] == null)
            {
                Response.Redirect("LoginUsuario.aspx");
            }

            Usuario65.Visible = false;
            InstalacionCliente65.Visible = false;
            InstalacionServidor65.Visible = false;
            Usuario7.Visible = false;
            UsuarioPsiconet.Visible = false;
            UsuarioNomina65.Visible = false;
            UsuarioPsiconet.Visible = true;
            UsuarioRHL.Visible = false;
            EmpresaRHL.Visible = false;
            UsuarioMRH.Visible = false;
            UsuarioRHE.Visible = false;
            EmpresaRHE.Visible = false;


            dtSoftware = clsAyudaUsuario.RecuperaSoftware();

            int contador = dtSoftware.Rows.Count;
            if (contador > 0)
            {
                for (int i = 0; i <= contador - 1; i++)
                {
                    switch (dtSoftware.Rows[i]["SOFT_ID"].ToString() )
                    {
                        case "1":
                            UsuarioNomina65.Visible = true;
                            break;
                        case "2":
                            UsuarioRHE.Visible = true;
                            EmpresaRHE.Visible = true;
                            break;
                        case "3":
                            UsuarioRHL.Visible = true;
                            EmpresaRHL.Visible = true;
                            break;
                        case "4":
                            UsuarioMRH.Visible = true;
                            break;
                        case "5": 
                            Usuario65.Visible = true;
                            InstalacionCliente65.Visible = true;
                            InstalacionServidor65.Visible = true;
                            break;
                        case "6":
                            Usuario7.Visible = true;
                            break;
                        default:
                            break;
                    }
                }
            }

            
        }
    }
}