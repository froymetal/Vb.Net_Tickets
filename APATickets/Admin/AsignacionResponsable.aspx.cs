using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using APATickets.LogicaDeNegocio;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView.Rendering;
using DevExpress.Web.ASPxPopupControl;
using System.Data;

namespace APATickets.Admin
{
    public partial class AsignacionResponsable : System.Web.UI.Page
    {
        clsAsignacionResponsablesAdmin clsAsignacionResponsablesAdmin = new clsAsignacionResponsablesAdmin();
        clsEmail clsEmail = new clsEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }

            if (Convert.ToInt32(Session["TIPO_ID"]) != 1)
            {
                string script = @"<script type='text/javascript'>
                                alert('Usted no tiene permisos para utilizar esta opción.');
                            </script>";

                ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
                
                Response.Redirect("TicketsAdmin.aspx");
            }
        }

        protected void GrdVwResponsablesAdmin_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            GridViewHtmlEditFormPopupContainer container;
            container = (GridViewHtmlEditFormPopupContainer)e.EditForm;
            ASPxPopupControl popup;
            popup = (ASPxPopupControl)container.NamingContainer;

            popup.HeaderStyle.BackgroundImage.ImageUrl = "~/Images/fondo_ladrillo.jpg";
        }

        protected void GrdVwResponsablesAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["TIC_ID"] = e.EditingKeyValue;
        }

        protected void GrdVwResponsablesAdmin_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Session["responsable_id"] = e.NewValues["RESP_ID"];
            clsAsignacionResponsablesAdmin.AsignarResponsable();
            
            GrdVwResponsablesAdmin.CancelEdit();
            e.Cancel = true;

            int id_ticket = Convert.ToInt32(Session["TIC_ID"]);
            DataTable dtInfo = clsAsignacionResponsablesAdmin.DetallesTicketResponsable(id_ticket);

            //LLamamos a la Funcion para enviar correo a software indicando el usuario asignado al ticket
            string email = dtInfo.Rows[0]["RESP_EMAIL"].ToString();
            string asunto = "Asignación del ticket # " + Session["TIC_ID"];
            string mensaje = @"<br>El ticket # " + Session["TIC_ID"] + " ha sido asignado al usuario " + dtInfo.Rows[0]["RESP_NOMBRE"].ToString() + "<br><br>" +
                               "Inconveniente : " + dtInfo.Rows[0]["INC_DETALLE"].ToString() +
                               "<br>Detalle : " + dtInfo.Rows[0]["RSP_DETALLE"].ToString() +
                               "<br><br>Ingrese a la aplicación por favor. <br>";
            clsEmail.Enviacorreo(email, asunto, mensaje);

            String script = @"<script type='text/javascript'>
                                alert('El ticket ha sido asignado correctamente.');
                            </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);
        }

        protected void ASPxGridView1_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["TIC_ID"] = e.EditingKeyValue;
        }

        protected void ASPxGridView1_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Session["responsable_id"] = e.NewValues["RESP_ID"];
            clsAsignacionResponsablesAdmin.ReasignarResponsable();
            ASPxGridView1.CancelEdit();
            e.Cancel = true;

            String script = @"<script type='text/javascript'>
                                alert('El ticket ha sido reasignado correctamente.');
                            </script>";

            ScriptManager.RegisterStartupScript(this, typeof(Page), "alerta", script, false);

        }

       
    }
}