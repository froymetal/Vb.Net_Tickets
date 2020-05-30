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
    public partial class GestionAdmin : System.Web.UI.Page
    {
        clsGestionAdmin clsGestionAdmin = new clsGestionAdmin();
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

            GrdVwGestionAdmin.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void GrdVwGestionAdmin_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            GridViewHtmlEditFormPopupContainer container;
            container = (GridViewHtmlEditFormPopupContainer)e.EditForm;
            ASPxPopupControl popup;
            popup = (ASPxPopupControl)container.NamingContainer;

            popup.HeaderStyle.BackgroundImage.ImageUrl = "~/Images/fondo_ladrillo.jpg";
        }

        protected void GrdVwGestionAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["RESP_ID"] = e.EditingKeyValue;
        }

        protected void GrdVwGestionAdmin_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            Session["resp_nombre"] = e.NewValues["RESP_NOMBRE"];
            Session["resp_cargo"] = e.NewValues["RESP_CARGO"];
            Session["resp_email"] = e.NewValues["RESP_EMAIL"];
            Session["resp_usuario"] = e.NewValues["RESP_USUARIO"];
            Session["resp_clave"] = e.NewValues["RESP_CLAVE"];
            Session["tipo_admin"] = e.NewValues["TIPO_ID"];

            clsGestionAdmin.ModificarAdmin();

            GrdVwGestionAdmin.CancelEdit();
            e.Cancel = true;

        }

        protected void GrdVwGestionAdmin_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["resp_nombre"] = e.NewValues["RESP_NOMBRE"];
            Session["resp_cargo"] = e.NewValues["RESP_CARGO"];
            Session["resp_email"] = e.NewValues["RESP_EMAIL"];
            Session["resp_usuario"] = e.NewValues["RESP_USUARIO"];
            Session["resp_clave"] = e.NewValues["RESP_CLAVE"];
            Session["tipo_admin"] = e.NewValues["TIPO_ID"];

            clsGestionAdmin.InsertarAdmin();

            GrdVwGestionAdmin.CancelEdit();
            e.Cancel = true;
        }

        protected void GrdVwGestionAdmin_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Session["RESP_ID"] = e.Values["RESP_ID"];

            clsGestionAdmin.EliminarAdmin();

            GrdVwGestionAdmin.CancelEdit();
            e.Cancel = true;
        }
    }
}