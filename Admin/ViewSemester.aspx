<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewSemester.aspx.cs" Inherits="ViewSemester" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
      <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">SEMESTER DETAILS</span></span></span></td>
        </tr>
       <tr>
            <td>
               <fieldset>
                                <legend style="color:#0f266d "><b>Search</b></legend>
                <table style="width: 100%">
                    <tr>
                         <td style="width: 191px">
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataTextField="Sem_Id" DataValueField="Sem_Id" RepeatDirection="Horizontal" Width="307px">
                                 <asp:ListItem>Sem_Id</asp:ListItem>
                                 <asp:ListItem>Sem_Description</asp:ListItem>
                             </asp:RadioButtonList>
                         </td>
                        <td style="width: 130px">
                            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        </td>
                        <td style="width: 189px">
                            <asp:Button ID="BtnFilter" runat="server" BackColor="#00006F" ForeColor="White" style="margin-left: 0px" Text=" Filter Record" Width="200px" OnClick="BtnFilter_Click" />
                        </td>
                        <td style="width: 186px">
                            <asp:Button ID="BtnRMV" runat="server" BackColor="#00006F" ForeColor="White" style="margin-left: 1px" Text="Remove Filter" Width="200px" OnClick="BtnRMV_Click" />
                        </td>
                        <td>
                            <asp:Button ID="BtnAdd" runat="server" BackColor="#00006F" ForeColor="White" style="margin-left: 0px" Text="Add New" Width="200px" OnClick="BtnAdd_Click" />
                        </td>
                    </tr>
                    
                </table>
               </fieldset>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="EntityDataSource1" GridLines="Vertical" Width="100%" OnRowCommand="GridView1_RowCommand" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" DataKeyNames="Sem_Id" AllowPaging="True" PageSize="5">
                    <AlternatingRowStyle BackColor="Gainsboro" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" HeaderText="select" ShowHeader="True" Text="select" />
                        <asp:BoundField DataField="Sem_Description" HeaderText="Sem_Description" SortExpression="Sem_Description" />
                        <asp:BoundField DataField="D_O_E" HeaderText="D_O_E" SortExpression="D_O_E" />
                        <asp:BoundField DataField="D_O_M" HeaderText="D_O_M" SortExpression="D_O_M" />
                        <asp:TemplateField HeaderText="Edit">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="35px" ImageUrl="~/images/Edit-file.png" Width="30px" CommandName="BtnEdit" CommandArgument='<%# Eval("Sem_Id") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                           
                            <ItemTemplate>
                                <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton2" runat="server" Height="31px" ImageUrl="~/images/Delete.png" Width="35px" CommandName="BtnDel" CommandArgument='<%# Eval("Sem_Id") %>' OnClientClick="return confirm(&quot;Are You Sure To Delete... &quot;);" />
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
                <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Semesters" EntityTypeFilter="Semester">
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
                        <td style="width: 316px">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="font-size: medium; width: 316px">Semester&nbsp; Id</td>
                        <td>
                            <asp:TextBox ID="Txt_Id" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 316px; font-size: medium">Semester Description</td>
                        <td>
                            <asp:TextBox ID="Txt_Desc" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 316px; font-size: medium">D_O_E</td>
                        <td>
                            <asp:TextBox ID="Txt_D_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 316px; font-size: medium; height: 33px;">D_O_M</td>
                        <td style="height: 33px">
                            <asp:TextBox ID="Txt_D_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 316px; font-size: medium">IsDeleted</td>
                        <td>
                            <asp:CheckBox ID="IsDelCHK" runat="server" />
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 316px">&nbsp;</td>
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

