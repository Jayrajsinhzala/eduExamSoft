using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using iTextSharp.text;
using iTextSharp.text.pdf;
using System.IO;


public partial class studentN_ViewResult : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

        int sid = Convert.ToInt32(Session["stu_id"]);
        int eid = Convert.ToInt32(Session["Exam_Id"]);
        var lis = from t in ent.ViewStudent_Result where t.Stu_Id == sid & t.Exam_Id==eid select t;
        ViewStudent_Result rs = lis.FirstOrDefault();
        Stu_Id_Label.Text = sid.ToString();
        Exam_Id_Label.Text = eid.ToString();
        N_O_Q_Label.Text = rs.N_O_Q.ToString();
        N_C_A_Label.Text = rs.N_C_A.ToString();
        N_W_A_Label.Text = rs.N_W_A.ToString();
        Total_Score_Label.Text = rs.Total_Score.ToString();
        Email_Label.Text = rs.Email_Id;
        
    }

    void GeneratePDF()
    {
        int sid = Convert.ToInt32(Session["stu_id"]);
        int eid = Convert.ToInt32(Session["Exam_Id"]);
        var lis = from t in ent.ViewStudent_Result where t.Stu_Id == sid & t.Exam_Id == eid select t;
        MemoryStream output = new MemoryStream();
        Document pdfDoc = new Document(PageSize.A4, 25, 10, 25, 10);
        PdfWriter pdfWriter = PdfWriter.GetInstance(pdfDoc, Response.OutputStream);
        pdfDoc.Open();
        PdfPCell cell = null;

        PdfPTable table = new PdfPTable(6);
        table.DefaultCell.Border = Rectangle.BOX;
        cell = new PdfPCell(new Phrase("Name"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);

        cell = new PdfPCell(new Phrase("Email"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);
        //table.AddCell("Dob");

        cell = new PdfPCell(new Phrase("N_O_Q"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);

        cell = new PdfPCell(new Phrase("N_C_A"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);

        cell = new PdfPCell(new Phrase("N_W_A"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);

        cell = new PdfPCell(new Phrase("Total_Score"));
        cell.BackgroundColor = new BaseColor(System.Drawing.Color.Yellow);
        cell.Border = Rectangle.BOX;
        table.AddCell(cell);


        foreach (ViewStudent_Result rs in lis)
        {
            table.AddCell(rs.Stu_Name);
            table.AddCell(rs.Email_Id);
            table.AddCell(rs.N_O_Q.ToString());
            table.AddCell(rs.N_C_A.ToString());
            table.AddCell(rs.N_W_A.ToString());
            table.AddCell(rs.Total_Score.ToString());

        }


        pdfDoc.Add(table);
        pdfWriter.CloseStream = false;
        pdfDoc.Close();
        //to download any file
        Response.Buffer = true;
        Response.ContentType = "application/pdf";
        String flnm = "anc.pdf";
        Response.AddHeader("content-disposition", "attachment;filename=" + flnm);
        Response.Cache.SetCacheability(HttpCacheability.NoCache);
        Response.Write(pdfDoc);
        //  EmailSender.sendMail("Shalin jain", "shalinjain75@gmail.com",Response.OutputStream);
        Response.End();
    }
   
    protected void BtnPDF_Click1(object sender, EventArgs e)
    {
        GeneratePDF();
    }
}