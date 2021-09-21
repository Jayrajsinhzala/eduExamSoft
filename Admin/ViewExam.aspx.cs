using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewExam : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        int id = Convert.ToInt16(GridView1.SelectedValue);
        var lis = from t in ent.Exam_Master
                  where t.Exam_Id == id
                  select t;
        Exam_Master ex = lis.FirstOrDefault();
        TxtEId.Text = ex.Exam_Id.ToString();
        TxtEName.Text = ex.Exam_Name;
        TxtDuration.Text = ex.Duration.ToString();
        TxtN_O_Q.Text = ex.N_O_Q.ToString();
        TxtDate_Of_Exam.Text = ex.Date_Of_Exam.ToString();
        AllowPracticeCHK.Checked =Convert.ToBoolean( ex.Allow_Practice);
        TxtMode.Text = ex.Mode;
        TxtSub_Id.Text = ex.Sub_Id.ToString();
        TxtD_O_E.Text = ex.D_O_E.ToString();
        TxtD_O_M.Text = ex.D_O_M.ToString();
        IsDelCHK.Checked = Convert.ToBoolean(ex.IsDeleted);
        IsLockCHK.Checked = Convert.ToBoolean(ex.IsLocked);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "BtnEdit")
        {
            Response.Redirect("~/Admin/AddEditExam.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "BtnDelete")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Exam_Master
                      where t.Exam_Id == id
                      select t;
            Exam_Master ex = lis.FirstOrDefault();
            ex.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
       
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Exam Name")
        {

            EntityDataSource1.Where = "it.[Exam_Name]='" + DropDownList1.Text + "'";
        }
    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1"; 
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditExam.aspx?cmd=Add");
    }

    protected void UnitLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ConcernedUnit.aspx?cmd=" + GridView1.SelectedValue);
    }
    protected void QuestionLinkButton_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ConcernedQuestion.aspx?cmd=" + GridView1.SelectedValue);
    }
}