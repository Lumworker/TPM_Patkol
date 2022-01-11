using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPMPatkol
{
    public partial class LotTPMCode : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void ClickLink_Click(object sender, EventArgs e)
        {
            //ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('" + txtLot.Value + "')", true);
            System.Diagnostics.Process.Start(@"file:\\PORTALAPP01\TPMPatkolQRCode\18\");
        }

        void LinkButton_Click(string LotID)
        {
            string link = @"file:\\PORTALAPP01\TPMPatkolQRCode\" + LotID + "\\";
            System.Diagnostics.Process.Start(link);
        }

        [WebMethod]
        public static void ClickLink(string LotID)
        {
            new LotTPMCode().LinkButton_Click(LotID);
        }


    }
}