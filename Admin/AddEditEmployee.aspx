<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditEmployee.aspx.cs" Inherits="AddEditEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form id="form1" runat="server">
     <table style="width: 100%">
         <tr>
              <td style="height: 19px; width: 255px;">
                      &nbsp;
              </td>
              <td style="height: 19px" colspan="3">
                     <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
              </td>
        </tr>
        <tr>
              <td align="left" style="width: 255px">
                      &nbsp;</td>
              <td align="left" colspan="3">
                 <asp:Panel ID="Panel1" runat="server" ForeColor="Red" style="font-size: 6pt">
                     plz enter alphabets only</asp:Panel>
              </td>
        </tr>
        <tr>
             <td style="width: 327px">Emp_Name</td>
            <td>
                <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtName" ErrorMessage="Please Enter Name  Of Employee" ForeColor="Red">*</asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td style="width: 327px; height: 31px;">D_O_B</td>
            <td style="height: 31px">
                <asp:TextBox ID="TxtD_O_B" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtD_O_B" ErrorMessage="Please Enter Date Of Birth" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 327px; height: 31px;">City</td>
            <td style="height: 31px">
                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtCity" ErrorMessage="Please Enter City" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 327px">State</td>
            <td>
                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtState" ErrorMessage="Please Enter State" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
             <td style="width: 327px">Emp_Designation</td>
            <td>
                <asp:TextBox ID="TxtEDesignation" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtEDesignation" ErrorMessage="Please Enter Designation" ForeColor="Red">*</asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
            <td style="width: 327px">Contact_Number</td>
            <td>
                <asp:TextBox ID="TxtCNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtCNo" ErrorMessage="Please Enter Contact_Number" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>

        </tr>    
        <tr>
            <td style="width: 327px">Email_Id</td>
            <td>
                <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Please  Enter Email Address" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>

        </tr>    
        <tr>
            <td style="width: 327px; height: 36px;">Gender</td>
            <td style="height: 36px">
                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtGender" ErrorMessage="Please  Enter Gender" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>

        </tr>    
        <tr>
            <td>IsDeleted</td>
              <td>
                  <asp:CheckBox ID="IsDelCHK" runat="server" />
            </td>
        </tr>
        <tr>
            <td style="width: 327px">Emp_Image</td>
            <td>
                <table class="auto-style1">
                        <tr>
                          <td style="width: 492px">
                              <asp:FileUpload ID="FileUpload1" runat="server"  />
                              <asp:Button ID="BtnUpload" runat="server" BackColor="#00006F" Text="Upload" ForeColor="White" OnClick="BtnUpload_Click" />
                            </td>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="127px" Width="146px" />
                            </td>
                        </tr>
                    </table>
            </td>

        </tr>    
        <tr>
            <td style="width: 327px">&nbsp;</td>
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
                            <asp:Button ID="BtnCancel" runat="server" BackColor="#00006F" ForeColor="White" Text="Cancel" Width="150px" OnClick="BtnCancel_Click"  />
                        </td>
                        <td>
                            <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" ForeColor="White" Text="Back" Width="150px" OnClick="BtnBack_Click"  />
                        </td>
                   </tr>
               </table>   
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

