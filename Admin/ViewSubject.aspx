<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewSubject.aspx.cs" Inherits="ViewSubject" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
       <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">Subject DETAILS</span></span></span></td>
        </tr>
        <tr>
            <td>
                <fieldset>
                    <legend style="color:#0f266d "><b>Search</b></legend>
                        <table style="width: 100%">
                    <tr>
                         <td style="width: 235px">
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal" Width="306px">
                                 <asp:ListItem>Sub_Id</asp:ListItem>
                                 <asp:ListItem>Sub_Description</asp:ListItem>
                             </asp:RadioButtonList>
                         </td>
                         <td>
                             <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                         </td>
                         <td>
                             <asp:Button ID="BtnFilter" runat="server" BackColor="#00006F" Text="Filter Record" Width="200px" ForeColor="White" OnClick="BtnFilter_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnRmv" runat="server" BackColor="#00006F" Text="Remove Filter" Width="200px" ForeColor="White"  OnClick="BtnRmv_Click" />
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
                  <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" Width="100%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataKeyNames="Sub_Id" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand" OnRowDataBound="GridView1_RowDataBound">
                      <AlternatingRowStyle BackColor="#DCDCDC" />
                      <Columns>
                          <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                          <asp:BoundField DataField="Sub_Description" HeaderText="Sub_Description" SortExpression="Sub_Description" />
                          <asp:BoundField DataField="D_O_E" HeaderText="D_O_E" SortExpression="D_O_E" />
                          <asp:BoundField DataField="D_O_M" HeaderText="D_O_M" SortExpression="D_O_M" />
                          <asp:TemplateField HeaderText="Edit">
                              <ItemTemplate>
                                  <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Sub_Id") %>' Height="40px" ImageUrl="~/images/Edit-file.png" Width="42px" CommandName="Btn_Edit" />
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                              <ItemTemplate>
                                  <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~\\images\\"+Eval("IsDeleted")+".png" %>' />
                              </ItemTemplate>
                          </asp:TemplateField>
                          <asp:TemplateField HeaderText="Delete">
                              <ItemTemplate>
                                  <asp:ImageButton ID="ImgDelete" runat="server" CommandArgument='<%# Eval("Sub_Id") %>' Height="44px" ImageUrl="~/images/Delete.png" Width="48px" CommandName="Btn_Del" OnClientClick="return confirm(&quot;Are you Sure To Delete!!!&quot;);" />
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
                  <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Subject_Master">
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
                        <td style="width: 269px">&nbsp;</td>
                         <td>&nbsp;</td>
                    </tr>
                    <tr>
                       <td style="font-size: medium; width: 269px">Subject Id</td>
                         <td>
                             <asp:TextBox ID="TxtId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                          <td style="font-size: medium; width: 269px">Subject Description</td>
                         <td>
                             <asp:TextBox ID="TxtDesc" runat="server" ReadOnly="True"></asp:TextBox>
                          </td>
                    </tr>
                    <tr>
                          <td style="font-size: medium; width: 269px">D_O_E</td>
                         <td>
                             <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                          </td>
                    </tr>
                    <tr>
                         <td style="font-size: medium; width: 269px">D_O_M</td>
                          <td>
                              <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                         </td>
                    </tr>
                    <tr>
                         <td style="font-size: medium; width: 269px">IsDeleted</td>
                         <td>
                             <asp:CheckBox ID="IsDelCHK" runat="server" />
                         </td>
                    </tr>
                    <tr>
                        <td style="width: 269px">&nbsp;</td>
                        <td>&nbsp;</td>
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

