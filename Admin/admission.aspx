<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Admission.aspx.vb" Inherits="Admin_Admission" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
        DataKeyNames="Admission_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Admission_id" HeaderText="Admission_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Admission_id" />
            <asp:BoundField DataField="Admission_date" DataFormatString="{0:d}" 
                HeaderText="Admission_date" SortExpression="Admission_date" />
            <asp:BoundField DataField="Student_name" HeaderText="Student_name" 
                SortExpression="Student_name" />
            <asp:BoundField DataField="fees" HeaderText="fees" SortExpression="fees" />
            <asp:TemplateField HeaderText="Subjects" InsertVisible="False" 
                SortExpression="Admission_id">
                <EditItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Eval("Admission_id") %>'></asp:Label>
                </EditItemTemplate>
                <ItemTemplate>
                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("Admission_id") %>' 
                        Visible="False"></asp:Label>
                    <br />
                    <asp:DataList ID="DataList1" runat="server" DataSourceID="SqlDataSource1" 
                        RepeatColumns="2">
                        <ItemTemplate>
                            &nbsp;<asp:Label ID="Subject_nameLabel" runat="server" 
                                Text='<%# Eval("Subject_name") %>' />
                            ,<br />
                            <br />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                        SelectCommand="SELECT Subject_master.Subject_name FROM Admission_details INNER JOIN Subject_master ON Admission_details.Subject_id = Subject_master.Subject_id WHERE (Admission_details.Admission_id = @Param1)">
                        <SelectParameters>
                            <asp:ControlParameter ControlID="Label1" Name="Param1" PropertyName="Text" />
                        </SelectParameters>
                    </asp:SqlDataSource>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT Admission_master.Admission_id, Admission_master.Admission_date, Student_master.Student_name, Admission_master.fees FROM Admission_master INNER JOIN Student_master ON Admission_master.Student_id = Student_master.Student_id">
    </asp:SqlDataSource>
            <asp:Button ID="Button1" runat="server" Text="Add New Admission" />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Select Student:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="Student_name" 
                            DataValueField="Student_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Student_id], [Student_name] FROM [Student_master]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        Course:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource4" DataTextField="Course_name" 
                            DataValueField="Course_id">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource4" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Course_id], [Course_name] FROM [Course_master]">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        Subjects:</td>
                    <td>
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" 
                            DataSourceID="SqlDataSource3" DataTextField="Subject_name" 
                            DataValueField="Subject_id">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Subject_id], [Subject_name] FROM [Subject_master] WHERE ([Course_id] = @Course_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList2" Name="Course_id" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td>
                        Fees:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="227px"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Add" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
    </asp:Content>

