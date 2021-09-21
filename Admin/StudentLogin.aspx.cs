using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class student_StudentLogin : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void submit1_Click(object sender, ImageClickEventArgs e)
    {
        {
            var lis = from t in ent.Login_Master where t.Login_Name == url.Text && t.Login_Password == Password1.Text select t;
            Login_Master log = lis.FirstOrDefault();
            Session["Stu_Id"] = log.Stu_Id;
            Session["loginname"] = log.Login_Name;
            Session["LoginType"] = log.Login_Type;


            if (log == null)
            {
                //msg in label
            }

            else
            {
                if (log.IsOtpGenrate == true)
                {
                    log.IsOtpGenrate = false;
                    log.Otp = null;
                    ent.SaveChanges();
                    Response.Redirect("~/Admin/ChangePassword.aspx");
                }
                if (log.Login_Type == "Student")
                {
                    Response.Redirect("~/StudentN/index.html");
                }
                

            }


        }
    }
}