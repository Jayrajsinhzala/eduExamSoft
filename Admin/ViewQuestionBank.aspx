<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewQuestionBank.aspx.cs" Inherits="ViewQuestionBank" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
     <form id="form1" runat="server">
    <table style="width: 100%">
       <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">QUESTION_BANK DETAILS</span></span></span></td>
        </tr>
        <tr>
            <td>
                <fieldset>
                    <legend style="color:#0f266d "><b>Search</b></legend>
                        <table style="width: 100%">
                    <tr>
                          <td style="width: 257px">
                              <asp:RadioButtonList ID="RadioButtonList1" runat="server">
                                  <asp:ListItem>Question_Id</asp:ListItem>
                              </asp:RadioButtonList>
                          </td>
                          <td>
                              <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Question_Id" DataValueField="Question_Id">
                              </asp:DropDownList>
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
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" DataKeyNames="Question_Id" DataSourceID="EntityDataSource1" PageSize="5" Width="100%" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                        <asp:BoundField DataField="Question_Id" HeaderText="Question_Id" ReadOnly="True" SortExpression="Question_Id" />
                        <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                        <asp:BoundField DataField="Unit_Id" HeaderText="Unit_Id" SortExpression="Unit_Id" />
                        <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" SortExpression="Emp_Id" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnEdit" runat="server" CommandArgument='<%# Eval("Question_Id") %>' CommandName="Edit" Height="36px" ImageUrl="~/images/Edit-file.png" Width="38px" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                            
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton ID="BtnDel" runat="server" CommandArgument='<%# Eval("Question_Id") %>' CommandName="BtnDelete" Height="39px" ImageUrl="~/images/Delete.png" OnClientClick="return confirm(&quot;Are You Sure To Detele........&quot;);" Width="40px" />
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
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Question_Bank" EntityTypeFilter="Question_Bank">
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
                        <td style="width: 269px">Question_Id</td>
                           <td style="width: 269px">
                               <asp:TextBox ID="TxtQuestionId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                          <td>
                              <asp:Button ID="Button1" runat="server" BackColor="#00006F" ForeColor="White" Text="Add New Option" OnClick="Button1_Click" />
                        </td>
                    </tr>
                    <tr>
                      <td style="width: 269px">Question</td>
                           <td style="width: 269px">
                               <asp:TextBox ID="TxtQuestion" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td rowspan="7">
                            <asp:GridView ID="GridView2" runat="server" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" AutoGenerateColumns="False" Visible="False" OnRowCommand="GridView2_RowCommand">
                                <AlternatingRowStyle BackColor="#DCDCDC" />
                                <Columns>
                                    <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                                    <asp:BoundField DataField="Option_Id" HeaderText="Option_Id" ReadOnly="True" SortExpression="Option_Id" />
                                    <asp:BoundField DataField="Option_Description" HeaderText="Option_Description" SortExpression="Option_Description" />
                                    <asp:BoundField DataField="IsTrue" HeaderText="IsTrue" SortExpression="IsTrue" />
                                    <asp:TemplateField HeaderText="Edit">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Option_Id") %>' CommandName="Edit" Height="36px" ImageUrl="~/images/Edit-file.png" Width="36px" />
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="Delete">
                                        <ItemTemplate>
                                            <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("Option_Id") %>' CommandName="btnDelete" Height="34px" ImageUrl="~/images/Delete.png" Width="35px" />
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
                            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Question_Option" EntityTypeFilter="Question_Option">
                            </asp:EntityDataSource>
                        </td>
                    </tr>
                    <tr>
                          <td style="width: 269px; height: 13px;">Question_Type_Id</td>
                           <td style="width: 269px; height: 13px;">
                               <asp:TextBox ID="TxtQ_Type_Id" runat="server" ReadOnly="True"></asp:TextBox>
                          </td>
                    </tr>
                    <tr>
                         <td style="width: 269px">Unit_Id</td>
                           <td style="width: 269px">
                               <asp:TextBox ID="TxtUnit_Id" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                        <td style="width: 269px">Emp_Id</td>
                           <td style="width: 269px">
                               <asp:TextBox ID="TxtEmp_Id" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 269px">D_O_E</td>
                           <td style="width: 269px">
                               <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 269px">D_O_M</td>
                          <td style="width: 269px">
                              <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                      <tr>
                        <td style="width: 269px; height: 29px;">IsDeleted</td>
                          <td style="width: 269px; height: 29px;">
                              <asp:CheckBox ID="IsDelCHK" runat="server" />
                          </td>
                           <td style="width: 269px">&nbsp;</td>
                    </tr>
                      <tr>
                        <td style="width: 269px">&nbsp;</td>
                          <td style="width: 269px">&nbsp;</td>
                           
                    </tr>
                      <tr>
                        <td style="width: 269px">&nbsp;</td>
                          <td style="width: 269px">&nbsp;</td>
                            <td colspan="2">
                                                <asp:Panel ID="AddnewOptionPanel" runat="server" Height="52px" Visible="False">
                                                    <table style="width: 100%">
                                                        <tr>
                                                           <td style="height: 33px">Options</td>
                                                           <td style="height: 33px">
                                                               <asp:TextBox ID="TxtOptDesc" runat="server"></asp:TextBox>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>IsTrue</td>
                                                           <td>
                                                               <asp:CheckBox ID="IsTrueCHK" runat="server" />
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                             <td>&nbsp;</td>
                                                           <td>
                                                               <asp:Button ID="BtnAddOption" runat="server" Text="Add Option" BackColor="#00006F" ForeColor="White" OnClick="BtnAddOption_Click" />
                                                             </td>
                                                        </tr>
                                                    </table>
                                                </asp:Panel>
                            </td>
                    </tr>
                
                        <tr>
                            <td style="width: 269px">&nbsp;</td>
                            <td style="width: 269px">&nbsp;</td>
                            
                        </tr>
                
                        <tr>
                            <td style="width: 269px">&nbsp;</td>
                            <td style="width: 269px">&nbsp;</td>
                            
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

