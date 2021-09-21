<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ReportDetails.aspx.cs" Inherits="ReportDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .auto-style1
        {
            height: 129px;
            width: 387px;
        }
        .auto-style2
        {
            width: 387px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
     <table style="width: 100%">
    <tr>
        <td style="width: 198px; height: 129px;">
            </td>
        <td class="auto-style1">
            <span 
                    style="color: #990000"><span style="font-family: Algerian">
                <span 
                    style="font-size: xx-large">REPORT DETAILS</span></span></span></td>
       
        <td style="height: 129px">
            </td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td  class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
   
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            <asp:LinkButton ID="LinkButton1" runat="server" 
                PostBackUrl="~/EmployeeReport.aspx">Employee report</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    
   
   
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            <asp:LinkButton ID="LinkButton2" runat="server" PostBackUrl="~/ExamReport.aspx">Exam Report</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            <asp:LinkButton ID="LinkButton3" runat="server" PostBackUrl="~/ResultReport.aspx">Result Report</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            <asp:LinkButton ID="LinkButton4" runat="server" PostBackUrl="~/StudentReport.aspx">Student Report</asp:LinkButton>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            <asp:LinkButton ID="LinkButton5" runat="server" PostBackUrl="~/QuestionBankReport.aspx">QuestionBank Report</asp:LinkButton></td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 198px">
            &nbsp;</td>
        <td class="auto-style2">
            &nbsp;</td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>
    </div>
    </form>
</body>
</html>
