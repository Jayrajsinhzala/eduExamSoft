using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConcernedUnit : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["cmd"]);
        var lis = from t in ent.Exam_Master where t.Exam_Id == id select t;
        Exam_Master ex= lis.FirstOrDefault(); 
        if (ex == null)
        {
            MessageLabel.Text = "Not Found ";
        }
        else
        {
            TxtEName.Text = ex.Exam_Name;
            TxtDuration.Text = ex.Duration.ToString();
            TxtN_O_Q.Text = ex.N_O_Q.ToString();
            AllowPracticeCHK.Checked =Convert.ToBoolean( ex.Allow_Practice);
            TxtDateOfExam.Text = ex.Date_Of_Exam.ToString();
            TxtMode.Text = ex.Mode;
            TxtSubject.Text = ex.Sub_Id.ToString();
            IsLockCHK.Checked =Convert.ToBoolean( ex.IsLocked);
            IsDelCHK.Checked = Convert.ToBoolean(ex.IsDeleted);
        }

    }
    void load_Unit()
    {
        int id = Convert.ToInt16(Request.QueryString["cmd"]);
        var src = from x in ent.ViewExamUnits where x.Exam_Id == id select x;
        foreach (var l in src)
        {
            ExamUnitListBox.Items.Add(l.Unit_Name);
        }
    }
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }

        if (Page.IsPostBack == false)
        {
            int d = Convert.ToInt16(Request.QueryString["cmd"]);
            display_rec();
            load_Unit();
            if (ViewState["id"] == null)
            {
                ViewState["id"] = d;
            }
        }
    }
    protected void BtnAddUnit_Click(object sender, EventArgs e)
    {
        string str = UnitListBox.SelectedItem.ToString();
        ListItem li = ExamUnitListBox.Items.FindByText(str);
        if (li == null)
        {

            ExamUnitListBox.Items.Add(UnitListBox.SelectedItem);
            int id = Convert.ToInt16(ViewState["id"]);
            Exam_Unit exunit = new Exam_Unit();
            exunit.Exam_Id = id;
            exunit.Unit_Id = Convert.ToDecimal(UnitListBox.SelectedValue);
            ent.Exam_Unit.Add(exunit);
            ent.SaveChanges();
        }
        else
        {
            MessageLabel.Text = "already unit is there....";
        }

    }
    protected void BtnRmvUnit_Click(object sender, EventArgs e)
    {
        string str = ExamUnitListBox.SelectedItem.ToString();
        var src = from t in ent.Units where t.Unit_Name == str select t;
        Unit eu = src.FirstOrDefault();

        int id = Convert.ToInt16(ViewState["id"]);
        // decimal d = Convert.ToDecimal(ExamUnitListbox.SelectedValue);
        var lis = from t in ent.Exam_Unit where t.Unit_Id == eu.Unit_Id && t.Exam_Id == id select t;
        Exam_Unit exunit = lis.FirstOrDefault();
        ent.Exam_Unit.Remove(exunit);
        ent.SaveChanges();
        ExamUnitListBox.Items.Remove(ExamUnitListBox.SelectedItem);
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewExam.aspx");
    }
 
}