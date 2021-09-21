<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="AddEditStudent.aspx.cs" Inherits="AddEditStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
     <table style="width: 100%">
        <tr>
            <td style="width: 327px">&nbsp;</td>
            <td>
                <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" style="font-size: xx-small" />
            </td>
        </tr>
        <tr>
            <td style="width: 327px">Student Name</td>
            <td>
                <asp:TextBox ID="TxtName" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TxtName" ErrorMessage="Please Enter Student Name" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 327px">Contact Number</td>
            <td>
                <asp:TextBox ID="TxtCno" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TxtCno" ErrorMessage="Please Enter Contact Number" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 327px">Gender</td>
            <td>
                <asp:TextBox ID="TxtGender" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TxtGender" ErrorMessage="Please Enter Gender" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
             <td style="width: 327px">City</td>
            <td>
                <asp:TextBox ID="TxtCity" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TxtCity" ErrorMessage="Please Enter City" ForeColor="Red">*</asp:RequiredFieldValidator>
             </td>
        </tr>
        <tr>
             <td style="width: 327px">State</td>
            <td>
                <asp:TextBox ID="TxtState" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TxtState" ErrorMessage="Please Enter  State" ForeColor="Red">*</asp:RequiredFieldValidator>
             </td>

        </tr>    
        <tr>
            <td style="width: 327px">D_O_B</td>
            <td>
                <asp:TextBox ID="TxtD_O_B" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TxtD_O_B" ErrorMessage="Please Enter Date Of Birth" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>

        </tr>    
        <tr>
            <td style="width: 327px">Email-Id</td>
            <td>
                <asp:TextBox ID="TxtEmail" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Please Enter Email-Id" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TxtEmail" ErrorMessage="Please Enter Valid Email Address  " ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>

        </tr>    
        <tr>
            <td style="width: 327px">Parents ContactNo.</td>
            <td>
                <asp:TextBox ID="TxtPCNo" runat="server"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TxtPCNo" ErrorMessage="Please Enter Parents Contact Number" ForeColor="Red">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td style="width: 327px">Parents&nbsp; EmailId</td>
             <td>
                 <asp:TextBox ID="TxtPEmail" runat="server"></asp:TextBox>
                 <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server" ControlToValidate="TxtPEmail" ErrorMessage="Please Enter Parents Email-Id" ForeColor="Red">*</asp:RequiredFieldValidator>
                 <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TxtPEmail" ErrorMessage="Please Enter Valid Email Address" ForeColor="Red" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*">*</asp:RegularExpressionValidator>
            </td>
           

        </tr>    
        <tr>
            <td style="width: 327px">Student Image</td>
             <td>
                <table class="auto-style1">
                        <tr>
                          <td style="width: 492px">
                              <asp:FileUpload ID="FileUpload1" runat="server" />
                              <asp:Button ID="BtnUpload" runat="server" Text="Upload"  BackColor="#00006F" ForeColor="White" OnClick="BtnUpload_Click" />
                            </td>
                            <td>
                                <asp:Image ID="Image1" runat="server" Height="95px" Width="108px" />
                                &nbsp;
                            </td>
                        </tr>
                    </table>
            </td>

        </tr>    
         <tr>
            <td style="width: 327px">Semester</td>
            <td>
                <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Sem_Description" DataValueField="Sem_Id">
                </asp:DropDownList>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server" ControlToValidate="DropDownList1" ErrorMessage="Please Select Semester" ForeColor="Red">*</asp:RequiredFieldValidator>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Semesters" EntityTypeFilter="Semester">
                </asp:EntityDataSource>
             </td>

        </tr>    
         <tr>
            <td style="width: 327px">IsDeleted</td>
            <td>
                <asp:CheckBox ID="IsDelCHK" runat="server" />
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
                            <asp:Button ID="BtnADD" runat="server" BackColor="#00006F" ForeColor="White" Text="Save Changes" Width="150px" OnClick="BtnADD_Click"  />
                        </td>
                        <td style="width: 172px">
                            <asp:Button ID="BtnCancel" runat="server" BackColor="#00006F" ForeColor="White" Text="Cancel" Width="150px" OnClick="BtnCancel_Click"  />
                        </td>
                        <td>
                            <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" ForeColor="White" Text="Back" Width="150px" OnClick="BtnBack_Click"   />
                        </td>
                   </tr>
               </table>   
            </td>
        </tr>
    </table>
    </form>
</asp:Content>

