
using Microsoft.Reporting.WebForms;
using MobileTask.AppCode;
using System;
using System.Collections.Generic;
using System.Data;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace TPMPatkol
{
    public partial class MonitorTransaction : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected void exportTableC_Click(object sender, EventArgs e)
        {

            String stcMonth = snsmonth.Text;
            String stcMonthtxt = snsmonthtxt.Text;
            String stcYear = snsyear.Text;
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().DT_SP_Monitoring_Report(stcMonth, stcYear);
            //string customerJSON = Request.Form["CustomerJSON"];
            //DataTable dt = JsonConvert.DeserializeObject<DataTable>(customerJSON);
            GridView GV = new GridView();
            GV.AllowPaging = false;
            GV.DataSource = dt;
            GV.DataBind();
            if (GV.Rows.Count > 0)
            {
                Response.Clear();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment;filename=" + stcYear + "_" + stcMonthtxt + ".xls");
                Response.Charset = "";
                Response.ContentType = "application/vnd.ms-excel";
                StringWriter sw = new StringWriter();
                HtmlTextWriter hw = new HtmlTextWriter(sw);
                for (int i = 0; i > GV.Rows.Count; i++)
                {
                    GV.Rows[i].Attributes.Add("class", "textmode");
                }
                GV.RenderControl(hw);
                String style = @"<style> .textmode{mso-number-format:\@;}</style>";
                Response.Write(style);
                Response.Output.Write("<html><head><META http-equiv=Content-Type content=text/html; charset=utf-8></head><body><FONT face=Tahoma>" + sw.ToString() + "</FONT></Body></Html>");
                Response.Flush();
                Response.End();
            }
        }
        protected void exportPDF_Click(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;

            String stcMonth = snsmonth.Text;
            String stcMonthtxt = snsmonthtxt.Text;
            String stcYear = snsyear.Text;
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().DT_SP_Monitoring_Report(stcMonth, stcYear);

            ReportDataSource rdm = new ReportDataSource("DataSet1", dt);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rdm);
            viewer.LocalReport.ReportPath = Server.MapPath("./ReportTPM/Monitoring_Report.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[2];
            param[0] = new ReportParameter("Month", stcMonth);
            param[1] = new ReportParameter("Year", stcYear);
            //param[1] = new ReportParameter("stcMonthtxt", stcMonthtxt);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + stcYear + "_" + stcMonthtxt + "." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }
    }
}