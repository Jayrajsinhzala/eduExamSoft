using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Net .Mail ;
using System.Configuration;
using System.IO;


/// <summary>
/// Summary description for EmailSender
/// </summary>
public class EmailSender
{

    public EmailSender()
    {
    }

    public static void sendMail(String name, String mailId, MemoryStream output,String subject)
    {
        String FromEmailid = ConfigurationManager.AppSettings["Frommail"].ToString();
        String HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
        String Pass = ConfigurationManager.AppSettings["Password"].ToString();
        String Port = ConfigurationManager.AppSettings["Port"].ToString();


      //  MemoryStream file = new MemoryStream(PDFGenerate("This is pdf file text", Server.MapPath("Images/photo.jpg")).ToArray());  
        byte[] bytes = null;
        if (output != null)
        {
             bytes = output.ToArray();
            output.Close();
        }

        MailMessage mail = new MailMessage();
        //mail.To.Add("jharupesh84@gmail.com");
        //  mail.To.Add("shalinjain75@gmail.com");
        mail.To.Add(mailId);
        mail.From = new MailAddress(FromEmailid);
        mail.Subject = subject;
       // mail.Attachments.Add(new Attachment("C:\\Users\\Alpesh\\Desktop\\isdelete.png"));
        if (output != null)
        {
            Attachment data = new Attachment(new MemoryStream(bytes), "RunTime_Attachment.pdf", "application/pdf");
            mail.Attachments.Add(data);
        }
        string Body = "Hi " + name + "  <br>Your Information is Submited  <br>Thanks!!!";
        mail.Body = Body;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = HostAdd;
        smtp.Port = Convert.ToInt16(Port);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential(FromEmailid,Pass);
        smtp.EnableSsl = true;

        smtp.Send(mail);

    }


    public static void sendForgotMail(String name, String mailId, String otp, String subject)
    {
        String FromEmailid = ConfigurationManager.AppSettings["Frommail"].ToString();
        String HostAdd = ConfigurationManager.AppSettings["Host"].ToString();
        String Pass = ConfigurationManager.AppSettings["Password"].ToString();
        String Port = ConfigurationManager.AppSettings["Port"].ToString();


        
        MailMessage mail = new MailMessage();
        //mail.To.Add("jharupesh84@gmail.com");
        //  mail.To.Add("shalinjain75@gmail.com");
        mail.To.Add(mailId);
        mail.From = new MailAddress(FromEmailid);
        mail.Subject = subject;
        
        string Body = "Hi " + name + "  <br>Your One Time Password for update passowrd is "+  otp  + "<br>  Thanks!!!";
        mail.Body = Body;
        mail.IsBodyHtml = true;
        SmtpClient smtp = new SmtpClient();
        smtp.Host = HostAdd;
        smtp.Port = Convert.ToInt16(Port);
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new System.Net.NetworkCredential(FromEmailid, Pass);
        smtp.EnableSsl = true;

        smtp.Send(mail);

    }
	
}