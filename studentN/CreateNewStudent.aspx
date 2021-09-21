<%@ Page Title="" Language="C#" MasterPageFile="~/studentN/StudentMasterPage.master" AutoEventWireup="true" CodeFile="CreateNewStudent.aspx.cs" Inherits="CreateNewStudent" %>

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
                                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Stu_Name</td>
                            <td style="width: 286px">
                                 <asp:TextBox ID="TxtStuName" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtStuName" ErrorMessage="Please Enter Student Name" ForeColor="Red">*</asp:RequiredFieldValidator>
                                 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">D_O_B</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtD_O_B" runat="server"></asp:TextBox>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Please Enter Date Of Birth" ControlToValidate="TxtD_O_B" ForeColor="Red">*</asp:RequiredFieldValidator>
                                &nbsp;
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Gender</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Please Enter Gender" ControlToValidate="TxtGender" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">City</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Please Enter City" ControlToValidate="TxtCity" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">State</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                                &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ErrorMessage="Please Enter State" ControlToValidate="TxtState" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Sem_Id</td>
                            <td style="width: 286px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Sem_Id" DataValueField="Sem_Id">
                                </asp:DropDownList>
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Semester Id" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Semesters" EntityTypeFilter="Semester">
                                </asp:EntityDataSource>
                                &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Contact_Number</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtContactNo" runat="server"></asp:TextBox>
                               &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Please Enter Contact Number" ControlToValidate="TxtContactNo" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Email-Id</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
                               &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ErrorMessage="Please Enter Email Id" ControlToValidate="TxtEmailId" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmailId" ErrorMessage="Please Enter Valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Parents_ContactNo</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtParentsC_No" runat="server"></asp:TextBox>
                               &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ErrorMessage="Please Enter Parents Contact Number" ControlToValidate="TxtParentsC_No" ForeColor="Red">*</asp:RequiredFieldValidator>
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Parents_EmailId</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtParentsEmail" runat="server"></asp:TextBox>
                               &nbsp;
                                <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ErrorMessage="Please Enter Parents Email Id" ControlToValidate="TxtParentsEmail" ForeColor="Red">*</asp:RequiredFieldValidator>
                                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtParentsEmail" ErrorMessage="Please Enter Valid Email Id" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
                             </td>
                        </tr>
                         
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Stu_Image</td>
                            <td style="width: 286px">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                             </td>
                             <td style="width: 108px">
                                 &nbsp;<asp:Button ID="BtnUpload" runat="server" BackColor="#FF0066" ForeColor="White"  Text="Upload" OnClick="BtnUpload_Click" />
                             </td>
                             <td>
                                 <asp:Image ID="Image1" runat="server" style="margin-left: 0px" Height="79px" Width="97px" />
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
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ErrorMessage="Please Enter Login Name" ControlToValidate="TxtLoginName" ForeColor="Red">*</asp:RequiredFieldValidator>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt; height: 31px;">Login_Password</td>
                            <td style="height: 31px">
                                 <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
                                 <asp:RequiredFieldValidator ID="RequiredFieldValidator11" runat="server" ErrorMessage="Please Enter Password" ControlToValidate="TxtPassword" ForeColor="Red">*</asp:RequiredFieldValidator>
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
                     <asp:Button ID="BtnSubmit" runat="server" BackColor="#FF0066" ForeColor="White"  Text="Submit" OnClick="BtnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

