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

namespace APATickets.Admin
{
    public partial class ListadoClientes : System.Web.UI.Page
    {
        clsClientesAdmin clsClientesAdmin = new clsClientesAdmin();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack == false)
            {
                Session["Cliente"] = 0;
                GrdVwClientesAdmin.FocusedRowIndex = -1;
            }

            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }

            GrdVwClientesAdmin.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void GrdVwClientesAdmin_HtmlEditFormCreated(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewEditFormEventArgs e)
        {
            GridViewHtmlEditFormPopupContainer container;
            container = (GridViewHtmlEditFormPopupContainer)e.EditForm;
            ASPxPopupControl popup;
            popup = (ASPxPopupControl)container.NamingContainer;

            popup.HeaderStyle.BackgroundImage.ImageUrl = "~/Images/fondo_ladrillo.jpg";
        }

        protected void GrdVwClientesAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            
            Session["CLI_ID"] = e.EditingKeyValue;
            //int variable;
            //variable = Convert.ToInt32(Session["CLI_ID"]);
        }

        protected void GrdVwClientesAdmin_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            //Session["cli_id"] = e.NewValues["CLI_ID"];
            Session["cli_empresa"] = e.NewValues["CLI_EMPRESA"];
            Session["cli_direccion"] = e.NewValues["CLI_DIRECCION"];
            Session["pa_id"] = e.NewValues["PA_ID"];
            Session["cli_ciudad"] = e.NewValues["CLI_CIUDAD"];
            Session["cli_telefono"] = e.NewValues["CLI_TELEFONO"];
            Session["cli_status"] = e.NewValues["CLI_STATUS"];
            Session["cli_contacto"] = e.NewValues["CLI_CONTACTO"];
            Session["cli_celular"] = e.NewValues["CLI_CELULAR"];
            Session["cli_email"] = e.NewValues["CLI_EMAIL"];
            Session["cli_usuario"] = e.NewValues["CLI_USUARIO"];
            Session["cli_clave"] = e.NewValues["CLI_CLAVE"];
            //Session["cli_horas_soporte"] = e.NewValues["CLI_HORAS_SOPORTE"];
            //Session["cli_fecha_inicial"] = e.NewValues["CLI_FECHA_INICIAL"];
            //Session["cli_fecha_fin"] = e.NewValues["CLI_FECHA_FIN"];

            clsClientesAdmin.InsertarCliente();

            GrdVwClientesAdmin.CancelEdit();
            e.Cancel = true;
        }

        protected void GrdVwClientesAdmin_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            //Session["cli_id"] = e.NewValues["CLI_ID"];
            Session["cli_empresa"] = e.NewValues["CLI_EMPRESA"];
            Session["cli_direccion"] = e.NewValues["CLI_DIRECCION"];
            Session["pa_id"] = e.NewValues["PA_ID"];
            Session["cli_ciudad"] = e.NewValues["CLI_CIUDAD"];
            Session["cli_telefono"] = e.NewValues["CLI_TELEFONO"];
            Session["cli_status"] = e.NewValues["CLI_STATUS"];
            Session["cli_contacto"] = e.NewValues["CLI_CONTACTO"];
            Session["cli_celular"] = e.NewValues["CLI_CELULAR"];
            Session["cli_email"] = e.NewValues["CLI_EMAIL"];
            Session["cli_usuario"] = e.NewValues["CLI_USUARIO"];
            Session["cli_clave"] = e.NewValues["CLI_CLAVE"];
            Session["cli_horas_soporte"] = e.NewValues["CLI_HORAS_SOPORTE"];
            Session["cli_fecha_inicial"] = e.NewValues["CLI_FECHA_INICIAL"];
            Session["cli_fecha_fin"] = e.NewValues["CLI_FECHA_FIN"];

            clsClientesAdmin.ModificarCliente();

            GrdVwClientesAdmin.CancelEdit();
            e.Cancel = true;
        }

        protected void GrdVwClientesAdmin_RowDeleting(object sender, DevExpress.Web.Data.ASPxDataDeletingEventArgs e)
        {
            Session["CLI_ID"] = e.Values["CLI_ID"];

            clsClientesAdmin.EliminarCliente();

            GrdVwClientesAdmin.CancelEdit();
            e.Cancel = true;
        }

        protected void bntExportarExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporter1.WriteXlsToResponse();
        }

        protected void btnAceptar_Click(object sender, EventArgs e)
        {
            clsClientesAdmin.GuardarSoftware(GrdVwClientesSoftAdmin);
        }

        protected void GrdVwClientesSoftAdmin_CustomCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewCustomCallbackEventArgs e)
        {
            try
            {
                Session["Cliente"] = FocusedCliente["CLI_ID"];
            }
            catch (Exception)
            {
                Session["Cliente"] = 0;
                throw;
            }
        }

        protected void GrdVwClientesSoftAdmin_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            clsClientesAdmin.RecuperarSoftware(GrdVwClientesSoftAdmin);
            GrdVwClientesSoftAdmin.DataBind();
        }

        protected void GrdVwClientesSoftAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["Software"] = e.EditingKeyValue;
        }

        protected void GrdVwClientesSoftAdmin_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
        {
            clsClientesAdmin.ActualizarDatosSoftware(e);
            e.Cancel = true;
            GrdVwClientesSoftAdmin.CancelEdit();
        }

        
    }
}