using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;

namespace TPMPatkol
{
    /// <summary>
    /// Summary description for UploadFile
    /// </summary>
    public class UploadFile : IHttpHandler
    {

        public void ProcessRequest(HttpContext context)
        {
            context.Response.ContentType = "text/plain";
            try
            {
                //string filePath = "C:\\DeployWeb\\TPMPatkolQRCodeTPMPatkolQRCode\\" + context.Request.Form["Type"] + "";
                //string filePath = context.Server.MapPath("~/TPMPatkolQRCode/" + context.Request.Form["Type"]);
                string webRootPath = context.Server.MapPath("~");
                string filePath = Path.GetFullPath(Path.Combine(webRootPath, "../TPMPatkolQRCode/" + context.Request.Form["Type"]));

                if (!Directory.Exists(filePath)) { Directory.CreateDirectory(filePath); }

                string str_image = "";

                HttpPostedFile file = context.Request.Files["file"];
                string fileName = file.FileName;
                string fileExtension = file.ContentType;

                if (!string.IsNullOrEmpty(fileName))
                {
                    fileExtension = Path.GetExtension(fileName);
                    str_image = context.Request.Form["name"] + ".png";
                    string pathToSave_100 = filePath + "/" + str_image;
                    file.SaveAs(pathToSave_100);
                }
                context.Response.Write(str_image);
            }
            catch (Exception ex)
            {

            }
        }

        public bool IsReusable
        {
            get
            {
                return false;
            }
        }
    }
}