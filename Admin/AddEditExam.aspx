<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditExam.aspx.cs" Inherits="AddEditExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
            <tr>
                <td>&nbsp;</td>
                <td>
                    <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
                </td>
            </tr>
            <tr>
                <td>Exam_Name</td>
                <td>
                    <asp:TextBox ID="TxtExamName" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtExamName" ErrorMessage="Please Enter Exam Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Duration</td>
                <td>
                    <asp:TextBox ID="TxtDuration" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtDuration" ErrorMessage="Please Enter Exam Duration" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Date_Of_Exam</td>
                <td>
                    <asp:TextBox ID="TxtDate_Of_Exam" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtDate_Of_Exam" ErrorMessage="Please Enter Date OF Exam" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>N_O_Q</td>
                <td>
                    <asp:TextBox ID="TxtN_O_Q" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtN_O_Q" ErrorMessage="Please Enter Number Of Question" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td>Mode</td>
                <td>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">Manual</asp:ListItem>
                        <asp:ListItem>Random</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td>Sub_Id</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Sub_Id" DataValueField="Sub_Id">
                    </asp:DropDownList>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Subject" ForeColor="Red">*</asp:RequiredFieldValidator>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Subject_Master" EntityTypeFilter="Subject_Master">
                    </asp:EntityDataSource>
                </td>
            </tr>
            <tr>
                <td>Allow_Practice</td>
                <td>
                    <asp:CheckBox ID="AllowPracticeCHK" runat="server" />
                </td>
            </tr>
            <tr>
                <td>IsDeleted</td>
                <td>
                    <asp:CheckBox ID="IsDelCHK" runat="server" />
                </td>
            </tr>
            <tr>
                <td>IsLocked</td>
                <td>
                    <asp:CheckBox ID="IsLockedCHK" runat="server" />
                </td>
            </tr>
            <tr>
                <td>
                    &nbsp;
                </td>
                <td>
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td colspan="2">
               <table style="width: 100%"> 
                   <tr>
                        <td style="width: 166px">
                            <asp:Button ID="BtnSave" runat="server" Text="Save Changes" BackColor="#00006F" ForeColor="White" OnClick="BtnSave_Click" Width="150px" />
                        </td>
                        <td style="width: 172px">
                            <asp:Button ID="BtnCancel" runat="server" Text="Cancel" BackColor="#00006F" ForeColor="White" OnClick="BtnCancel_Click" Width="150px" />
                        </td>
                        <td>
                            <asp:Button ID="BtnBack" runat="server" Text="Back" BackColor="#00006F" ForeColor="White" OnClick="BtnBack_Click" Width="150px" />
                        </td>
                   </tr>
               </table>   
            </td>
        </tr>
        </table>
    </form>
</asp:Content>

