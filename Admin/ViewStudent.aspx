<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewStudent.aspx.cs" Inherits="ViewStudent" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
       <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">STUDENT DETAILS</span></span></span></td>
        </tr>
          <tr>
            <td>
                <fieldset>
                    <legend style="color:#0f266d "><b>Search</b></legend>
                        <table style="width: 100%">
                    <tr>
                         <td style="width: 257px">
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                 <asp:ListItem>Stu_Id</asp:ListItem>
                                 <asp:ListItem>Stu_Name</asp:ListItem>
                             </asp:RadioButtonList>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                         </td>
                         <td>
                             <asp:Button ID="BtnFilter" runat="server" BackColor="#00006F" Text="Filter Record" Width="250px" ForeColor="White" OnClick="BtnFilter_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnRmv" runat="server" BackColor="#00006F" Text="Remove Filter" Width="250px" ForeColor="White" OnClick="BtnRmv_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnAdd" runat="server" BackColor="#00006F" Text="Add New" Width="250px" ForeColor="White" OnClick="BtnAdd_Click" />
                         </td>
                    </tr>
                </table>

                </fieldset>
            </td>

        </tr>
        <tr>
           <td>
               <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="EntityDataSource1" GridLines="Vertical" Width="100%" DataKeyNames="Stu_Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                   <AlternatingRowStyle BackColor="#DCDCDC" />
                   <Columns>
                       <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                       <asp:BoundField DataField="Stu_Name" HeaderText="Stu_Name" SortExpression="Stu_Name" />
                       <asp:BoundField DataField="Gender" HeaderText="Gender" SortExpression="Gender" />
                       <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                       <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                       <asp:BoundField DataField="Contact_Number" HeaderText="Contact_Number" SortExpression="Contact_Number" />
                       <asp:BoundField DataField="Parents_ContactNo" HeaderText="Parents_ContactNo" SortExpression="Parents_ContactNo" />
                       <asp:BoundField DataField="Email_Id" HeaderText="Email_Id" SortExpression="Email_Id" />
                       <asp:TemplateField HeaderText="Edit">
                           <ItemTemplate>
                               <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Stu_Id") %>' CommandName="Edit" Height="37px" ImageUrl="~/images/Edit-file.png" Width="42px" />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                           
                           <ItemTemplate>
                               <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                           </ItemTemplate>
                       </asp:TemplateField>
                       <asp:TemplateField HeaderText="Delete">
                           <ItemTemplate>
                               <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("Stu_Id") %>' CommandName="BtnDelete" Height="42px" ImageUrl="~/images/Delete.png" Width="37px" OnClientClick="return confirm(&quot;Are you Sure To Delete!!!&quot;);" />
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
               <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Student_Master" EntityTypeFilter="Student_Master">
               </asp:EntityDataSource>
            </td>
           <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                
                <asp:Panel ID="Panel1" runat="server" Visible="False">
                      <fieldset>
                                <legend style="color:#0f266d "><b>Selected Record</b></legend>
                    <table style="width: 100%">
                   
                    <tr>
                      <td style="width: 240px; height: 33px;">Student Id</td>
                            <td style="width: 363px; height: 33px;">
                                <asp:TextBox ID="TxtSId" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                             <td style="height: 54px">
                                                <table style="width: 100%">
                                                    <tr>
                                                        <td align="center">
                                                            <asp:Image ID="StudentImage" runat="server" Height="64px" Width="76px" />
                                                           &nbsp;
                                                        </td>
                                                    </tr>
                                                </table>
                            </td>
                        
                    </tr>
                    <tr>
                      <td style="width: 240px">Student Name</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtSName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 240px">Contact Number</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtCNo" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 240px">Gender</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtGender" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 240px">City</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtCity" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        
                    </tr>
                    <tr>
                       <td style="width: 240px">State</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtState" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                
                        <tr>
                           <td style="width: 240px">D_O_B</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_B" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">Age</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtAge" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">Email Id</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtEmail" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px; font-size: 11pt;">Parents Contact Number</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtP_C_No" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">Parents Email Id</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtP_Email" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                
                       <tr>
                            <td style="width: 240px">D_O_J</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_J" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                         <tr>
                            <td style="width: 240px">D_O_E</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                             </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">D_O_M</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">Sem_Id</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtSemId" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                
                        <tr>
                            <td style="width: 240px">IsDeleted</td>
                            <td style="width: 363px">
                                <asp:CheckBox ID="IsDelCHK" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 240px">&nbsp;</td>
                            <td style="width: 363px">&nbsp;</td>
                        </tr>
                
                </table>
                </fieldset>
                </asp:Panel>
           </td>
                
            <td>&nbsp;</td>
        </tr>
    </table>
    </form>
</asp:Content>

