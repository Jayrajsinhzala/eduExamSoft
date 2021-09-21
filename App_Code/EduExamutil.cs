using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Web;



/// <summary>
/// Summary description for EduExamutil
/// </summary>
public class EduExamutil
{
    eduExamSoftDBEntities ent = null;
    SqlConnection cn = null;
    SqlCommand cmd = null;
    SqlDataAdapter da = null;
    DataSet ds = null;
    DataTable qdt;
    int pos;
	public EduExamutil()
	{
         ent = new eduExamSoftDBEntities();
         cn=getDBConnection();
		//
		// TODO: Add constructor logic here
		//
	}
     
    public  SqlConnection getDBConnection()
    {
        cn = new SqlConnection();
        cn.ConnectionString="Data Source=(LocalDB)\\v11.0;AttachDbFilename=E:\\Sem6\\project\\backup\\eduExam__Admin_Student_8feb\\App_Data\\eduExamSoftDB.mdf;Integrated Security=True;MultipleActiveResultSets=True;Application Name=EntityFramework";
        cn.Open();
        return cn;
    }


    public string GenerateOTP()
    {
        string alphabets = "ABCDEFGHIJKLMNOPQRSTUVWXYZ";
        string small_alphabets = "abcdefghijklmnopqrstuvwxyz";
        string numbers = "1234567890";

        string characters = numbers;
        //if (rbType.SelectedItem.Value == "1")
        {
            characters += alphabets + small_alphabets + numbers;
        }
        int length = 8;
        string otp = string.Empty;
        for (int i = 0; i < length; i++)
        {
            string character = string.Empty;
            do
            {
                int index = new Random().Next(0, characters.Length);
                character = characters.ToCharArray()[index].ToString();
            } while (otp.IndexOf(character) != -1);
            otp += character;
        }
        return otp;
    }
    public int CalculateAge(DateTime dateOfBirth)
    {
        int age = 0;
        age = DateTime.Now.Year - dateOfBirth.Year;
        if (DateTime.Now.DayOfYear <= dateOfBirth.DayOfYear)
        {
            age = age - 1;
        }
        return age;
    }

    public Dictionary<Question_Bank,List <Question_Option>> getMapForExamId(int ExamId)
    {
        var questionMap = new Dictionary<Question_Bank, List<Question_Option>>();
        var lis = (from t in ent.View_Exam_Question_Option where t.Exam_Id == ExamId select t).ToList();

        List<Question_Option> qsOptList = null;
        Question_Option qsOpt = null;
        Question_Bank question = null;
        if (lis != null)
        {
            
                //= new List<Question_Option>();
            foreach (var exQsOpt in lis)
            {
                question = new Question_Bank();
                question.Question_Id = exQsOpt.Question_Id;
                question.Question = exQsOpt.Question;
                if (questionMap.ContainsKey(question))
                {
                    qsOpt = new Question_Option();
                    qsOpt.Option_Id = exQsOpt.Option_Id;
                    qsOpt.Option_Description = exQsOpt.Option_Description;
                    qsOpt.Question_Id = exQsOpt.Question_Id;
                    qsOpt.IsTrue = exQsOpt.IsTrue;
                    qsOptList = questionMap[question];
                    qsOptList.Add(qsOpt);
                    questionMap[question] = qsOptList;
                   // questionMap.Add(exQsOpt.Question_Id, qsOptList);

                }
                else
                {
                    qsOptList = new List<Question_Option>();
                    qsOpt = new Question_Option();
                    qsOpt.Option_Id = exQsOpt.Option_Id;
                    qsOpt.Option_Description = exQsOpt.Option_Description;
                    qsOpt.Question_Id = exQsOpt.Question_Id;
                    qsOpt.IsTrue = exQsOpt.IsTrue;
                    qsOptList.Add(qsOpt);
                    questionMap.Add(question, qsOptList);
                }

            }

        }
        

        return questionMap;
    }

    public DataTable getQuestionForExam(decimal examId)
    {
        DataSet dsVQ = null;
        cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "select * from ViewExamQuestion where Exam_Id=" + examId;
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        dsVQ = new DataSet();
        da.Fill(dsVQ, "ViewExamQuestion");
        DataTable veqdt = dsVQ.Tables["ViewExamQuestion"];
        return veqdt;
        
    }

    public DataTable getOptionsForQuestion(decimal qId)
    {
        DataSet optDs = null;
        cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "select * from Question_Option where Question_Id=" + qId;
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        optDs = new DataSet();
        da.Fill(optDs, "Question_Option");
        DataTable optDt = optDs.Tables["Question_Option"];
        return optDt;

    }

    public DataTable getCorrectOptionsForQuestion(decimal qId)
    {
        DataSet opds = null;
        cmd = new SqlCommand();
        cmd.Connection = cn;
        cmd.CommandText = "select * from Question_Option where Question_Id=" + qId + " and IsTrue='"+true+"'";
        da = new SqlDataAdapter();
        da.SelectCommand = cmd;
        opds = new DataSet();
        da.Fill(opds, "Question_Option");
        DataTable oqdt = opds.Tables["Question_Option"];
        return oqdt;

    }

    
  


}