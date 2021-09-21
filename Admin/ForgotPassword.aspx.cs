using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ForgotPassword : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Btnsave_Click(object sender, EventArgs e)
    {

        String logName = TxtUserName.Text;
        var lis = from t in ent.Login_Master where t.Login_Name == logName select t;
        Login_Master log = lis.FirstOrDefault();
        if (log!=null)
        {
            EduExamutil otpUtil = new EduExamutil();
            String otp = otpUtil.GenerateOTP();
            EmailSender.sendForgotMail("Jayrajsinh Zala", logName, otp, "ONE TIME PASSWORD");
            log.Otp = otp;
            log.IsOtpGenrate = true;
            log.Login_Password = otp;
            ent.SaveChanges();
            Label1.Text = "One Time Password is sent on your registered email,please enter the same to procced.";
            Panel1.Visible = true;

        }
        else
        {

            //Label1.Text = "Please enter correct old passowrd";
        }
    }
    protected void BtnOtp_Click(object sender, EventArgs e)
    {
        String logName = TxtUserName.Text;
        var lis = from t in ent.Login_Master where t.Login_Name == logName select t;
        Login_Master log = lis.FirstOrDefault();
        if (log.Otp == TextBox1.Text)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }
        else
        {
            Label2.Text = " Please Enter Correct OTP";
        }
    }
}