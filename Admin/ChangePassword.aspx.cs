using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ChangePassword : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }
    }
    //protected void Page_PreInit(object sender, EventArgs e)
    //{
    //    if (Session["LoginType"] != null)
    //    {
    //        string type = Session["LoginType"].ToString();
    //        if (type == "Admin")
    //        {
    //            this.MasterPageFile = "~/Admin/eduExamMaster.master";
    //        }
    //        else
    //        {
    //            this.MasterPageFile = "~/studentN/StudentMasterPage.master";
    //        }  
    //    }
    //}

    protected void BtnUpdate_Click(object sender, EventArgs e)
    {
        string logName=  Session["loginname"].ToString();
        var lis = from t in ent.Login_Master where t.Login_Name == logName select t;
        Login_Master   log = lis.FirstOrDefault();
        if (log.Login_Password == TextBox1.Text)
        {
            log.Login_Password = TextBox2.Text;
            ent.SaveChanges();
            EmailSender.sendMail("Shalin jain", logName, null,"password updated");
        }
        else 
        {

            Label1.Text = "Please enter correct old passowrd";
        }
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/LoginNew.aspx");
    }
}