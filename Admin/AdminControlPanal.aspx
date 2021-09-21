<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AdminControlPanal.aspx.cs" Inherits="AdminControlPanal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form runat="server">
     <table style="width: 100%">
        <tr>
            <td align="center" class="headding" colspan="4" style="height: 28px">
                Control Panel</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgbtnEmployee" runat="server" Height="120px" 
                    ImageUrl="~/AdminImage/Employee.png" Width="147px" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewEmployee.aspx" />
                    <br/>
                   Employee
            </td>
            <asp:Literal ID="Literal1" runat="server"></asp:Literal>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgBtnStudent" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Student.png" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewStudent.aspx" />
                    <br />
                    Student</td>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgbtnDepartment" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Semester.jpg" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewSemester.aspx" />
                    <br />
                    Semester</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgbtnAddnew" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Adduser.png" BorderStyle="None" 
                    PostBackUrl="~/Admin/CreateUser.aspx" />
                    <br />
                    Create New user</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgBtnMembers" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/QuestionBank.png" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewQuestionBank.aspx" />
                    <br />
                Question Bank<td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgBtnFeedback" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Subject.png" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewSubject.aspx" />
                    <br />
                Subject</td>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="ImgbtnFAQ" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Unit.jpg" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewUnit.aspx" />
                    <br />
                    Unit</td>
            <td align="center" style="font-size: medium">
                <asp:ImageButton ID="IngbtnWishlist" runat="server" Height="120px" 
                    Width="147px" ImageUrl="~/AdminImage/Exam.jpg" BorderStyle="None" 
                    PostBackUrl="~/Admin/ViewExam.aspx" />
                    <br />
                    Exam 
            </td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                    <br />
            </td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                    <br />
                    </td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium; height: 27px;">
                </td>
            <td align="center" style="font-size: medium; height: 27px;">
                </td>
            <td align="center" style="font-size: medium; height: 27px;">
                </td>
            <td align="center" style="font-size: medium; height: 27px;">
                </td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
        <tr>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
            <td align="center" style="font-size: medium">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>


