<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/eduExamMaster.master" AutoEventWireup="true" CodeFile="ConcernedQuestion.aspx.cs" Inherits="ConcernedQuestion" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <form id="form1" runat="server">
    <table style="width: 100%">
      <tr>
            <td style=" text-align: center;" colspan="6">
                &nbsp;<span style="font-size: x-large"><span style="color: #FF0066">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </span>
                </span><span 
                    style="color: #0f266d"><span style="font-family: Algerian"><span 
                    style="font-size: xx-large"> QUESTION WISE DETAILS</span></span></span></td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                            <asp:Button ID="BtnBack" runat="server" BackColor="#00006F" ForeColor="White" Text="Back" OnClick="BtnBack_Click" />
                            &nbsp;
                        </td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;</td>
        </tr>
         <tr>
            <td colspan="6">
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" DataSourceID="EntityDataSource1" GridLines="Vertical" Width="100%" DataKeyNames="Exam_Id" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <Columns>
                        <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                        <asp:BoundField DataField="Exam_Name" HeaderText="Exam_Name" SortExpression="Exam_Name" />
                        <asp:BoundField DataField="Duration" HeaderText="Duration" SortExpression="Duration" />
                        <asp:BoundField DataField="N_O_Q" HeaderText="N_O_Q" SortExpression="N_O_Q" />
                        <asp:BoundField DataField="Date_Of_Exam" HeaderText="Date_Of_Exam" SortExpression="Date_Of_Exam" />
                        <asp:BoundField DataField="Allow_Practice" HeaderText="Allow_Practice" SortExpression="Allow_Practice" />
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
            <td colspan="2">
                <asp:Label ID="Label1" runat="server" ForeColor="#CC0000"></asp:Label>
                &nbsp;
            </td>
            <td colspan="2">
                &nbsp;</td>
            <td colspan="2" align="right">
                <asp:Button ID="BtnGenrateRandomQuestion" runat="server" BackColor="#00006F" ForeColor="White" Text="Genrate Random Question" OnClick="BtnGenrateRandomQuestion_Click" />
               &nbsp;
            </td>
        </tr>
        <tr>
            <td colspan="6">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="3" align="center" style="width: 736px">
                <asp:Label ID="Label2" runat="server" ForeColor="#00006F" style="font-size: 8pt" Text="Available Questions"></asp:Label>
                &nbsp;
            </td>
            <td colspan="3" align="center">
                <asp:Label ID="Label3" runat="server" ForeColor="#00006F" style="font-size: 8pt" Text="Question Realated To Current Exam"></asp:Label>
                &nbsp;
            </td>
        </tr>
         <tr>
            <td colspan="6" style="height: 29px">
                </td>
        </tr>
         <tr>
            <td style="width: 360px">
                  &nbsp;
                  <asp:GridView ID="GridView2" runat="server" DataSourceID="EntityDataSource2" Width="106%" AutoGenerateColumns="False" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" OnRowCommand="GridView2_RowCommand" Visible="False">
                      <AlternatingRowStyle BackColor="#DCDCDC" />
                      <Columns>
                          <asp:ButtonField CommandName="Select" HeaderText="Select" ShowHeader="True" Text="Select" />
                          <asp:BoundField DataField="Question_Id" HeaderText="Question_Id" ReadOnly="True" SortExpression="Question_Id" />
                          <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                          <asp:BoundField DataField="Unit_Id" HeaderText="Unit_Id" SortExpression="Unit_Id" />
                          <asp:TemplateField HeaderText="Add">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImageButton1" runat="server" Height="39px" 
                                    ImageUrl="~/images/Add Record.png" Width="38px" 
                                    CommandArgument='<%# Eval("Question_Id") %>' CommandName="Add" />
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
                  <asp:EntityDataSource ID="EntityDataSource2" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ViewQuestions" EntityTypeFilter="ViewQuestion">
                  </asp:EntityDataSource>
                </td>
              <td style="width: 44px" colspan="4">
                &nbsp;</td>
             <td>
                 <asp:GridView ID="GridView3" runat="server" Width="77%" AutoGenerateColumns="False" DataSourceID="EntityDataSource3" BackColor="White" BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" GridLines="Vertical" OnRowCommand="GridView3_RowCommand" Visible="False">
                     <AlternatingRowStyle BackColor="#DCDCDC" />
                     <Columns>
                         <asp:BoundField DataField="Question_Id" HeaderText="Question_Id" ReadOnly="True" SortExpression="Question_Id" />
                         <asp:BoundField DataField="Question" HeaderText="Question" SortExpression="Question" />
                         <asp:BoundField DataField="Exam_Name" HeaderText="Exam_Name" SortExpression="Exam_Name" />
                         <asp:TemplateField HeaderText="Delete">
                            <ItemTemplate>
                                <asp:ImageButton ID="ImgDeleteButton" runat="server" CommandName="BtnDelete" 
                                    Height="34px" ImageUrl="~/images/Delete.png" Width="36px" 
                                    CommandArgument='<%# Eval("Question_Id") %>' />
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
                 <asp:EntityDataSource ID="EntityDataSource3" runat="server" ConnectionString="name=eduExamSoftDBEntities" DefaultContainerName="eduExamSoftDBEntities" EnableDelete="True" EnableFlattening="False" EnableInsert="True" EnableUpdate="True" EntitySetName="ViewExamQuestions" EntityTypeFilter="ViewExamQuestion">
                 </asp:EntityDataSource>
             </td>
         </tr>
    </table>
    </form>
</asp:Content>

