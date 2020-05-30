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


namespace APATickets.Usuario
{
    public partial class TicketsUsuario : System.Web.UI.Page
    {
        clsTicketUsuario clsTicketUsuario = new clsTicketUsuario();
        clsEmail clsEmail = new clsEmail();
        public int id_ticket;

        protected void Page_Load(object sender, EventArgs e)
        {
            //Response.Write(Session["NOMBRE_USUARIO"]);
            if (Session["ID_USUARIO"] != null)
            {

                GrdVwTicketsUsuario.SelectParameters[0].DefaultValue = Session["ID_USUARIO"].ToString();

                GrdVwTicketsU.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            }
            else
            {
                Response.Redirect("LoginUsuario.aspx");
            }
        }

        protected void GrdVwTicketsU_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["soft_id"] = e.NewValues["SOFT_ID"];
            Session["soft_nombre"] = e.NewValues["SOFT_NOMBRE"];
            Session["cli_id"] = Session["ID_USUARIO"];
            Session["inc_id"] = e.NewValues["INC_DETALLE"];
            Session["tic_persona"] = e.NewValues["TIC_PERSONA"];
            Session["tic_cargo"] = e.NewValues["TIC_CARGO"];
            Session["tic_email"] = e.NewValues["TIC_EMAIL"];
            Session["tic_status"] = e.NewValues["TIC_STATUS"];
            Session["inc_detalle"] = e.NewValues["INC_DETALLE"];
            Session["rsp_detalle"] = e.NewValues["RSP_DETALLE"];
            Session["tic_finicio"] = e.NewValues["TIC_FECHA_INICIO"];
            Session["tic_fcierre"] = e.NewValues["TIC_FECHA_CIERRE"];
            Session["niv_tiempo"] = e.NewValues["NIV_TIEMPO"];

            clsTicketUsuario.InsertarTicket();
            clsTicketUsuario.InsertarTicketDetalle();
            id_ticket = clsTicketUsuario.UltimoRegistro;

            DataTable dtInfo = clsTicketUsuario.DetallesTicketNuevo(id_ticket);
            
            //LLamamos a la Funcion para enviar correo al cliente
            string email = e.NewValues["TIC_EMAIL"].ToString();
            string asunto = "Apertuda de nuevo ticket";
            string mensaje = @"<br>Usted ha generado un nuevo ticket con número : " + id_ticket + " <br><br> " +
                               "Su requerimiento ha sido clasificado con un nivel de complejidad " + dtInfo.Rows[0]["NIV_DETALLE"].ToString() +
                               " por lo que tendrá un tiempo de solución aproximado de " + dtInfo.Rows[0]["NIV_TIEMPO"].ToString() +
                               "<br><br>Pronto nos estaremos contactando con usted. " +
                               "<br><br><strong>Att. <br><br>Soporte Alfredo Paredes y Asociados.Cía. Ltda.<strong><br><br>";
            clsEmail.Enviacorreo(email, asunto, mensaje);

            //LLmamos a la Funcion para enviar correo a soporte
            string emailsoporte = "soporte@alfredoparedesyasociados.com";
            string asuntosoporte = "Apertuda de nuevo ticket";
            string mensajesoporte = @"<br>Se ha generado un nuevo ticket desde el sistema de soporte con los siguientes detalles:
                                      <br><br>TICKET # : " + id_ticket + "<br>EMPRESA : " + Session["NOMBRE_USUARIO"] + " <br>USUARIO : " + Session["tic_persona"] +
                                    "<br>SISTEMA : " + dtInfo.Rows[0]["SOFT_NOMBRE"].ToString() + "<br>INCONVENIENTE : " + dtInfo.Rows[0]["INC_DETALLE"].ToString() +
                                    "<br>DETALLE : " + dtInfo.Rows[0]["RSP_DETALLE"].ToString() +
                                    "<br><br> Revise el sistema de tickets por favor.<br><br>";

            clsEmail.Enviacorreo(emailsoporte, asuntosoporte, mensajesoporte);

            GrdVwTicketsU.CancelEdit();
            e.Cancel = true;
        }

