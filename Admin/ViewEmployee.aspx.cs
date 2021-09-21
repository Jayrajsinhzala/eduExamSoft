using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewEmployee : System.Web.UI.Page
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
        var lis = from t in ent.Employee_Master
                  where t.Emp_Id == id
                  select t;
        Employee_Master emp = lis.FirstOrDefault();
        TxtEID.Text = emp.Emp_Id.ToString();
        TxtEName.Text = emp.Emp_Name;
        TxtD_O_B.Text = emp.D_O_B.ToString().Substring (0,9);
        TxtAge.Text = emp.Age.ToString();
        TxtCity.Text = emp.City.ToString();
        TxtState.Text = emp.State.ToString();
        TxtDesignation.Text = emp.Emp_Designation;
        TxtD_O_J.Text = emp.D_O_J.ToString().Substring(0, 9);
        TxtD_O_E.Text = emp.D_O_E.ToString().Substring(0, 9);
        TxtD_O_M.Text = emp.D_O_M.ToString().Substring(0, 9);
        TxtCNo.Text = emp.Contact_Number;
        TxtEmail.Text = emp.Email_ID;
        EmpImg.ImageUrl = "~/Admin/EmployeeImage/" + emp.Emp_Image;
        TxtGender.Text = emp.Gender;
        IsDelCHK.Checked = Convert.ToBoolean(emp.IsDeleted);

        //The Below Code Is For Selected Subject For Selected Emplpoyee On Checkbox

        var lis1 = from x in ent.Employee_Subject where x.Emp_Id == emp.Emp_Id select x;
        foreach (ListItem ll in CheckBoxList1.Items)
        {
            ll.Selected = false;
        }


        foreach (var l in lis1)
        {
            foreach (ListItem ll in CheckBoxList1.Items)
            {
                if (l.Sub_Id ==Convert.ToInt16( ll.Value))
                {
                    ll.Selected = true;
                }
            }
        }
    }

    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Emp_Id")
        {

            EntityDataSource1.Where = "it.[Emp_Id]='" + TextBox1.Text + "'";
        }
        else
        {
            EntityDataSource1.Where = "it.[Emp_Designation]='" + TextBox1.Text + "'";
        }
    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1"; 
    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditEmployee.aspx?cmd=Add");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "BtnEdit")
        {
            Response.Redirect("~/Admin/AddEditEmployee.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "BtnDel")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Employee_Master
                      where t.Emp_Id == id
                      select t;
            Employee_Master emp = lis.FirstOrDefault();
            emp.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
    }
    protected void GridView1_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        string str;
        if (e.Row.RowType == DataControlRowType.DataRow)
        {
            str = DataBinder.Eval(e.Row.DataItem, "IsDeleted").ToString();

            ImageButton img = (ImageButton)e.Row.FindControl("ImgDelete");

            if (str == "True")
            {
                img.Enabled = false;

            }
            else
            {
                img.Enabled = true;
            }
        }

    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        decimal d = Convert.ToDecimal(GridView1.SelectedValue);
        var lis = from x in ent.Employee_Master where x.Emp_Id == d select x;
        Employee_Master emp = lis.FirstOrDefault();
        foreach (ListItem i in CheckBoxList1.Items)
        {
            if (i.Selected == true)
            {
                bool a1 = false;
                var lis1 = from x in ent.Employee_Subject where x.Emp_Id == emp.Emp_Id select x;
                foreach (var v in lis1)
                {
                    if (v.Sub_Id == Convert.ToInt16( i.Value))
                    {
                        a1 = true;
                    }
                }
                if (a1 == false)
                {
                    Employee_Subject es = new Employee_Subject() ;
                  //  { Emp_Id = d, Sub_Id =Convert.ToDecimal( i.Text) }
                    es.Emp_Id = d;
                    es.Sub_Id = Convert.ToInt16(i.Value);
                    ent.Employee_Subject.Add(es);
                    ent.SaveChanges();
                }
            }
        }
    }
}
