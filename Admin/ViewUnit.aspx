<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ViewUnit.aspx.cs" Inherits="ViewUnit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
        <table style="width: 100%">
             <tr>
            <td style="text-align:center">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066"> </span>
                </span><span style="color: #0f266d; font-family: Algerian; font-size: xx-large">&nbsp;</span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large">UNIT DETAILS</span></span></span></td>
        </tr>
         <tr>
            <td>
               <fieldset>
                                <legend style="color:#0f266d "><b>Search</b></legend>
                <table style="width: 100%">
                    <tr>
                         <td style="width: 191px">
                             <asp:RadioButtonList ID="RadioButtonList1" runat="server" >
                                 <asp:ListItem>Unit_Id</asp:ListItem>
                             </asp:RadioButtonList>
                         </td>
                         <td style="width: 130px">
                             <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="EntityDataSource1" DataTextField="Unit_Id" DataValueField="Unit_Id">
                             </asp:DropDownList>
                         </td>
                         <td>
                             <asp:Button ID="BtnFilter" runat="server" BackColor="#00006F" ForeColor="White" Text="Filter Record" Width="250px" OnClick="BtnFilter_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnRmv" runat="server" BackColor="#00006F" ForeColor="White" Text="Remove Filter" Width="250px" OnClick="BtnRmv_Click" />
                         </td>
                         <td>
                             <asp:Button ID="BtnAdd" runat="server" BackColor="#00006F" ForeColor="White" Text="Add New" Width="250px" OnClick="BtnAdd_Click" />
                         </td>

                    </tr>
                    
                </table>
               </fieldset>
            </td>
            <td>&nbsp;</td>
        </tr>
        <tr>
                <td>
                    <asp:GridView ID="GridView1" runat="server" DataSourceID="EntityDataSource1" Width="100%" AutoGenerateColumns="False" DataKeyNames="Unit_Id" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" OnRowCommand="GridView1_RowCommand">
                        <AlternatingRowStyle BackColor="#DCDCDC" />
                        <Columns>
                            <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                            <asp:BoundField DataField="Unit_Name" HeaderText="Unit_Name" SortExpression="Unit_Name" />
                            <asp:BoundField DataField="Unit_Description" HeaderText="Unit_Description" SortExpression="Unit_Description" />
                            <asp:BoundField DataField="D_O_E" HeaderText="D_O_E" SortExpression="D_O_E" DataFormatString="&quot;{0:d}&quot;" />
                            <asp:BoundField DataField="D_O_M" HeaderText="D_O_M" SortExpression="D_O_M" DataFormatString="&quot;{0:d}&quot;" />
                            <asp:TemplateField HeaderText="Edit">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton1" runat="server" CommandArgument='<%# Eval("Unit_Id") %>' CommandName="BtnEdit" Height="33px" ImageUrl="~/images/Edit-file.png" Width="31px" />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="IsDeleted" SortExpression="IsDeleted">
                               
                                <ItemTemplate>
                                    <asp:Image ID="Image1" runat="server" ImageUrl='<%# "~/images/"+Eval("IsDeleted")+".png" %>' />
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="Delete">
                                <ItemTemplate>
                                    <asp:ImageButton ID="ImageButton2" runat="server" CommandArgument='<%# Eval("Unit_Id") %>' CommandName="BtnDel" Height="46px" ImageUrl="~/images/Delete.png" Width="41px" OnClientClick="return confirm(&quot;Are You Sure To Delete.... &quot;);" />
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
                    <asp:EntityDataSource ID="EntityDataSource1" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="Units" EntityTypeFilter="Unit">
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
                         <td style="width: 300px">&nbsp;</td>
                         <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="width: 300px">Unit Id</td>
                         <td>
                             <asp:TextBox ID="TxtUnitId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px">SubSem Id</td>
                         <td>
                             <asp:TextBox ID="TxtSubSemId" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px">Unit Name</td>
                         <td>
                             <asp:TextBox ID="TxtUName" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px">Unit Description</td>
                         <td>
                             <asp:TextBox ID="TxtUDesc" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                       <td style="width: 300px">D_O_E</td>
                         <td>
                             <asp:TextBox ID="TxtD_O_E" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 300px">D_O_M</td>
                         <td>
                             <asp:TextBox ID="TxtD_O_M" runat="server" ReadOnly="True"></asp:TextBox>
                        </td>
                    </tr>
                
                        <tr>
                            <td style="width: 300px">IsDeleted</td>
                            <td>
                                <asp:CheckBox ID="IsDelCHK" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 300px">&nbsp;</td>
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

