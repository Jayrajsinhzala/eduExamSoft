using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditQuestionBank : System.Web.UI.Page
{
    eduExamSoftDBEntities ent=new eduExamSoftDBEntities();
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Question_Bank
                  where t.Question_Id == id
                  select t;
      // var lis2 = from x in ent.Question_Type
        //          where x.Question_Type_Id == id
          //        select x;
        //Question_Type type = lis2.FirstOrDefault();
        Question_Bank q = lis.FirstOrDefault();

        if (q == null)
        {
            TxtQuestion.Text = "Not Found ";
        }
        else
        {

            DropDownList1.Text = q.Question_Type_Id.ToString();
            TxtQuestion.Text = q.Question;
            DropDownList2.Text = q.Unit_Id.ToString();
            IsDelCHK.Checked = Convert.ToBoolean(q.IsDeleted);


        }
    }
    void Add_rec()
    {

        Question_Bank q = new Question_Bank();
        q.Question_Type_Id = Convert.ToInt16(DropDownList1.SelectedValue);
        q.Question = TxtQuestion.Text;
        q.D_O_E = DateTime.Now;
        q.D_O_M = DateTime.Now;


        q.Emp_Id = Convert.ToInt16(Session["empid"]);

        q.Unit_Id = Convert.ToInt16(DropDownList2.Text);
        q.IsDeleted = IsDelCHK.Checked;
        ent.Question_Bank.Add(q);

        ent.SaveChanges();
        Response.Redirect("~/Admin/ViewQuestion_Bank.aspx");


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Question_Bank where t.Question_Id == id select t;
        Question_Bank q = lis.FirstOrDefault();
        q.Question_Type_Id = Convert.ToDecimal(DropDownList1.Text);
        q.Question = TxtQuestion.Text;
        q.D_O_M = DateTime.Now;
       // q.Emp_Id = Convert.ToDecimal(Session["empid"]);
        q.Unit_Id = Convert.ToInt16(DropDownList2.Text);
        q.IsDeleted = IsDelCHK.Checked;
        ent.SaveChanges();

        Response.Redirect("~/Admin/ViewQuestionBank.aspx");
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
            else
            {
                IsDelCHK.Enabled = false;
            }

            ViewState["Question_Type_Id"] = DropDownList1.DataTextField;
            ViewState["Question"] = TxtQuestion.Text;
            ViewState["Unit"] = DropDownList2.DataTextField;
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
            TxtQuestion.Text = ViewState["Question"].ToString();
            DropDownList1.DataTextField= ViewState["Question_Type_Id"].ToString();
            DropDownList2.DataTextField = ViewState["Unit"].ToString();
            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);


        }
        else
        {
            DropDownList1.Text = "";
            TxtQuestion.Text = " ";
            DropDownList2.Text = " ";
            IsDelCHK.Checked = Convert.ToBoolean("false");
        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewQuestionBank.aspx");
    }
}