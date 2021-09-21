<%@ Page Title="" Language="C#" MasterPageFile="~/studentN/StudentMasterPage.master" AutoEventWireup="true" CodeFile="ExamTAC.aspx.cs" Inherits="student_ExamTAC" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
    <form id="form1" runat="server">
    <div>
    
        <table class="auto-style1">
            <tr>
                <td><b>Exam Instructions for Students</b> <br>
 <br> <b>Before the Exam</b>
 <br>=> Check the exam timetable carefully. Make sure you know the time and locations of your exams. Check whether you should go directly to an exam hall or a waiting room.
<br>=> Bring your Student ID Booklet or University Library Card (i.e. 650****). You will not be allowed into the exam hall without these.
<br>=> Do not bring any unauthorised material (e.g. written notes, notes in dictionaries, paper, and sticky tape eraser). Pencil cases and glasses cases must not be taken to your desks. These will be checked and confiscated.
<br>=> You are allowed to bring tissues and a drink (but not food) into the exam.
<br>=> Ensure that you use the washroom before arriving for your exam as you will not be permitted to leave during the first hour. In the case of listening and oral exams you may not be allowed to leave during the exam.
<br>=> Normally, you are required to answer questions using blue or black ink. Make sure you bring some spare pens with you. Do not bring a pencil case.
<br>=> Arrive at least 15 minutes before the exam is due to start (30 minutes before if your exam is in the Auditorium; TB329 or SSB329) and wait outside until you are allowed in. If you have to go to a holding room first, please arrive at the time stated.
<br>=> <b> In the Exam Hall</b>
<br>=> As you enter show your Student ID card.
<br>=> Make sure your mobile phone is switched off and place it at the front together with any bags, books, coats etc. Then find your seat.
<br>=> Pencil cases/glasses cases: Students are NOT permitted to have these on their desks. Pens/glasses must be removed and placed on the desk and all cases must be left at the front/side of the room with other belongings.
<br>=> Remember that talking is not allowed at any time in the exam hall.
<br>=> Place your Student ID card on your desk next to your attendance card.
<br>=> Listen carefully to instructions. Students are required to comply with the instructions of invigilators at all times. For example, if you are asked to sit in a designated place then you must do so and you must not move.
<br>=> Do not turn over exam papers until told to do so.
<br>=> Where permitted you may use one standard translation dictionary. Dictionaries that have any English-English definitions are not allowed (e.g. The Oxford Advanced Learners’ English-Chinese Dictionary is not allowed; subject specific or specialised dictionaries are not allowed). Dictionaries are not allowed in CELE English language exams.
<br>=> Where permitted, students are allowed to use ONLY ONE dictionary during the exam. Invigilators will check that dictionaries contain no additional papers or written materials. Never bring someone else’s dictionary with you.
<br>=> You are not permitted to share dictionaries, calculators or any other materials during the examination.
<br>=> You are not allowed to leave the exam rooms in the first hour and last fifteen minutes. Note that in the case of listening exams, you are not allowed to leave the exam room at any time. If you need to leave an Oral Exam you must ask the Assessor if it is possible.
 </td>
            </tr>
           <tr>
               <td>&nbsp;</td>
               <td>&nbsp;</td>

           </tr>
             
            <tr>
                <td>
               
                         <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="Start Exam" BackColor="#FF0066" ForeColor="White" />
                </td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</asp:Content>