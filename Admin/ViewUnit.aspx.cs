using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewUnit : System.Web.UI.Page
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
        var lis = from t in ent.Units
                  where t.Unit_Id == id
                  select t;
        Unit u = lis.FirstOrDefault();
        TxtUnitId.Text = u.Unit_Id.ToString();
        TxtSubSemId.Text = u.SubSem_Id.ToString();
        TxtUName.Text = u.Unit_Name;
        TxtUDesc.Text = u.Unit_Description;
        TxtD_O_E.Text = u.D_O_E.ToString();
        TxtD_O_M.Text = u.D_O_M.ToString();
        IsDelCHK.Checked = Convert.ToBoolean(u.IsDeleted);
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {

         if (e.CommandName == "BtnEdit")
        {
            Response.Redirect("~/Admin/AddEditUnit.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
         if (e.CommandName == "BtnDel")
         {
             int id = Convert.ToInt16(e.CommandArgument);
             var lis = from t in ent.Units
                       where t.Unit_Id == id
                       select t;
             Unit u = lis.FirstOrDefault();
             u.IsDeleted = true;
             ent.SaveChanges();
             GridView1.DataBind();
         }
    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1";
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditUnit.aspx?cmd=Add");
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Unit_Id")
        {

            EntityDataSource1.Where = "it.[Unit_Id]='" + DropDownList1.Text + "'";
        }
    }
}