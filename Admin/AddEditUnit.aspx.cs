using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditUnit : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    void Add_rec()
    {
        decimal sub =Convert.ToDecimal(DropDownList1.Text);
        decimal sem =Convert.ToDecimal(DropDownList2.Text);
        var subsem = from ss in ent.Subject_Semester where ss.Sem_Id == sem && ss.Sub_Id == sub select ss;
        Subject_Semester s = subsem.FirstOrDefault();
        if (s == null)
        {
            Subject_Semester s1 = new Subject_Semester();
            s1.Sub_Id = sub;
            s1.Sem_Id = sem;
            ent.Subject_Semester.Add(s1);
            ent.SaveChanges();
        }
        Unit u = new Unit();
        u.Unit_Name = TxtUName.Text;
        u.Unit_Description = TxtUDesc.Text;
        u.SubSem_Id = s.SubSem_Id;
        u.IsDeleted = IsDelCHK.Checked;
        u.D_O_E = DateTime.Now;
        u.D_O_M = DateTime.Now;
        ent.Units.Add(u);
        ent.SaveChanges();


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Units
                  where t.Unit_Id == id
                  select t;
        decimal sub = Convert.ToDecimal(DropDownList1.Text);
        decimal sem = Convert.ToDecimal(DropDownList2.Text);
        var subsem = from ss in ent.Subject_Semester where ss.Sem_Id == sem && ss.Sub_Id == sub select ss;
        Subject_Semester s = subsem.FirstOrDefault();
        if (s == null)
        {
            Subject_Semester s1 = new Subject_Semester();
            s1.Sub_Id = sub;
            s1.Sem_Id = sem;
            ent.Subject_Semester.Add(s1);
            ent.SaveChanges();
        }
        Unit u = lis.FirstOrDefault();
        u.Unit_Name = TxtUName.Text;
        u.Unit_Description = TxtUDesc.Text;
        u.IsDeleted = IsDelCHK.Checked;
        ent.SaveChanges();



    }
    void display_rec()
    {
       
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Units
                  where t.Unit_Id == id
                  select t;
        Unit u = lis.FirstOrDefault();
        var sub = from s in ent.Subject_Semester where s.SubSem_Id == u.SubSem_Id select s;
        Subject_Semester ss = sub.FirstOrDefault();
        DropDownList2.Text = ss.Sem_Id.ToString();
        DropDownList1.Text = ss.Sub_Id.ToString();
        TxtUName.Text = u.Unit_Name;
        TxtUDesc.Text = u.Unit_Description;
        IsDelCHK.Checked = Convert.ToBoolean(u.IsDeleted);

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
            ViewState["Unit_Name"] = TxtUName.Text;
            ViewState["Unit_Description"] = TxtUDesc.Text;
            ViewState["IsDeleted"] = IsDelCHK.Checked;

        }
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
            TxtUName.Text = ViewState["Unit_Name"].ToString();

            TxtUDesc.Text = ViewState["Unit_Description"].ToString();

            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);

        }
        else
        {
            TxtUDesc.Text = "";
            TxtUName.Text = "";

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
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewUnit.aspx");
    }
   
}