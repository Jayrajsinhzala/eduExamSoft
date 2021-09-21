<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewExam.aspx.cs" Inherits="ViewExam" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
      <tr>
            <td style="text-align:center" colspan="3">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">EXAM DETAILS</span></span></span></td>
        </tr>
         <tr>
            <td colspan="3">
               <fieldset>
                                <legend style="color:#0f266d "><b>Search</b></legend>
                <table style="width: 100%">
                    <tr>
                        <td style="width: 257px">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                <asp:ListItem>Exam Name</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td>
                            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Exam_Name" DataValueField="Exam_Id">
                            </asp:DropDownList>
                        </td>
                        <td>
                            <asp:Button ID="BtnFilter" runat="server" Text="Filter Record" Width="250px" BackColor="#00006F" ForeColor="White" OnClick="BtnFilter_Click" />
                        </td>
                        <td>
                            <asp:Button ID="BtnRmv" runat="server" Text="Remove Filter" Width="250px" BackColor="#00006F" ForeColor="White" OnClick="BtnRmv_Click" />
                        </td>
                        <td>
                            <asp:Button ID="BtnAdd" runat="server" Text="Add New" Width="250px" BackColor="#00006F" ForeColor="White" OnClick="BtnAdd_Click" />
                        </td>
                    </tr>
                    
                </table>
               </fieldset>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td colspan="3">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Exam_Id" DataSourceID="EntityDataSource1" GridLines="Vertical" Width="100%" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                        <asp:BoundField DataField="Exam_Id" HeaderText="Exam_Id" ReadOnly="True" SortExpression="Exam_Id" />
                        <asp:BoundField DataField="Exam_Name" HeaderText="Exam_Name" SortExpression="Exam_Name" />
                        <asp:BoundField DataField="N_O_Q" HeaderText="N_O_Q" SortExpression="N_O_Q" />
                        <asp:BoundField DataField="Mode" HeaderText="Mode" SortExpression="Mode" />
                        <asp:BoundField DataField="IsLocked" HeaderText="IsLocked" SortExpression="IsLocked" />
                        <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                            
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Exam_Id") %>' CommandName="BtnEdit" Height="37px" ImageUrl="~/images/Edit-file.png" Width="36px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("Exam_Id") %>' CommandName="BtnDelete" Height="45px" ImageUrl="~/images/Delete.png" Width="37px" OnClientClick="return confirm(&quot;Are You Sure To Delete&quot;);" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Exam_Master" EntityTypeFilter="Exam_Master">
                </asp:EntityDataSource>
            </td>
            
        </tr>
          <tr>
                                <td style="width: 719px">&nbsp;</td>
                                
                                <td>
                                    <asp:LinkButton ID="UnitLinkButton" runat="server" ForeColor="#0033CC" OnClick="UnitLinkButton_Click" >Concerned Unit</asp:LinkButton>
                                </td>
                                
                                <td>
                                    <asp:LinkButton ID="QuestionLinkButton" runat="server" ForeColor="#0033CC" OnClick="QuestionLinkButton_Click">Concerned Question</asp:LinkButton>
                                </td>
                                
                            </tr>
          <tr>
            <td colspan="3">
                
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                      <fieldset>
                                <legend style="color:#0f266d "><b>Selected Record</b></legend>
                    <table style="width: 100%">
                    <tr>
                         <td style="width: 323px">Exam_Id</td>
                        <td style="width: 200px">
                            <asp:TextBox ID="TxtEId" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>
                        <td style="width: 322px">Mode</td>
                        <td>
                            <asp:TextBox ID="TxtMode" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>

                    </tr>
                    <tr>
                        <td style="width: 322px">Exam_Name</td>
                        <td style="width: 200px">
                            <asp:TextBox ID="TxtEName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 322px">Sub_Id</td>
                        <td>
                            <asp:TextBox ID="TxtSub_Id" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                       <td style="width: 323px">Duration</td>
                        <td style="width: 200px">
                            <asp:TextBox ID="TxtDuration" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 322px">D_O_E</td>
                        <td>
                            <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 323px">N_O_Q</td>
                        <td style="width: 200px">
                            <asp:TextBox ID="TxtN_O_Q" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 322px">D_O_M</td>
                        <td>
                            <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                       <td style="width: 323px">Date_Of_Exam</td>
                        <td style="width: 200px">
                            <asp:TextBox ID="TxtDate_Of_Exam" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 322px">IsLocked</td>
                        <td>
                            <asp:CheckBox ID="IsLockCHK" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 323px">Allow_Practice</td>
                        <td style="width: 200px">
                            <asp:CheckBox ID="AllowPracticeCHK" runat="server" />
                        </td>
                        <td style="width: 322px">IsDeleted</td>
                        <td>
                            <asp:CheckBox ID="IsDelCHK" runat="server" />
                        </td>
                    </tr>
                    <tr>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                         <td>&nbsp;</td>
                    </tr>
                   
                </table>
                </fieldset>
                </asp:Panel>
           </td>
                
            
        </tr>
    </table>
    </form>
</asp:Content>

