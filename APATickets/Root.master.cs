using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DevExpress.Web.ASPxClasses;

namespace APATickets {
    public partial class RootMaster : System.Web.UI.MasterPage {
        protected void Page_Load(object sender, EventArgs e) {
            ASPxSplitter1.GetPaneByName("Header").Size = ASPxWebControl.GlobalTheme == "Moderno" ? 95 : 83;
            ASPxSplitter1.GetPaneByName("Header").MinSize = ASPxWebControl.GlobalTheme == "Moderno" ? 95 : 83;
            ASPxLabel2.Text = "Empresa : " + Session["NOMBRE_USUARIO"] + "\nCuenta con : " + Session["HORAS_SOPORTE_USUARIO"] + " horas de soporte. \n" + DateTime.Now.Year + Server.HtmlDecode(" &copy; Copyright Alfredo Paredes & Asociados Cia. Ltda.");
        }


    }
}