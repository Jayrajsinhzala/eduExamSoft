<%@ Page Title="" Language="C#" MasterPageFile="~/studentN/StudentMasterPage.master" AutoEventWireup="true" CodeFile="ViewResult.aspx.cs" Inherits="studentN_ViewResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table class="nav-justified">
        <tr>
            <td>&nbsp;</td>
            
        </tr>
        <tr>
            <td>
              &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  <asp:Label ID="Result_Label" runat="server"></asp:Label>
            </td>
            
        </tr>
        <tr>
            <td> <fieldset>
                         <legend style="color:#00006F "><b>Details Of Result</b></legend>
                 <table style="width: 100%">
                        <tr>
                            <td style="width: 190px">Student Id</td>
                            <td>
                                <asp:Label ID="Stu_Id_Label" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="BtnPDF" runat="server" Text="Download " OnClick="BtnPDF_Click1" BackColor="#FF0066" ForeColor="White" />
                             </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Exam Id</td>
                            <td>
                                <asp:Label ID="Exam_Id_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Total Question</td>
                            <td>
                                <asp:Label ID="N_O_Q_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Current Answer</td>
                            <td>
                                <asp:Label ID="N_C_A_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Wrong Answer</td>
                            <td>
                                <asp:Label ID="N_W_A_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Total Score</td>
                            <td>
                                <asp:Label ID="Total_Score_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td style="width: 190px">Email-id</td>
                            <td>
                                <asp:Label ID="Email_Label" runat="server"></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td>&nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                </table>
                </fieldset>
            </td>
            <td>&nbsp;</td>
      
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

