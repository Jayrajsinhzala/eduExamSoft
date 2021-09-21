<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="CreateUser.aspx.cs" Inherits="CreateUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <form id="form1" runat="server">
        <table style="width: 100%">
                        <tr>
                <td colspan="2" style="text-align: center; font-weight: 700">Registration Form</td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                         <legend style="color:#00006F "><b>Genral Information</b></legend>
                    <table style="width: 100%">
                        <tr>
                            <td>&nbsp;</td>
                            <td>
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Emp_Name</td>
                            <td style="width: 286px">
                                 <asp:TextBox ID="TxtEmpName" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Please Enter Employee Name" ControlToValidate="TxtEmpName" ForeColor="Red">*</asp:RequiredFieldValidator>
&nbsp;&nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">D_O_B</td>
                            <td style="width: 286px">
                                 <asp:TextBox ID="TxtD_O_B" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Date Of Birth" ControlToValidate="TxtD_O_B" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">City</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter City" ControlToValidate="TxtCity" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">State</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please  Enter State" ControlToValidate="TxtState" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Emp_Designation</td>
                            <td style="width: 286px">
                                <asp:DropDownList ID="DropDownList1" runat="server">
                                    <asp:ListItem Value="1">Admin</asp:ListItem>
                                    <asp:ListItem Value="2">Employee</asp:ListItem>
                                    <asp:ListItem Value="3">Staff</asp:ListItem>
                                    <asp:ListItem></asp:ListItem>
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter Employee's Designation" ControlToValidate="DropDownList1" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Contact_Number</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtContactNumber" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Contact Number" ControlToValidate="TxtContactNumber" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Email-Id</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Email-Id" ControlToValidate="TxtEmailId" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmailId" ErrorMessage="Please Enter  Email-Id In Currect Formate" ForeColor="Red">*</asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Gender</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Emp_Image</td>
                            <td style="width: 286px">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                             </td>
                             <td style="width: 108px">
                                 &nbsp;<asp:Button ID="BtnUpload" runat="server" BackColor="#00006F" ForeColor="White" OnClick="BtnUpload_Click" Text="Upload" />
                             </td>
                             <td>
                                 <asp:Image ID="Image1" runat="server" style="margin-left: 0px" />
                             </td>
                        </tr>
                    </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
            <tr>
                <td colspan="2">
                    <fieldset>
                                <legend style="color:#00006F "><b>Login Information</b></legend>
                    <table style="width: 100%">
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Login_Name</td>
                            <td>
                                 <asp:TextBox ID="TxtLoginName" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Login Name" ControlToValidate="TxtLoginName" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt; height: 31px;">Login_Password</td>
                            <td style="height: 31px">
                                 <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Login Password" ControlToValidate="TxtPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Security_Question</td>
                            <td>
                                 <asp:DropDownList ID="DropDownList2" runat="server">
                                     <asp:ListItem>What is ur pet name ?</asp:ListItem>
                                     <asp:ListItem>What is ur school name?</asp:ListItem>
                                     <asp:ListItem>What is ur country name?</asp:ListItem>
                                 </asp:DropDownList>
                                 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Security_Answer</td>
                            <td>
                                 <asp:TextBox ID="TxtSecurity_Answer" runat="server"></asp:TextBox>
                                 &nbsp;
                            </td>
                        </tr>
                    </table>
                    </fieldset>
                </td>
            </tr>
            <tr>
                <td style="height: 42px; width: 336px"></td>
                <td style="height: 42px">
                     <asp:Button ID="BtnSubmit" runat="server" BackColor="#00006F" ForeColor="White" OnClick="BtnSubmit_Click" Text="Submit" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

