using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewStudent : System.Web.UI.Page
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
        var lis = from t in ent.Student_Master
                  where t.Stu_Id == id
                  select t;
        Student_Master s = lis.FirstOrDefault();
        TxtSId.Text = s.Stu_Id.ToString();
        TxtSName.Text = s.Stu_Name;
        TxtCNo.Text = s.Contact_Number;
        TxtGender.Text = s.Gender;
        TxtCity.Text = s.City.ToString();
        TxtState.Text = s.State.ToString();
        TxtD_O_B.Text = s.D_O_B.ToString().Substring(0, 9);
        TxtAge.Text = s.Age.ToString();
        TxtEmail.Text = s.Email_Id;
        TxtP_C_No.Text = s.Parents_ContactNo;
        TxtP_Email.Text = s.Parents_EmailId;
        TxtD_O_J.Text = s.D_O_J.ToString().Substring(0, 9);
        TxtD_O_E.Text = s.D_O_E.ToString().Substring(0, 9);
        TxtD_O_M.Text = s.D_O_M.ToString().Substring(0, 9);
        TxtSemId.Text = s.Sem_Id.ToString();

        StudentImage.ImageUrl = "~/Admin/StudentImage/" + s.Stu_Image;
        
        IsDelCHK.Checked = Convert.ToBoolean(s.IsDeleted);
    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1";
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Response.Redirect("~/Admin/AddEditStudent.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "BtnDelete")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Student_Master
                      where t.Stu_Id == id
                      select t;
            Student_Master s = lis.FirstOrDefault();
            s.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditStudent.aspx?cmd=Add");
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Stu_Id")
        {

            EntityDataSource1.Where = "it.[Stu_Id]='" + TextBox1.Text + "'";
        }
        else
        {
            EntityDataSource1.Where = "it.[Stu_Name]='" + TextBox1.Text + "'";
        }
    }
}