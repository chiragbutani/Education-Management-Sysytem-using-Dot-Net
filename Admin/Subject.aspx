<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Subject.aspx.vb" Inherits="Admin_Subject" title="Untitled Page" %>

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
                DataKeyNames="Subject_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" CommandName="Delete" 
                                Height="25px" ImageUrl="~/Control Images/delete.jpg" Width="25px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" 
                                Height="25px" ImageUrl="~/Control Images/edit.png" Width="25px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Subject_id" HeaderText="Subject_id" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Subject_id" />
                    <asp:BoundField DataField="Subject_name" HeaderText="Subject_name" 
                        SortExpression="Subject_name" />
                    <asp:BoundField DataField="Course_name" HeaderText="Course_name" 
                        SortExpression="Course_name" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Insert New Subject" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Subject_master] WHERE [Subject_id] = @Subject_id" 
                InsertCommand="INSERT INTO [Subject_master] ([Subject_name], [Course_id]) VALUES (@Subject_name, @Course_id)" 
                SelectCommand="SELECT Subject_master.Subject_id, Subject_master.Subject_name, Subject_master.Course_id, Course_master.Course_name FROM Subject_master INNER JOIN Course_master ON Subject_master.Course_id = Course_master.Course_id" 
                
                UpdateCommand="UPDATE [Subject_master] SET [Subject_name] = @Subject_name, [Course_id] = @Course_id WHERE [Subject_id] = @Subject_id">
                <DeleteParameters>
                    <asp:Parameter Name="Subject_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Subject_name" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="Course_id" PropertyName="SelectedValue" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="GridView1" Name="Subject_id" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Subject_name" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="DropDownList1" Name="Course_id" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Name:</td>
                    <td>
                        <asp:TextBox ID="TextBox1" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="enter name"></asp:RequiredFieldValidator>
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
                        Course:&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    </td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" 
                            DataSourceID="SqlDataSource2" DataTextField="Course_name" 
                            DataValueField="Course_id" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Course_id], [Course_name] FROM [Course_master]">
                        </asp:SqlDataSource>
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
                        <asp:Button ID="button2" runat="server" Text="Insert" />
                    </td>
                    <td>
                        <asp:Button ID="button3" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

