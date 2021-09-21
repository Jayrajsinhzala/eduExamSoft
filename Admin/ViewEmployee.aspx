<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewEmployee.aspx.cs" Inherits="ViewEmployee" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
       <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">EMPLOYEE DETAILS</span></span></span></td>
        </tr>
         <tr>
            <td>
                <fieldset>
                    <legend style="color:#0f266d "><b>Search</b></legend>
                        <table style="width: 100%">
                    <tr>
                         <td style="width: 299px">
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal">
                                 <asp:ListItem>Emp_Id</asp:ListItem>
                                 <asp:ListItem>Emp_Designation</asp:ListItem>
                             </asp:RadioButtonList>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                         </td>
                         <td>
                             <asp:Button ID="BtnFilter" runat="server" BackColor="#00006F" Text="Filter Record" Width="200px" ForeColor="White" OnClick="BtnFilter_Click"  />
                         </td>
                         <td>
                             <asp:Button ID="BtnRmv" runat="server" BackColor="#00006F" Text="Remove Filter" Width="200px" ForeColor="White" OnClick="BtnRmv_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnAdd" runat="server" BackColor="#00006F" Text="Add New" Width="200px" ForeColor="White" OnClick="BtnAdd_Click" />
                         </td>
                    </tr>
                </table>

                </fieldset>
            </td>

        </tr>
        <tr>
              <td>
                  <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Emp_Id" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound" AllowPaging="True" PageSize="5">
                      <AlternatingRowStyle BackColor="Gainsboro" />
                      <Columns>
                          <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                          <asp:BoundField DataField="Emp_Id" HeaderText="Emp_Id" ReadOnly="True" SortExpression="Emp_Id" />
                          <asp:BoundField DataField="Emp_Name" HeaderText="Emp_Name" SortExpression="Emp_Name" />
                          <asp:BoundField DataField="City" HeaderText="City" SortExpression="City" />
                          <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                          <asp:BoundField DataField="Emp_Designation" HeaderText="Emp_Designation" SortExpression="Emp_Designation" />
                          <asp:BoundField DataField="Email_ID" HeaderText="Email_ID" SortExpression="Email_ID" />
                          <asp:TemplateField HeaderText="Edit">
                              <ItemTemplate>
                                  <asp:ImageButton ID="BtnEdit" runat="server" CommandArgument='<%# Eval("Emp_Id") %>' Height="44px" ImageUrl="~/images/Edit-file.png" Width="38px" CommandName="BtnEdit" />
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                              
                              <ItemTemplate>
                                  <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Delete">
                              <ItemTemplate>
                                  <asp:ImageButton ID="ImgDelete" runat="server" CommandArgument='<%# Eval("Emp_Id") %>' Height="41px" ImageUrl="~/images/Delete.png" Width="38px" CommandName="BtnDel" OnClientClick="return confirm(&quot;Are you Sure To Delete!!!&quot;);" />
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
                  <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Employee_Master" EntityTypeFilter="Employee_Master">
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
                       <td style="width: 250px">&nbsp;</td>
                        <td style="width: 363px">&nbsp;</td>
                    </tr>
                    <tr>
                       <td style="height: 29px; width: 250px">Emp_ID</td>
                        <td style="height: 29px; width: 363px;">
                            <asp:TextBox ID="TxtEID" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 250px; height: 31px;">Emp_name</td>
                        <td style="width: 363px; height: 31px;">
                            <asp:TextBox ID="TxtEName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                         <td style="width: 250px; height: 31px;">D_O_B</td>
                        <td style="width: 363px; height: 31px;">
                            <asp:TextBox ID="TxtD_O_B" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                         <td style="width: 250px">Age</td>
                        <td style="width: 363px">
                            <asp:TextBox ID="TxtAge" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>
                        <td style="width: 118px">Teaches Subject</td>
                        <td rowspan="2">
                            <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="EntityDataSource2" DataTextField="Sub_Description" DataValueField="Sub_Id" style="margin-left: 0px"  RepeatDirection="Horizontal">
                            </asp:CheckBoxList>
                            <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableFlattening="False" EntitySetName="SubjectViews" EntityTypeFilter="SubjectView" Select="it.[Sub_Id], it.[Sub_Description]">
                            </asp:EntityDataSource>
                         </td>
                    </tr>
                    <tr>
                        <td style="width: 250px">City</td>
                        <td style="width: 363px">
                            <asp:TextBox ID="TxtCity" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                        <td style="width: 118px">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="height: 29px; width: 250px">State</td>
                        <td style="height: 29px; width: 363px;">
                            <asp:TextBox ID="TxtState" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                
                        <tr>
                            <td style="height: 29px; width: 250px">Emp_Designation</td>
                            <td style="height: 29px; width: 363px;">
                                <asp:TextBox ID="TxtDesignation" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                             <td colspan="2">
                                             &nbsp;  
                                             <asp:Button ID="BtnSubmit" runat="server" BackColor="#00006F" Text="Submit" ForeColor="White" OnClick="BtnSubmit_Click" />
                                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">D_O_J</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_J" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">D_O_E</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">D_O_M</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px; height: 29px;">Contact_Number</td>
                            <td style="height: 29px; width: 363px;">
                                <asp:TextBox ID="TxtCNo" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                
                        <tr>
                            <td style="width: 250px">Email_Id</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtEmail" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">IsDeleted</td>
                            <td style="width: 363px">
                                <asp:CheckBox ID="IsDelCHK" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">Gender</td>
                            <td style="width: 363px">
                                <asp:TextBox ID="TxtGender" runat="server" ReadOnly="True"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 250px">Emp_Image</td>
                            <td style="width: 363px">
                                <asp:Image ID="EmpImg" runat="server" />
                            </td>
                        </tr>
                
                        <tr>
                            <td style="width: 250px">&nbsp;</td>
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

