using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_ViewExam : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        Exam_Master ex = new Exam_Master();
        var lis = from t in ent.Exam_Master where t.Date_Of_Exam > DateTime.Now && t.IsLocked == true select t;
        GridView1.DataSource = lis.ToList();
        GridView1.DataBind();



       
       
    }

   
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        int id = Convert.ToInt16(GridView1.SelectedValue);
        Session["Exam_Id"] = id;

        Response.Redirect("~/studentN/ExamTAC.aspx");
    }
}