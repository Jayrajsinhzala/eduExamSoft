<%@ Page Title="" Language="C#" MasterPageFile="~/studentN/StudentMasterPage.master" AutoEventWireup="true" CodeFile="AllResult.aspx.cs" Inherits="studentN_AllResult" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">

     <form id="form1" runat="server">
    <table class="nav-justified">
        <tr>
            <td style="height: 22px"><asp:Label ID="Label1" runat="server" Text="Enter Student Id" ForeColor="Red" style="font-size: xx-small"></asp:Label>
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label2" runat="server" Text="Enter Exam Id" ForeColor="Red" style="font-size: xx-small"></asp:Label>

            </td>
            
        </tr>
       

        <tr>
            <td><asp:TextBox ID="TxtSName" runat="server"></asp:TextBox><asp:TextBox ID="TxtEName" runat="server"></asp:TextBox><asp:Button ID="BtnSearch" runat="server" Text="Search" OnClick="BtnSearch_Click" BackColor="#FF0066" ForeColor="White" /></td>
            
            
        </tr>
        <tr>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                 <asp:Panel ID="Panel1" runat="server" Visible="False">
                 <fieldset>
                         <legend style="color:#00006F "><b>Details Of Result</b></legend>
                 <table style="width: 100%">
                        <tr>
                            <td style="width: 190px">Student Name</td>
                            <td>
                                <asp:Label ID="Stu_Name_Label" runat="server"></asp:Label>
                            </td>
                            <td>
                                <asp:Button ID="BtnPDF" runat="server" Text="Download " OnClick="BtnPDF_Click" BackColor="#FF0066" ForeColor="White"  />
                             </td>
                        </tr>
                        <tr>
                            <td style="width: 190px">Exam Name</td>
                            <td>
                                <asp:Label ID="Exam_Name_Label" runat="server"></asp:Label>
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
                </asp:Panel>
            </td>
            <td>&nbsp;</td>
      
        <tr>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>

</asp:Content>