        protected void GrdVwTicketsU_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["TIC_ID"] = e.EditingKeyValue;
            //SqlCargaSoftware.SelectParameters[0].DefaultValue = Session["ID_USUARIO"].ToString();
            //ASPxComboBox cmbSoftware = GrdVwTicketsU.FindEditRowCellTemplateControl(GrdVwTicketsU.Columns("SOFT_ID"),"cmbSoftware");
            //cmbSoftware.DataBind();
        }

        protected void GrdVwTicketsU_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Session["soft_id"] = e.NewValues["SOFT_ID"];
            Session["soft_nombre"] = e.NewValues["SOFT_NOMBRE"];
            Session["cli_id"] = Session["ID_USUARIO"];
            Session["inc_id"] = e.NewValues["INC_ID"];
            Session["tic_persona"] = e.NewValues["TIC_PERSONA"];
            Session["tic_cargo"] = e.NewValues["TIC_CARGO"];
            Session["tic_email"] = e.NewValues["TIC_EMAIL"];
            Session["tic_status"] = e.NewValues["TIC_STATUS"];
            Session["inc_detalle"] = e.NewValues["INC_DETALLE"];
            Session["rsp_detalle"] = e.NewValues["RSP_DETALLE"];
            Session["tic_finicio"] = e.NewValues["TIC_FECHA_INICIO"];
            Session["tic_fcierre"] = e.NewValues["TIC_FECHA_CIERRE"];
            Session["niv_detalle"] = e.NewValues["NIV_DETALLE"];
            Session["niv_tiempo"] = e.NewValues["NIV_TIEMPO"];
            
            clsTicketUsuario.ModificarTicket();
            id_ticket = Convert.ToInt32(Session["TIC_ID"]);
            DataTable dtInfo = clsTicketUsuario.DetallesTicketNuevo(id_ticket);

            //LLamamos a la Funcion para enviar correo al cliente
            string email = dtInfo.Rows[0]["TIC_EMAIL"].ToString();
            string asunto = "Cambio de información en el ticket : " + Session["TIC_ID"];
            string mensaje = @"<br>Estimado Usuario,
                                <br><br> Se ha enviado su respuesta del ticket al proveedor. 
                                <br><br>Pronto nos pondremos en contacto con usted.
                                <br><br><strong>Att. <br><br>Soporte Alfredo Paredes y Asociados.Cía. Ltda.</strong><br><br>";
            clsEmail.Enviacorreo(email, asunto, mensaje);

            //LLmamos a la Funcion para enviar correo a soporte
            string emailsoporte = "soporte@alfredoparedesyasociados.com";
            string asuntosoporte = "Modificación del ticket " + Session["TIC_ID"];
            string mensajesoporte = @"<br> El usuario " + Session["tic_persona"] + " de la empresa " + Session["NOMBRE_USUARIO"] +
                                    " ha modificado el ticket # " + Session["TIC_ID"] + "<br>Respuesta : " + dtInfo.Rows[0]["RSP_DETALLE"].ToString() + "<br><br>Revise el sistema.<br><br>";
            clsEmail.Enviacorreo(emailsoporte, asuntosoporte, mensajesoporte);

            GrdVwTicketsU.CancelEdit();
            e.Cancel = true;
        }

        protected void GrdVwTicketsU_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Session["TIC_ID"] = e.Values["TIC_ID"];
            Session["cli_id"] = Session["ID_USUARIO"];
            Session["niv_tiempo"] = e.Values["NIV_TIEMPO"];
            Session["horas_soporte"] = Session["HORAS_SOPORTE_USUARIO"];
            Session["tic_tiempo_descuento"] = e.Values["TIC_HORAS_DESCONTAR"];
            Session["soft_id"] = e.Values["SOFT_ID"];

            clsTicketUsuario.CerrarTicket();
            clsTicketUsuario.ActualizarHorasSoporte();

            id_ticket = Convert.ToInt32(Session["TIC_ID"]);
            DataTable dtInfo = clsTicketUsuario.DetallesTicketNuevo(id_ticket);

            //LLamamos a la Funcion para enviar correo al cliente
            string email = dtInfo.Rows[0]["TIC_EMAIL"].ToString();
            string asunto = "Cierre de ticket # " + id_ticket;
            string mensaje = @"<br>Estimado Usuario, " +
                               " <br><br> El ticket # " + id_ticket + " generado con fecha " + dtInfo.Rows[0]["TIC_FECHA_INICIO"].ToString() + " ha sido cerrado. " +
                               " <br>Se han descontado ." + dtInfo.Rows[0]["TIC_HORAS_DESCONTAR"].ToString() + " hora(s) de su plan de soporte." +
                               " <br><br>Gracias por utilizar nuestro sistema." +
                               " <br><br><strong>Att.<br><br>Soporte Alfredo Paredes y Asociados.Cía. Ltda.</strong><br><br>";
            clsEmail.Enviacorreo(email, asunto, mensaje);

            //LLmamos a la Funcion para enviar correo a soporte
            string emailsoporte = "soporte@alfredoparedesyasociados.com";
            string asuntosoporte = "Cierre ticket # " + id_ticket;
            string mensajesoporte = @"<br>El usuario " + Session["tic_persona"] + " de la empresa " + Session["NOMBRE_USUARIO"] +
                                    " ha cerrado el ticket # " + id_ticket + " generado con fecha del " + dtInfo.Rows[0]["TIC_FECHA_INICIO"].ToString() +
                                    " <br><br>DETALLE : " + Session["rsp_detalle"] +
                                    " <br><br>Revise el sistema.<br><br>";
            clsEmail.Enviacorreo(emailsoporte, asuntosoporte, mensajesoporte);
            //Response.Redirect("HistorialTicketsUsuario.aspx");
            
            GrdVwTicketsU.CancelEdit();
            e.Cancel = true;
        }

        protected void cmbInconveniente_Callback(object sender, DevExpress.Web.ASPxClasses.CallbackEventArgsBase e)
        {
            ASPxComboBox cmbInc;
            cmbInc = (ASPxComboBox)sender;

            SqlCargaInconveniente.SelectParameters[0].DefaultValue = e.Parameter;
            cmbInc.DataBind();
        }

        protected void GrdVwTicketsU_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            GridViewHtmlEditFormPopupContainer container;
            container = (GridViewHtmlEditFormPopupContainer)e.EditForm;
            ASPxPopupControl popup;
            popup = (ASPxPopupControl)container.NamingContainer;

            popup.HeaderStyle.BackgroundImage.ImageUrl = "~/Images/fondo_ladrillo.jpg";
        //popup.HeaderStyle.ForeColor = Drawing.Color.White;
        }
    }
}