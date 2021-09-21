<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditUnit.aspx.cs" Inherits="AddEditUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
        <table style="width: 100%">
        
        <tr>
            <td style="width: 248px">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
            </td>
        </tr>
        
        <tr>
            <td style="width: 248px">Unit Name</td>
            <td>
                <asp:TextBox ID="TxtUName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtUName" ErrorMessage="Please Enter Unit Name" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 248px">Unit Description</td>
            <td>
                <asp:TextBox ID="TxtUDesc" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtUDesc" ErrorMessage="Please Enter Unit Description" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
            <tr>
                <td>Subject</td>
                <td>
                    <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Sub_Id" DataValueField="Sub_Id" >
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="SubjectViews">
                    </asp:EntityDataSource>
                </td>
            </tr>
             <tr>
                <td>Semester</td>
                <td>
                    <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EntityDataSource2" DataTextField="Sem_Id" DataValueField="Sem_Id" >
                    </asp:DropDownList>
                    <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ViewSemesters" EntityTypeFilter="ViewSemester">
                    </asp:EntityDataSource>
                </td>
            </tr>
         <tr>
          <td style="width: 248px">IsDeleted</td>
          <td>
              <asp:CheckBox ID="IsDelCHK" runat="server" />
             </td>

        </tr>
            <tr>
          <td style="width: 248px">&nbsp;</td>
          <td>&nbsp;</td>

        </tr>      
        <tr>
            <td colspan="2">
               <table style="width: 100%"> 
                   <tr>
                        <td style="width: 166px">
                            <asp:Button ID="BtnADD" runat="server" BackColor="#00006F" ForeColor="White" Text="Save Changes" Width="150px" OnClick="BtnADD_Click"  />
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

