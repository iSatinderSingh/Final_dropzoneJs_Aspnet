<%@ WebHandler Language="C#" Class="hn_SimpeFileUploader" %>

using System;
using System.Web;
using System.IO;
using System.Drawing;

public class hn_SimpeFileUploader : IHttpHandler {

public void ProcessRequest(HttpContext context)
{
    context.Response.ContentType = "text/plain";

    string dirFullPath = HttpContext.Current.Server.MapPath("~/MediaUploader/");
    string[] files;
    int numFiles;
    files = System.IO.Directory.GetFiles(dirFullPath);
    numFiles = files.Length;
    numFiles = numFiles + 1;

    string str_image = "";

    foreach (string s in context.Request.Files)
    {
        HttpPostedFile file = context.Request.Files[s];
        string fileName = file.FileName;
        string fileExtension = file.ContentType;

        if (!string.IsNullOrEmpty(fileName))
        {
            fileExtension = Path.GetExtension(fileName);
            str_image = "MyPHOTO_" + numFiles.ToString() + fileExtension;
            string pathToSave = HttpContext.Current.Server.MapPath("~/MediaUploader/") + str_image;
            file.SaveAs(pathToSave);
        }
    }
    context.Response.Write(str_image);
}
 
    public bool IsReusable {
        get {
            return false;
        }
    }

    

}