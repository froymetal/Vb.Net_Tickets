using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace APATickets.Admin
{
    public partial class ReportesAdmin : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["RESP_ID"] == null)
            {
                Response.Redirect("LoginAdmin.aspx");
            }

            GrdVwInconvenientes.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            GrdVwInconvenientesEspec.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            GridViewHoras.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            GrdVwResponsables.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
            GrdVwPendientes.Attributes.Add("onkeypress", "return CaracterPermitido(event);");
        }

        protected void bntExportarExcel_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterI.WriteXlsToResponse();
        }

        protected void bntExportarExcelIEspec_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterEspec.WriteXlsToResponse();
        }

        protected void bntExportarExcelHoras_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterH.WriteXlsToResponse();
        }

        protected void bntExportarExcelResponsable_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterR.WriteXlsToResponse();
        }

        protected void bntExportarExcelPendientes_Click(object sender, EventArgs e)
        {
            ASPxGridViewExporterP.WriteXlsToResponse();
        }
    }
}