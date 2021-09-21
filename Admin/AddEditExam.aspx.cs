using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditExam : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();

    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Exam_Master
                  where t.Exam_Id == id
                  select t;
        Exam_Master ex = lis.FirstOrDefault();
        TxtExamName.Text = ex.Exam_Name;
        TxtDuration.Text = ex.Duration.ToString();
        TxtDate_Of_Exam.Text = ex.Date_Of_Exam.ToString();
        TxtN_O_Q.Text = ex.N_O_Q.ToString();
        RadioButtonList1.SelectedValue = ex.Mode;
        DropDownList1.Text = ex.Sub_Id.ToString();
        AllowPracticeCHK.Checked = Convert.ToBoolean(ex.Allow_Practice);
        IsLockedCHK.Checked = Convert.ToBoolean(ex.IsLocked);
        IsDelCHK.Checked = Convert.ToBoolean(ex.IsDeleted);
       
    }
    void Add_rec()
    {
        Exam_Master ex= new Exam_Master ();
      ex.Exam_Name = TxtExamName.Text;
      ex.Duration =Convert.ToInt32(TxtDuration.Text);  
      ex.N_O_Q =Convert.ToInt32(TxtN_O_Q.Text);
      ex.Date_Of_Exam =Convert.ToDateTime(TxtDate_Of_Exam.Text);
      ex.Allow_Practice = AllowPracticeCHK.Checked;
      ex.D_O_E = DateTime.Now;
      ex.D_O_M = DateTime.Now;
      ex.Mode = RadioButtonList1.SelectedValue;
      ex.Sub_Id =Convert.ToInt32(DropDownList1.Text);
      ex.IsLocked = IsLockedCHK.Checked;
      ex.IsDeleted = IsDelCHK.Checked;
  
      ent.Exam_Master.Add(ex);
      ent.SaveChanges();


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Exam_Master
                  where t.Exam_Id == id
                  select t;

        Exam_Master ex = lis.FirstOrDefault();
        ex.Exam_Name = TxtExamName.Text;
        ex.Duration = Convert.ToInt64(TxtDuration.Text);
        ex.N_O_Q = Convert.ToInt32(TxtN_O_Q.Text);
        ex.Date_Of_Exam = Convert.ToDateTime(TxtDate_Of_Exam.Text);
        ex.Allow_Practice = AllowPracticeCHK.Checked;
        ex.D_O_E = DateTime.Now;
        ex.D_O_M = DateTime.Now;
        ex.Mode = RadioButtonList1.SelectedValue;
        ex.Sub_Id = Convert.ToInt32(DropDownList1.Text);
        ex.IsLocked = IsLockedCHK.Checked;
        ex.IsDeleted = IsDelCHK.Checked;
        
      
        ent.SaveChanges();



    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Page.IsPostBack == false)
        {
            string s = Request.QueryString["cmd"];
            if (s == "Edit")
            {
                display_rec();
            }
            else
            {
                IsDelCHK.Enabled = false;
            }


            ViewState["exname"] = TxtExamName.Text;
            ViewState["duration"] = TxtDuration.Text;
            ViewState["noq"] = TxtN_O_Q.Text;
            ViewState["allprac"] = AllowPracticeCHK.Checked;
            ViewState["doe"] = TxtDate_Of_Exam.Text;
            ViewState["mode"] = RadioButtonList1.SelectedValue;
            ViewState["subid"] = DropDownList1.Text;
            ViewState["isdeleted"] = IsDelCHK.Checked;

        }
    }
    protected void BtnSave_Click(object sender, EventArgs e)
    {
        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
            edit_rec();
        }
        else
        {
            Add_rec();
        }

        Response.Redirect("~/Admin/ViewExam.aspx");
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
            TxtExamName.Text = ViewState["exname"].ToString();
            TxtDuration.Text = ViewState["duration"].ToString();
            TxtN_O_Q.Text = ViewState["noq"].ToString();
            AllowPracticeCHK.Checked = Convert.ToBoolean(ViewState["allprac"]);
            TxtDate_Of_Exam.Text = ViewState["doe"].ToString();
            RadioButtonList1.SelectedValue = ViewState["mode"].ToString();
            DropDownList1.Text = ViewState["subid"].ToString();
            IsDelCHK.Checked = Convert.ToBoolean(ViewState["isdeleted"]);



        }
        else
        {
            TxtExamName.Text = " ";
            TxtDuration.Text = " ";
            TxtN_O_Q.Text = " ";
            AllowPracticeCHK.Checked = false;
            TxtDate_Of_Exam.Text = " ";
            RadioButtonList1.SelectedValue = "Manual";
            DropDownList1.Text = "Null";
            IsDelCHK.Checked = false;

        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewExam.aspx");
    }
}