using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ViewQuestionBank : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }
       
        if (Page.IsPostBack == false)
        {
            AddnewOptionPanel.Visible = false;
        }
    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        GridView2.Visible = true;
        Panel1.Visible = true;
        int id = Convert.ToInt16(GridView1.SelectedValue);
        ViewState["id"] = id;
        var lis = from t in ent.Question_Bank
                  where t.Question_Id == id
                  select t;
        Question_Bank q_bank = lis.FirstOrDefault();
        TxtQuestionId.Text = q_bank.Question_Id.ToString();
        TxtQuestion.Text = q_bank.Question;
        TxtQ_Type_Id.Text = q_bank.Question_Type_Id.ToString();
        TxtEmp_Id.Text = q_bank.Emp_Id.ToString();
        TxtUnit_Id.Text = q_bank.Unit_Id.ToString();
        TxtD_O_E.Text = q_bank.D_O_E.ToString();
        TxtD_O_M.Text = q_bank.D_O_M.ToString();
        IsDelCHK.Checked = Convert.ToBoolean(q_bank.IsDeleted);

        var lis2 = from x in ent.Question_Option
                       where x.Question_Id == id
                       select x;
           
         Question_Option option = lis2.FirstOrDefault();
         GridView2.DataSource = lis2.ToList();
         GridView2.DataBind();
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        GridView2.Visible = true;
        AddnewOptionPanel.Visible = true;
        
    }
    protected void BtnAddOption_Click(object sender, EventArgs e)
    {
        Question_Option opt = new Question_Option();
        opt.Question_Id = Convert.ToInt16(GridView1.SelectedValue);
        opt.Option_Description = TxtOptDesc.Text;
        opt.IsTrue = IsTrueCHK.Checked;
        ent.Question_Option.Add(opt);
        ent.SaveChanges();
        AddnewOptionPanel.Visible = false;

        int id = Convert.ToInt16(ViewState["id"]);
        var lis2 = from x in ent.Question_Option
                   where x.Question_Id == id
                   select x;
        Question_Option option = lis2.FirstOrDefault();
        GridView2.DataSource = lis2.ToList();
        GridView2.DataBind();
        TxtOptDesc.Text = "";
        IsTrueCHK.Checked = false;

    }
    protected void BtnAdd_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/AddEditQuestionBank.aspx?cmd=Add");
    }
    protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "Edit")
        {
            Response.Redirect("~/Admin/AddEditQuestionBank.aspx?Id=" + e.CommandArgument + "&cmd=Edit");
        }
        if (e.CommandName == "BtnDelete")
        {
            int id = Convert.ToInt16(e.CommandArgument);
            var lis = from t in ent.Question_Bank
                      where t.Question_Id == id
                      select t;
            Question_Bank q = lis.FirstOrDefault();
            q.IsDeleted = true;
            ent.SaveChanges();
            GridView1.DataBind();

        }
    }
    protected void BtnFilter_Click(object sender, EventArgs e)
    {
        if (RadioButtonList1.SelectedValue == "Question_Id")
        {

            EntityDataSource1.Where = "it.[Question_Id]='" + DropDownList1.Text + "'";
        }
    }
    protected void BtnRmv_Click(object sender, EventArgs e)
    {
        EntityDataSource1.Where = "1=1"; 
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {

        if (e.CommandName == "Edit")
        {
            AddnewOptionPanel.Visible = true;
            TxtOptDesc.Focus();
            decimal d = Convert.ToDecimal(e.CommandArgument);
            var lis2 = from x in ent.Question_Option where x.Question_Id == d select x;
            Question_Option opt = lis2.FirstOrDefault();
            //   opt = lis2.FirstOrDefault();
            TxtOptDesc.Text = opt.Option_Description;
            IsTrueCHK.Checked =Convert.ToBoolean(opt.IsTrue);
        }
        if (e.CommandName == "btnDelete")
        {
            decimal id = Convert.ToDecimal(e.CommandArgument);
            var lis = from x in ent.Question_Option where x.Option_Id == id select x;
            Question_Option q = lis.FirstOrDefault();
            ent.Question_Option.Remove(q);
            ent.SaveChanges();
            decimal qid = Convert.ToDecimal(ViewState["id"]);
            var lis2 = from x in ent.Question_Option where x.Question_Id == qid select x;
            Question_Option opt = lis2.FirstOrDefault(); 
            GridView2.DataSource = lis2;
            GridView2.DataBind();

        }
    }
}