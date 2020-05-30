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
    public partial class TicketsAdmin : System.Web.UI.Page
    {
        clsTicketAdmin clsTicketAdmin = new clsTicketAdmin();
        clsEmail clsEmail = new clsEmail();
        public int id_ticket;

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }

            GrdVwTicketsAdmin.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void GrdVwTicketsAdmin_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            GridViewHtmlEditFormPopupContainer container;
            container = (GridViewHtmlEditFormPopupContainer)e.EditForm;
            ASPxPopupControl popup;
            popup = (ASPxPopupControl)container.NamingContainer;

            popup.HeaderStyle.BackgroundImage.ImageUrl = "~/Images/fondo_ladrillo.jpg";
        }

        protected void GrdVwTicketsAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["TIC_ID"] = e.EditingKeyValue;
            Session["CLI_ID"] = GrdVwTicketsAdmin.GetRowValuesByKeyValue(e.EditingKeyValue, "CLI_ID");
            Session["soft_id"] = GrdVwTicketsAdmin.GetRowValuesByKeyValue(e.EditingKeyValue, "SOFT_ID");
        }

        protected void GrdVwTicketsAdmin_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            
            Session["soft_id"] = e.NewValues["SOFT_ID"];
            Session["inc_id"] = e.NewValues["INC_ID"];
            Session["tic_persona"] = e.NewValues["TIC_PERSONA"];
            Session["tic_cargo"] = e.NewValues["TIC_CARGO"];
            Session["tic_email"] = e.NewValues["TIC_EMAIL"];
            Session["tic_status"] = e.NewValues["TIC_STATUS"];
            Session["rsp_detalle"] = e.NewValues["RSP_DETALLE"];
            Session["tic_finicio"] = e.NewValues["TIC_FECHA_INICIO"];
            Session["tic_fcierre"] = e.NewValues["TIC_FECHA_CIERRE"];
            Session["cli_horas_soporte"] = e.NewValues["CLI_HORAS_SOPORTE"];
            Session["nivel_det"] = e.NewValues["NIV_DETALLE"];
            Session["horas_descontar"] = e.NewValues["TIC_HORAS_DESCONTAR"];

            clsTicketAdmin.ModificarTicketAdmin();
            
           // clsTicketAdmin.ActulizaHorasSoporte();
            id_ticket = Convert.ToInt32(Session["TIC_ID"]);
            DataTable dtInfo = clsTicketAdmin.DetallesTicket(id_ticket);
            String a = e.NewValues["NIV_DETALLE"].ToString();
            String b = e.OldValues["NIV_DETALLE"].ToString();
            if (a != b)
            {
                //Mando a recategorizar el nivel de complejidad
                clsTicketAdmin.ModificarNivelComplejidad();

                //LLamamos a la Funcion para enviar correo al cliente
                string email = dtInfo.Rows[0]["TIC_EMAIL"].ToString();
                string asunto = "Respuesta ticket # " + id_ticket;
                string mensaje = @"<br> Estimado Usuario, 
                                <br><br>El nivel de complejidad de su ticket se ha recategorizado a " + e.NewValues["NIV_DETALLE"] +
                                ", por lo que el tiempo de solución puede variar del mencionado inicialmente. Se ha emitido una respuesta a su inconveniente esperando resuelva el inconveniente presentado." +
                                "<br><br>Para visualizar la respueta ingrese al sistema de tickets." +
                                "<br><br><strong>Att. <br><br>Soporte Alfredo Paredes y Asociados.Cía. Ltda.</strong><br><br>";
                clsEmail.Enviacorreo(email, asunto, mensaje);
            }
            else
            {
                //LLamamos a la Funcion para enviar correo al cliente
                string email = dtInfo.Rows[0]["TIC_EMAIL"].ToString();
                string asunto = "Respuesta ticket # " + id_ticket;
                string mensaje = @"<br> Estimaddo Usuario, 
                                <br><br>Se ha respondido el ticket generado esperando resuelva el inconveniente presentado.
                                <br><br>Para visualizar la respueta ingrese al sistema de tickets.
                                <br><br><strong>Att. <br><br>Soporte Alfredo Paredes y Asociados.Cía. Ltda.</strong><br><br>";
                clsEmail.Enviacorreo(email, asunto, mensaje);
            }
            GrdVwTicketsAdmin.CancelEdit();
            e.Cancel = true;
        }
    }
}