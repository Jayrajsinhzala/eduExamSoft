using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditSubject : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Subject_Master
                  where t.Sub_Id == id
                  select t;
        Subject_Master sub = lis.FirstOrDefault();
        TxtDesc.Text = sub.Sub_Description;
        IsDelCHK.Checked = Convert.ToBoolean(sub.IsDeleted);

    }
    void Add_rec()
    {
        Subject_Master sub = new Subject_Master();
        sub.Sub_Description = TxtDesc.Text;
        sub.IsDeleted = IsDelCHK.Checked;
        sub.D_O_E = DateTime.Now;
        sub.D_O_M = DateTime.Now;
        ent.Subject_Master.Add(sub);
        ent.SaveChanges();


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Subject_Master
                  where t.Sub_Id == id
                  select t;
        Subject_Master sub = lis.FirstOrDefault();
        sub.Sub_Description = TxtDesc.Text;
        sub.IsDeleted = IsDelCHK.Checked;
        sub.D_O_M = DateTime.Now;
        ent.SaveChanges();



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
            ViewState["Sub_Description"] = TxtDesc.Text;
            ViewState["IsDeleted"] = IsDelCHK.Checked;

        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewSubject.aspx");
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

            TxtDesc.Text = ViewState["Sub_Description"].ToString();

            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);

        }
        else
        {
            TxtDesc.Text = "";

        }
       
    }
}