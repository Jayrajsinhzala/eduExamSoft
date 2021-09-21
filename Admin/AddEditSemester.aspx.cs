using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditSemester : System.Web.UI.Page
{
    
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    void Add_rec()
    {
        Semester sem = new Semester();
        sem.Sem_Description = TxtDescription.Text;
        sem.IsDeleted = IsDelCHK.Checked;
        sem.D_O_E = DateTime.Now;
        sem.D_O_M = DateTime.Now;
        ent.Semesters.Add(sem);
        ent.SaveChanges();
        

    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Semesters
                  where t.Sem_Id == id
                  select t;
        Semester sem = lis.FirstOrDefault();
        sem.Sem_Description = TxtDescription.Text;
        sem.IsDeleted = IsDelCHK.Checked;
        sem.D_O_M = DateTime.Now;
        ent.SaveChanges();



    }
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Semesters
                  where t.Sem_Id == id
                  select t;
        Semester sem = lis.FirstOrDefault();
        TxtDescription.Text = sem.Sem_Description;
        IsDelCHK.Checked = Convert.ToBoolean(sem.IsDeleted);

    }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }


        if (Page.IsPostBack == false)
        {
            string s = Request.QueryString["cmd"];
            if (s == "Edit")
            {
                display_rec();
            }
            ViewState["Sem_Description"] = TxtDescription.Text;
            ViewState["IsDeleted"] = IsDelCHK.Checked;

        }
    }
    protected void BtnADD_Click(object sender, EventArgs e)
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
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
           
            TxtDescription.Text = ViewState["Sem_Description"].ToString();

            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);

        }
        else
        {
            TxtDescription.Text = "";

        }
       
           

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewSemester.aspx");
    }
}