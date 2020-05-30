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
    public partial class InconvenienteAdmin : System.Web.UI.Page
    {
        clsInconvenienteAdmin clsGestionAdmin = new clsInconvenienteAdmin();
        clsEmail clsEmail = new clsEmail();

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }
            Carga_Niveles();
        }

        protected void Carga_Niveles()
        {
            if (cmbSoftware.Value != null)
            {
                SqlCargaNiveles.SelectParameters[0].DefaultValue = cmbSoftware.Value.ToString();
            }
            
        }
        protected void GrdVwInconvenienteAdmin_AfterPerformCallback(object sender, DevExpress.Web.ASPxGridView.ASPxGridViewAfterPerformCallbackEventArgs e)
        {
            if (cmbSoftware.Value != null)
            {
                GrdVwInconvenienteAdminSQL.SelectParameters[0].DefaultValue = cmbSoftware.Value.ToString();
                GrdVwInconvenienteAdmin.DataBind();
            }
        }

        protected void GrdVwInconvenienteAdmin_StartRowEditing(object sender, DevExpress.Web.Data.ASPxStartRowEditingEventArgs e)
        {
            Session["soft_id"] = e.EditingKeyValue;
            Session["inc_id"] = GrdVwInconvenienteAdmin.GetRowValuesByKeyValue(e.EditingKeyValue, "INC_ID");
            Session["niv_id"] = GrdVwInconvenienteAdmin.GetRowValuesByKeyValue(e.EditingKeyValue, "NIV_ID");
            Session["sol_id"] = GrdVwInconvenienteAdmin.GetRowValuesByKeyValue(e.EditingKeyValue, "SOL_ID");
        }

        protected void GrdVwInconvenienteAdmin_RowInserting(object sender, DevExpress.Web.Data.ASPxDataInsertingEventArgs e)
        {
            Session["inc_detalle"] = e.NewValues["INC_DETALLE"];
            Session["sol_detalle"] = e.NewValues["DETALLE"];
            Session["niv_id"] = e.NewValues["NIV_ID"];

            //clsGestionAdmin.InsertarAdmin();

            GrdVwInconvenienteAdmin.CancelEdit();
            e.Cancel = true;
        }
    }
}