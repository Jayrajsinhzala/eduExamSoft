<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ConcernedUnit.aspx.cs" Inherits="ConcernedUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
        <tr>
            <td style="width: 286px">
                &nbsp;</td>
            <td style="width: 214px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td align="right" colspan="4">
                                                             <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" EnableTheming="True" ForeColor="White" Text="Back" OnClick="BtnBack_Click" />
                                                             &nbsp;
                                                </td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Exam_Name</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtEName" runat="server" ReadOnly="True" ></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="4">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">
                                                 &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td align="center" colspan="4">
                                                  <asp:Label ID="MessageLabel" runat="server" ForeColor="#00006F" style="font-size: 8pt"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Duration</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtDuration" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td align="left" colspan="2">
                                                  &nbsp; 
                                                  <asp:Label ID="UnitLable" runat="server" ForeColor="#00006F" style="font-size: 8pt" Text=" Avaliable Unit"></asp:Label>
            </td>
            <td align="center" colspan="2">
                                                  <asp:Label ID="CurrentExamUnitLable" runat="server" ForeColor="#00006F" style="font-size: 8pt" Text="Unit Related To Current Exam"></asp:Label>
            </td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">
                                                 &nbsp;
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td rowspan="13" style="width: 40px" align="right">
                  &nbsp;
                                                           
                                                        <asp:ListBox ID="UnitListBox" runat="server" Height="214px" 
                    Width="135px" style="margin-top: 0px" DataSourceID="EntityDataSource1" DataTextField="Unit_Name" DataValueField="Unit_Id" ></asp:ListBox>
                                                           
                                                        <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableFlattening="False" EntitySetName="Units" Select="it.[Unit_Id], it.[Unit_Name]">
                  </asp:EntityDataSource>
                                                           
                                                        </td>
            <td colspan="2" rowspan="8" style="width: 83px">
                  &nbsp;
                                                        <asp:Button ID="BtnAddUnit" runat="server" Text="Add Unit" BackColor="#00006F" ForeColor="White" OnClick="BtnAddUnit_Click" />
                                                        </td>
            <td rowspan="13">
                  &nbsp;
                                                        <asp:ListBox ID="ExamUnitListBox" runat="server" Height="234px" Width="121px"></asp:ListBox>
                                                        </td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                N_O_Q</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtN_O_Q" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">
                                  &nbsp;
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Allow For Practice</td>
            <td style="width: 214px">
                <asp:CheckBox ID="AllowPracticeCHK" runat="server" style="font-size: 9pt" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">
                                &nbsp;
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Date Of Exam</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtDateOfExam" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">&nbsp;
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Mode</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtMode" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">
                                               &nbsp;
                                            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="2" rowspan="5" style="width: 83px">
                  &nbsp;
                                                        <asp:Button ID="BtnRmvUnit" runat="server" Text="Remove Unit" BackColor="#00006F" ForeColor="White" Width="110px" OnClick="BtnRmvUnit_Click" />
                                                        </td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                Subject</td>
            <td style="width: 214px">
                <asp:TextBox ID="TxtSubject" runat="server" ReadOnly="True"></asp:TextBox>
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                IsDeleted</td>
            <td style="width: 214px">
                <asp:CheckBox ID="IsDelCHK" runat="server" style="font-size: 9pt" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                  &nbsp;</td>
            <td style="width: 214px">&nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px; font-size: 9pt;">
                IsLocked</td>
            <td style="width: 214px">
                <asp:CheckBox ID="IsLockCHK" runat="server" style="font-size: 9pt" />
            </td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="3">
                &nbsp;</td>
        </tr>
        <tr>
            <td style="width: 286px">
                &nbsp;</td>
            <td style="width: 214px">
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td>
                &nbsp;</td>
            <td colspan="4">
                &nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

