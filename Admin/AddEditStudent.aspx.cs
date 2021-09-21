using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class AddEditStudent : System.Web.UI.Page
{
    eduExamSoftDBEntities ent = new eduExamSoftDBEntities();
    void display_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Student_Master
                  where t.Stu_Id == id
                  select t;
        Student_Master s = lis.FirstOrDefault();
        TxtName.Text = s.Stu_Name;
        TxtCno.Text = s.Contact_Number;
        TxtGender.Text = s.Gender;
        TxtCity.Text = s.City;
        TxtState.Text = s.State;
        TxtD_O_B.Text = s.D_O_B.ToString();
        TxtEmail.Text = s.Email_Id;
        TxtPCNo.Text = s.Parents_ContactNo;
        TxtPEmail.Text = s.Parents_EmailId;
        DropDownList1.Text = s.Sem_Id.ToString();
       
        IsDelCHK.Checked = Convert.ToBoolean(s.IsDeleted);
        Image1.ImageUrl = "~/Admin/StudentImage/" + s.Stu_Image;
    }
    void Add_rec()
    {
        Student_Master s = new Student_Master();
        s.Stu_Name = TxtName.Text;
        s.Contact_Number = TxtCno.Text;
        s.Gender = TxtGender.Text;
        s.City = TxtCity.Text;
        s.State = TxtState.Text;
        s.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        s.Age = CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        s.Email_Id = TxtEmail.Text;
        s.Parents_ContactNo = TxtPCNo.Text;
        s.Parents_EmailId = TxtPEmail.Text;
        s.D_O_J = DateTime.Now;
        s.D_O_E = DateTime.Now;
        s.D_O_M = DateTime.Now;
        //s.Stu_Image = ViewState["Image"].ToString();
        s.Sem_Id = Convert.ToInt16(DropDownList1.SelectedValue);
        s.IsDeleted = IsDelCHK.Checked;

        if (ViewState["Image"] != null)
        {
            s.Stu_Image = ViewState["Image"].ToString();
        }
        else
        {

        }
        ent.Student_Master.Add(s);
        ent.SaveChanges();


    }
    void edit_rec()
    {
        int id = Convert.ToInt16(Request.QueryString["Id"]);
        var lis = from t in ent.Student_Master
                  where t.Stu_Id == id
                  select t;
        Student_Master s = lis.FirstOrDefault();
        s.Stu_Name = TxtName.Text;
        s.Contact_Number = TxtCno.Text;
        s.Gender = TxtGender.Text;
        s.City = TxtCity.Text;
        s.State = TxtState.Text;
        s.D_O_B = Convert.ToDateTime(TxtD_O_B.Text);
        s.Age = CalculateAge(Convert.ToDateTime(TxtD_O_B.Text));
        s.Email_Id = TxtEmail.Text;
        s.Parents_ContactNo = TxtPCNo.Text;
        s.Parents_EmailId = TxtPEmail.Text;
        s.IsDeleted = IsDelCHK.Checked;
        s.D_O_M = DateTime.Now;
        if (ViewState["Img"] != null)
        {
            s.Stu_Image = ViewState["Img"].ToString();
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
            ViewState["Stu_Name"] = TxtName.Text;
            ViewState["Contact_Number"] = TxtCno.Text;
            ViewState["Gender"] = TxtGender.Text;
            ViewState["City"] = TxtCity.Text;
            ViewState["State"] = TxtState.Text;
            ViewState["D_O_B"] = TxtD_O_B.Text;
            ViewState["Email_Id"] = TxtEmail.Text;
            ViewState["Parents_ContactNo"] = TxtPCNo.Text;
            ViewState["Parents_Email"] = TxtPEmail.Text;
            ViewState["Sem_Id"] = DropDownList1.DataTextField;
           
            ViewState["Img"] = Image1.ImageUrl;
            ViewState["IsDeleted"] = IsDelCHK.Checked;

        }
    }
    private int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear <= dateOfBirth.DayOfYear)
        {
            age = age - 1;
        }
        return age;
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

        Response.Redirect("~/Admin/ViewStudent.aspx");

    }
    protected void BtnCancel_Click(object sender, EventArgs e)
    {
        string s = Request.QueryString["cmd"];
        if (s == "Edit")
        {
            TxtName.Text = ViewState["Stu_Name"].ToString();
            TxtCno.Text = ViewState["Contact_Number"].ToString();
            TxtGender.Text = ViewState["Gender"].ToString();
            TxtCity.Text = ViewState["City"].ToString();
            TxtState.Text = ViewState["State"].ToString();
            TxtD_O_B.Text = ViewState["D_O_B"].ToString();
            TxtEmail.Text = ViewState["Email_Id"].ToString();
            TxtPCNo.Text = ViewState["Parents_ContactNo"].ToString();
            TxtPEmail.Text = ViewState["Parents_Email"].ToString();
            DropDownList1.DataTextField = ViewState["Sem_Id"].ToString();
           
            Image1.ImageUrl = ViewState["Img"].ToString();
            IsDelCHK.Checked = Convert.ToBoolean(ViewState["IsDeleted"]);

        }
        else
        {
            TxtName.Text = "";
            TxtCno.Text = "";   
            TxtCity.Text = "";
            TxtState.Text = "";
            TxtD_O_B.Text = "";
            TxtEmail.Text = "";
            TxtPCNo.Text = "";
            TxtPEmail.Text = "";
            DropDownList1.Text = "";
            TxtGender.Text = "";
            Image1.ImageUrl = "";
            IsDelCHK.Checked = Convert.ToBoolean("false");


        }
    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewStudent.aspx");
    }
    protected void BtnUpload_Click(object sender, EventArgs e)
    {
        if (FileUpload1.HasFile == true)
        {
            String spath = MapPath("StudentImage");
            FileUpload1.SaveAs(spath + "\\" + FileUpload1.FileName);
            ViewState["Image"] = FileUpload1.FileName;
            Image1.ImageUrl = "~/Admin/StudentImage/" + FileUpload1.FileName;

        }
    }
}