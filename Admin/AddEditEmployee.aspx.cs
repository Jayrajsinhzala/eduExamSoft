using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditEmployee : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    EduExamutil examutil = new EduExamutil();
    
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Employee_Master
                  where t.Emp_Id == id
                  select t;
        Employee_Master emp = lis.FirstOrDefault();
        TxtName.Text = emp.Emp_Name;
        TxtD_O_B.Text = emp.D_O_B.ToString();
        TxtCity.Text = emp.City;
        TxtState.Text = emp.State;
        TxtEDesignation.Text = emp.Emp_Designation;
        TxtCNo.Text = emp.Contact_Number;
        TxtEmail.Text = emp.Email_ID;
        TxtGender.Text = emp.Gender;
        IsDelCHK.Checked = Convert.ToBoolean(emp.IsDeleted);
        Image1.ImageUrl = "~/Admin/EmployeeImage/" + emp.Emp_Image;
    }
    void Add_rec()
    {
        Employee_Master emp = new Employee_Master();
        emp.Emp_Name = TxtName.Text;
        emp.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        int age = examutil.CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        emp.Age = age;  // CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        emp.City = TxtCity.Text;
        emp.State = TxtState.Text;
        emp.Emp_Designation = TxtEDesignation.Text;
        emp.D_O_J = DateTime.Now;
        emp.D_O_E = DateTime.Now;
        emp.D_O_M = DateTime.Now;
        emp.Contact_Number = TxtCNo.Text;
        emp.Email_ID = TxtEmail.Text;
        emp.Gender = TxtGender.Text;
        emp.IsDeleted = IsDelCHK.Checked;
        emp.Emp_Image = ViewState["Image"].ToString();

        String spath = MapPath("EmployeeImage");
        FileUpload1.SaveAs(spath + "\\" + ViewState["Image"].ToString());

        ent.Employee_Master.Add(emp);
        ent.SaveChanges();


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Employee_Master
                  where t.Emp_Id == id
                  select t;

        Employee_Master emp = lis.FirstOrDefault();
        emp.Emp_Name = TxtName.Text;
        emp.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        int age = examutil.CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        emp.Age = age;
        emp.City = TxtCity.Text;
        emp.State = TxtState.Text;
        emp.Emp_Designation = TxtEDesignation.Text;
        emp.Contact_Number = TxtCNo.Text;
        emp.Email_ID = TxtEmail.Text;
        emp.Gender = TxtGender.Text;
        emp.IsDeleted = IsDelCHK.Checked;
        emp.D_O_M = DateTime.Now;
        if (ViewState["Image"] != null)
        {
            emp.Emp_Image = ViewState["Image"].ToString();
        }
        else
        {

        }
        ent.SaveChanges();



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
            ViewState["Emp_Name"]       = TxtName.Text;
            ViewState["D_O_B"]          = TxtD_O_B.Text;
            ViewState["City"]           = TxtCity.Text;
            ViewState["State"]          = TxtState.Text;
            ViewState["Emp_Designation"]= TxtEDesignation.Text;
            ViewState["Contact_Number"] = TxtCNo.Text;
            ViewState["Email_Id"]       = TxtEmail.Text;
            ViewState["Gender"]         = TxtGender.Text;
            ViewState["Img"] =  Image1.ImageUrl;
            ViewState["IsDeleted"]      = IsDelCHK.Checked;

        }
    }
   /* private int CalculateAge(DateTime dateOfBirth)
    {
      int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear <= dateOfBirth.DayOfYear)
        {
            age = age - 1;
        }
        return age;
    }*/
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

        Response.Redirect("~/Admin/ViewEmployee.aspx");

        
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewEmployee.aspx");
    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {

        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
            TxtName.Text=ViewState["Emp_Name"].ToString();
            TxtD_O_B.Text=ViewState["D_O_B"].ToString();
            TxtCity.Text=ViewState["City"].ToString();
            TxtState.Text=ViewState["State"].ToString();
            TxtEDesignation.Text=ViewState["Emp_Designation"].ToString();
            TxtCNo.Text=ViewState["Contact_Number"].ToString();
            TxtEmail.Text=ViewState["Email_Id"].ToString();
            TxtGender.Text=ViewState["Gender"].ToString();
            Image1.ImageUrl = ViewState["Img"].ToString();
            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);
            
        }
        else
        {
            TxtName.Text= "";
            TxtD_O_B.Text= "";
            TxtCity.Text= "";
            TxtState.Text= "";
            TxtEDesignation.Text = "";
            TxtCNo.Text = "";
            TxtEmail.Text = "";
            TxtGender.Text = "";
            Image1.ImageUrl = "";
            

        }
    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            String spath = MapPath("EmployeeImage");
            FileUpload1.SaveAs(spath + "\\" + FileUpload1.FileName);
            ViewState["Image"] = FileUpload1.FileName;
            Image1.ImageUrl = "~/Admin/EmployeeImage/" + FileUpload1.FileName;

        }
    }
}