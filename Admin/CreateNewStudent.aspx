<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="CreateNewStudent.aspx.cs" Inherits="CreateNewStudent" %>

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
                            <td style="width: 174px; font-size: 9pt;">Stu_Name</td>
                            <td style="width: 286px">
                                 <asp:TextBox ID="TxtStuName" runat="server"></asp:TextBox>
                                 &nbsp;
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">D_O_B</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtD_O_B" runat="server"></asp:TextBox>
                                &nbsp;
                            </td>
                        </tr>
                        
                        <tr>
                            <td style="width: 174px; font-size: 9pt;">Gender</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
                                &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">City</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                                &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">State</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                                &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Sem_Id</td>
                            <td style="width: 286px">
                                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Sem_Id" DataValueField="Sem_Id">
                                </asp:DropDownList>
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
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Email-Id</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtEmailId" runat="server"></asp:TextBox>
                               &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Parents_ContactNo</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtParentsC_No" runat="server"></asp:TextBox>
                               &nbsp;
                             </td>
                        </tr>
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Parents_EmailId</td>
                            <td style="width: 286px">
                                <asp:TextBox ID="TxtParentsEmail" runat="server"></asp:TextBox>
                               &nbsp;
                             </td>
                        </tr>
                         
                         <tr>
                            <td style="width: 174px; font-size: 9pt;">Stu_Image</td>
                            <td style="width: 286px">
                                <asp:FileUpload ID="FileUpload1" runat="server" />
                             </td>
                             <td style="width: 108px">
                                 &nbsp;<asp:Button ID="BtnUpload" runat="server" BackColor="#00006F" ForeColor="White"  Text="Upload" OnClick="BtnUpload_Click" />
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
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 174px; font-size: 9pt; height: 31px;">Login_Password</td>
                            <td style="height: 31px">
                                 <asp:TextBox ID="TxtPassword" runat="server"></asp:TextBox>
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
                     <asp:Button ID="BtnSubmit" runat="server" BackColor="#00006F" ForeColor="White"  Text="Submit" OnClick="BtnSubmit_Click" />
                </td>
            </tr>
            <tr>
                <td colspan="2">&nbsp;</td>
            </tr>
        </table>
    </form>
</asp:Content>

