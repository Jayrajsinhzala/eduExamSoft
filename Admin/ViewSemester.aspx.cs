using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewSemester : System.Web.UI.Page
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
        var lis = from t in ent.Semesters
                  where t.Sem_Id == id
                  select t;
        Semester sem = lis.FirstOrDefault();
        Txt_Id.Text = sem.Sem_Id.ToString();
        Txt_Desc.Text = sem.Sem_Description;
        Txt_D_O_E.Text = sem.D_O_E.ToString();
        Txt_D_O_M.Text = sem.D_O_M.ToString();
        IsDelCHK.Checked = Convert.ToBoolean(sem.IsDeleted);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "BtnEdit")
        {
            Response.Redirect("~/Admin/AddEditSemester.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "BtnDel")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Semesters
                      where t.Sem_Id == id
                      select t;
            Semester sem = lis.FirstOrDefault();
            sem.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditSemester.aspx?cmd=Add");
    }
    protected void BtnRMV_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1";
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Sem_Id")
        {

            EntityDataSource1.Where = "it.[Sem_Id]='" + TextBox1.Text + "'";
        }
        else
        {
            EntityDataSource1.Where = "it.[Sem_Description]='" + TextBox1.Text + "'";
        }
    }
}