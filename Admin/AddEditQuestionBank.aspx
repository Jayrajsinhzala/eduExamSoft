<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditQuestionBank.aspx.cs" Inherits="AddEditQuestionBank" %>

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
            <td style="width: 272px">Question_Type</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Type_Name" DataValueField="Question_Type_Id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Question Type" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableFlattening="False" EntitySetName="Question_Type" EntityTypeFilter="Question_Type" Select="it.[Question_Type_Id], it.[Type_Name]">
                </asp:EntityDataSource>
            </td>
        </tr>
        <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 272px">Question</td>
            <td>
                <asp:TextBox ID="TxtQuestion" runat="server" TextMode="MultiLine"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtQuestion" ErrorMessage="Please Enter Question" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td style="width: 272px">Unit</td>
            <td>
                <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="EntityDataSource2" DataTextField="Unit_Name" DataValueField="Unit_Id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="DropDownList2" ErrorMessage="Please Select Unit" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableFlattening="False" EntitySetName="Units" EntityTypeFilter="Unit" Select="it.[Unit_Id], it.[Unit_Name]">
                </asp:EntityDataSource>
            </td>

        </tr>    
         <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>&nbsp;</td>

        </tr>    
         <tr>
            <td style="width: 272px">&nbsp;</td>
            <td>&nbsp;</td>

        </tr>
         <tr>
            <td style="width: 272px">IsDeleted</td>
            <td>
                <asp:CheckBox ID="IsDelCHK" runat="server" />
             </td>

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
                            <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" ForeColor="White" Text="Back" Width="150px" OnClick="BtnBack_Click"  />
                        </td>
                   </tr>
                   <tr>
                      <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
                   <tr>
                      <td>&nbsp;</td>
                       <td>&nbsp;</td>
                       <td>&nbsp;</td>
                   </tr>
               </table>   
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

