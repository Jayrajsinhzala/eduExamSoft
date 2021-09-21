using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateNewStudent : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    EduExamutil examutil = new EduExamutil();
    protected void Page_Load(object sender, EventArgs e)
    {
       /* if (Session["loginname"] == null)
        {
            Response.Redirect("~\\LoginNew.aspx");
        }*/
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        Student_Master stu = new  Student_Master ();
        stu.Stu_Name = TxtStuName.Text;
        stu.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        int age = examutil.CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        stu.Age = age;
        stu.City = TxtCity.Text;
        stu.State = TxtState.Text;
        stu.Sem_Id =Convert.ToInt32 (DropDownList1.SelectedValue);
        stu.D_O_J = DateTime.Now;
        stu.D_O_E = DateTime.Now;
        stu.D_O_M = DateTime.Now;
        stu.Contact_Number = TxtContactNo.Text;
        stu.Email_Id = TxtEmailId.Text;
        stu.Parents_ContactNo = TxtParentsC_No.Text;
        stu.Parents_EmailId = TxtParentsEmail.Text;
        stu.Gender = TxtGender.Text;
        stu.Stu_Image = ViewState["Image"].ToString();

        String spath = MapPath("StudentImage");
        FileUpload1.SaveAs(spath + "\\" + ViewState["Image"].ToString());

        ent.Student_Master.Add(stu);
        ent.SaveChanges();

        Login_Master log = new Login_Master();
        log.Login_Name = TxtLoginName.Text;
        log.Login_Password = TxtPassword.Text;
        log.Security_Question = DropDownList1.SelectedValue;
        log.Security_Answer = TxtSecurity_Answer.Text;
        log.Login_Type = "Student";
        log.Stu_Id = stu.Stu_Id;
        log.D_O_E = DateTime.Now;
        log.D_O_M = DateTime.Now;
        log.IsOtpGenrate = false;
        log.IsDeleted = false;
        ent.Login_Master.Add(log);
        ent.SaveChanges();
    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            String spath = MapPath("StudentImage");
            FileUpload1.SaveAs(spath + "\\" + FileUpload1.FileName);
            ViewState["Image"] = FileUpload1.FileName;
            Image1.ImageUrl = "~\\StudentImage\\" + FileUpload1.FileName;

        }
    }
}