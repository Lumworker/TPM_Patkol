
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
    public partial class CustomerReportDetail : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void exportPDF_Click(object sender, EventArgs e)
        {
            Warning[] warnings;
            string[] streamIds;
            string mimeType = string.Empty;
            string encoding = string.Empty;
            string extension = string.Empty;
            string deviceInfo = null;
            //string deviceInfo = "<DeviceInfo>" +
            //    "<OutputFormat>PDF</OutputFormat>" +
            //    "<PageHeight>11.69in</PageHeight>" +
            //    "<PageWidth>16.54in</PageWidth>" +
            //    "<MarginTop>0.1in</MarginTop>" +
            //    "<MarginLeft>0.1in</MarginLeft>" +
            //    "<MarginRight>0.1in</MarginRight>" +
            //    "<MarginBottom>0.1in</MarginBottom>" +
            //    "</DeviceInfo>";
            String id = snsid.Text;
            String cust = snscustsite.Text;
            String month = snsmonth.Text;
            String year = snsyear.Text;
            String custname = snscustomer.Text;
            DataTable dt = new ClassBrowseNew().GetExportCustomerReportv2(cust, id, month, year);
            DataTable dt2 = new ClassBrowseNew().GetCustomerReportPDF(id);
            DataTable dt3 = new ClassBrowseNew().GetExportCustomerReportLogo(cust);
            ReportDataSource rdm = new ReportDataSource("Customer_Report", dt);
            ReportDataSource rds = new ReportDataSource("DataSet1", dt2);
            ReportDataSource rds2 = new ReportDataSource("Img", dt3);
            // Setup the report viewer object and get the array of bytes
            ReportViewer viewer = new ReportViewer();
            viewer.Reset();
            viewer.ProcessingMode = ProcessingMode.Local;
            viewer.LocalReport.DataSources.Add(rdm);
            viewer.LocalReport.DataSources.Add(rds);
            viewer.LocalReport.DataSources.Add(rds2);
            viewer.LocalReport.ReportPath = Server.MapPath("./ReportTPM/TPMReport_4.rdl");
            viewer.LocalReport.EnableHyperlinks = false;
            viewer.LocalReport.EnableExternalImages = true;
            //viewer.LocalReport.ExecuteReportInCurrentAppDomain(System.Reflection.Assembly.GetExecutingAssembly().Evidence);
            ReportParameter[] param = new ReportParameter[4];
            param[0] = new ReportParameter("cust_site", cust);
            param[1] = new ReportParameter("Report_ID", id);
            param[2] = new ReportParameter("Month", month);
            param[3] = new ReportParameter("Year", year);
            viewer.LocalReport.SetParameters(param);
            byte[] bytes = viewer.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streamIds, out warnings);

            // Now that you have all the bytes representing the PDF report, buffer it and send it to the client.
            Response.Buffer = true;
            Response.Clear();
            Response.ContentType = mimeType;
            Response.AddHeader("content-disposition", "attachment; filename=" + custname + "_(" + month.PadLeft(2, '0') + "-" + year + ")." + extension);
            Response.BinaryWrite(bytes); // create the file
            Response.Flush(); // send it to the client to download
        }


        protected void exportTableC_Click(object sender, EventArgs e)
        {

            String id = snsid.Text;
            String cust = snscustsite.Text;
            String month = snsmonth.Text;
            String year = snsyear.Text;
            String custname = snscustomer.Text;
            DataTable dt = new DataTable();
            dt = new ClassBrowseNew().GetExportCustomerReportv2(cust, id, month, year);
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
                Response.AddHeader("content-disposition", "attachment;filename=" + custname + "_(" + month.PadLeft(2, '0') + "-" + year + ").xls");
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
    }
}