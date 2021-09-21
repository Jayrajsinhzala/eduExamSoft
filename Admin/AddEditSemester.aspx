<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditSemester.aspx.cs" Inherits="AddEditSemester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
        <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
            </td>
        </tr>
        
        <tr>
            <td style="font-size: medium; width: 272px">Semester_Description</td>
            <td>
                <asp:TextBox ID="TxtDescription" runat="server" style="margin-left: 0px" TextMode="MultiLine" Width="179px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtDescription" ErrorMessage="Please Enter Semester Description" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 272px; height: 29px;"></td>
            <td style="height: 29px"></td>
        </tr>
        <tr>
            <td style="width: 272px; height: 20px; font-size: medium">IsDeleted</td>
            <td style="height: 20px">
                <asp:CheckBox ID="IsDelCHK" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>&nbsp;</td>

        </tr>    
        <tr>
            <td colspan="2">
               <table style="width: 100%"> 
                   <tr>
                        <td style="width: 166px">
                            <asp:Button ID="BtnADD" runat="server" BackColor="#00006F" ForeColor="White" Text="Save Changes" Width="150px" OnClick="BtnADD_Click" />
                        </td>
                        <td style="width: 172px">
                            <asp:Button ID="BtnCancel" runat="server" BackColor="#00006F" ForeColor="White" Text="Cancel" Width="150px" OnClick="BtnCancel_Click" />
                        </td>
                        <td>
                            <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" ForeColor="White" Text="Back" Width="150px" OnClick="BtnBack_Click" />
                        </td>
                   </tr>
               </table>   
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

