using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class ConcernedQuestion : System.Web.UI.Page
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
            int id = Convert.ToInt16(Request.QueryString["cmd"]);
            EntityDataSource1.Where = "it.[Exam_Id] =" + id;
            if (ViewState["id"] == null)
            {
                ViewState["id"] = Request.QueryString["cmd"];

            }
            BtnGenrateRandomQuestion.Visible = false;

            var lis = from t in ent.Exam_Master where t.Exam_Id == id select t;
            Exam_Master ex = lis.FirstOrDefault();
            if (ex.Mode == "Random")
            {
                var exques = from q in ent.Exam_Question where q.Exam_Id == id select q;
                Exam_Question qq = exques.FirstOrDefault();
                if (qq == null)
                {
                    BtnGenrateRandomQuestion.Visible = true;
                }
            }


        }
    }
    protected void GridView2_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {

        int cnt = 0;
        int id = Convert.ToInt16(Request.QueryString["cmd"]);
        var lis1 = from t in ent.Exam_Master where t.Exam_Id == id select t;
        Exam_Master ex = lis1.FirstOrDefault();
        if (ex.IsLocked == true)
        {
            Label1.Text = "This Exam is Locked  So you cannot add new question.....";
        }
        else
        {
            GridView2.Visible = true;
        }
        GridView3.Visible = true;
        int ex_id = Convert.ToInt16(GridView1.SelectedValue);
        var lis = from t in ent.Exam_Question where t.Exam_Id == ex_id select t;

        foreach (var l in lis)
        {
            cnt = cnt + 1;
            int s = Convert.ToInt16(l.Exam_Id);

        }
        ViewState["noq"] = cnt;
        EntityDataSource3.Where = "it.[Exam_Id] =" + ex_id;


        
    }
    public void autogeneratequestion(decimal examid, decimal qsize)
    {
        using (eduExamSoftDBEntities ent = new eduExamSoftDBEntities())
        {
            decimal max = (from x1 in ent.Question_Bank select x1.Question_Id).Count();
            var qallocated = from x in ent.Exam_Question where x.Exam_Id == examid select x;
            int allocatedques = qallocated.ToList().Count;
            List<Exam_Question> qa = qallocated.ToList();
            for (int i = allocatedques; i < qsize; i++)
            {
                Random rnd = new Random();
                int q_no = Convert.ToInt32(rnd.Next(1, (int)max + 1));
                //var q_bnk=from qb in ent.QUESTION_BANK where qb.Question_Id ==(decimal)q_no select qb;
                //QUESTION_BANK qexist = q_bnk.FirstOrDefault();
                var src = from x in ent.Exam_Question where x.Exam_Id == examid && x.Question_Id == q_no select x;
                Exam_Question exq = src.FirstOrDefault();
                if (exq == null)
                {
                    bool exqb = qa.Any(a => a.Question_Id == q_no);
                    if (exqb == false)
                    {
                        Exam_Question exques = new Exam_Question();
                        exques.Exam_Id = examid;
                        exques.Question_Id = q_no;
                        qa.Add(exques);
                    }
                    else
                    {
                        i--;
                    }


                }
            }
            foreach (var temp in qa)
            {
                ent.Exam_Question.Add((Exam_Question)temp);
            }
            ent.SaveChanges();

        }
         BtnGenrateRandomQuestion.Visible = false;

    }
    protected void BtnBack_Click(object sender, EventArgs e)
    {
        Response.Redirect("~/Admin/ViewExam.aspx");
    }
    protected void BtnGenrateRandomQuestion_Click(object sender, EventArgs e)
    {
        decimal id = Convert.ToDecimal(Request.QueryString["cmd"]);
        var lis1 = from t in ent.Exam_Master where t.Exam_Id == id select t;
        Exam_Master ex = lis1.FirstOrDefault();


        autogeneratequestion(id,Convert.ToDecimal(ex.N_O_Q));
        ex.IsLocked = true;
        ent.SaveChanges();
        GridView3.Visible = true;
        var ques = from qes in ent.Exam_Question where qes.Exam_Id == id select qes;

        EntityDataSource3.Where = "it.[Exam_Id] =" + id;
    }
    protected void GridView2_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        int noq = Convert.ToInt16(ViewState["noq"]);

        if (e.CommandName == "Add")
        {
            int id = Convert.ToInt16(Request.QueryString["cmd"]);
            var lis = from t in ent.Exam_Master where t.Exam_Id == id select t;
            Exam_Master ex = lis.FirstOrDefault();

            noq++;
            if (noq <= ex.N_O_Q)
            {

                int q_id = Convert.ToInt16(e.CommandArgument);
                int ex_id = Convert.ToInt16(ViewState["id"]);
                Exam_Question exam_ques = new Exam_Question();

                exam_ques.Exam_Id = ex_id;
                exam_ques.Question_Id = q_id;
                ent.Exam_Question.Add(exam_ques);
                ent.SaveChanges();


                EntityDataSource3.Where = "it.[Exam_Id] =" + ex_id;
                GridView3.DataBind();
            }
            else
            {
                ex.IsLocked = true;
                ent.SaveChanges();
                Label1.Text = "Sorry This Exam Is Locked....";
            }

        }
    }
    protected void GridView3_RowCommand(object sender, GridViewCommandEventArgs e)
    {
        if (e.CommandName == "BtnDelete")
        {

            int qu_id = Convert.ToInt16(e.CommandArgument);
            int ex_id = Convert.ToInt16(ViewState["id"]);
            var lis = from t in ent.Exam_Question where t.Question_Id == qu_id && t.Exam_Id == ex_id select t;
            Exam_Question ex = lis.FirstOrDefault();
            ent.Exam_Question.Remove(ex);
            ent.SaveChanges();
            EntityDataSource3.Where = "it.[Exam_Id] =" + ex_id;

            GridView3.DataBind();

        }
    }
}