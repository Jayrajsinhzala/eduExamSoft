using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewSubject : System.Web.UI.Page
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
        TxtId.Text = sem.Sem_Id.ToString();
        TxtDesc.Text = sem.Sem_Description;
        TxtD_O_E.Text = sem.D_O_E.ToString();
        TxtD_O_M.Text = sem.D_O_M.ToString();
        IsDelCHK.Checked = Convert.ToBoolean(sem.IsDeleted);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Btn_Edit")
        {
            Response.Redirect("~/Admin/AddEditSubject.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "Btn_Del")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Subject_Master
                      where t.Sub_Id == id
                      select t;
            Subject_Master sub = lis.FirstOrDefault();
            sub.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditSubject.aspx?cmd=Add");
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Sub_Id")
        {

            EntityDataSource1.Where = "it.[Sub_Id]='" + TextBox1.Text + "'";
        }
        else
        {
            EntityDataSource1.Where = "it.[Sub_Description]='" + TextBox1.Text + "'";
        }

    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1"; 
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
           string str;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            str = DataBinder.Eval(e.Row.DataItem, "IsDeleted").ToString();

            ImageButton img = (ImageButton )e.Row.FindControl("ImgDelete");
           
                if (str == "True")
                {
                    img.Enabled = false ;
            
                }
                else
                {
                    img.Enabled = true;
                }
            }

    }

}