using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class CreateUser : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    EduExamutil examutil = new EduExamutil();
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["loginname"] == null)
        {
            Response.Redirect("~/Admin/LoginNew.aspx");
        }
    }
    protected void BtnSubmit_Click(object sender, EventArgs e)
    {
        Employee_Master emp = new Employee_Master();
        emp.Emp_Name = TxtEmpName.Text;
        emp.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        int age = examutil.CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        emp.Age = age;  
        emp.City = TxtCity.Text;
        emp.State = TxtState.Text;
        emp.Emp_Designation = DropDownList1.SelectedValue;
        emp.D_O_J = DateTime.Now;
        emp.D_O_E = DateTime.Now;
        emp.D_O_M = DateTime.Now;
        emp.Contact_Number = TxtContactNumber.Text;
        emp.Email_ID = TxtEmailId.Text;
        emp.Gender = TxtGender.Text;
        emp.Emp_Image = ViewState["img"].ToString();

        String spath = MapPath("EmployeeImage");
        FileUpload1.SaveAs(spath + "\\" + ViewState["img"].ToString());

        ent.Employee_Master.Add(emp);
        ent.SaveChanges();

        Login_Master log = new Login_Master();
        log.Login_Name = TxtLoginName.Text;
        log.Login_Password = TxtPassword.Text;
        log.Security_Question = DropDownList1.SelectedValue;
        log.Security_Answer = TxtSecurity_Answer.Text;
        log.Login_Type = "Employee";
        log.Emd_Id = emp.Emp_Id;
        log.D_O_E = DateTime.Now;
        log.D_O_M = DateTime.Now;
        log.IsOtpGenrate = false;
        log.IsDeleted = false;

    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            String spath = MapPath("EmployeeImage");
            FileUpload1.SaveAs(spath + "\\" + FileUpload1.FileName);
            ViewState["Image"] = FileUpload1.FileName;
            Image1.ImageUrl = "~\\EmployeeImage\\" + FileUpload1.FileName;

        }
    }
}