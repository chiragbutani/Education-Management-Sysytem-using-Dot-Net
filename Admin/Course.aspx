<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false"
    CodeFile="Course.aspx.vb" Inherits="Admin_Course" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataKeyNames="Course_id"
                DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" ImageUrl="~/Control Images/delete.jpg"
                                Width="25px" CommandName="Delete" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" Height="25px" ImageUrl="~/Control Images/edit.png"
                                Width="25px" CommandName="Select" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Course_id" HeaderText="Course_id" InsertVisible="False"
                        ReadOnly="True" SortExpression="Course_id" />
                    <asp:BoundField DataField="Course_name" HeaderText="Course_name" SortExpression="Course_name" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="btnnew" runat="server" Text="new record" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                DeleteCommand="DELETE FROM [Course_master] WHERE [Course_id] = @Course_id" InsertCommand="INSERT INTO [Course_master] ([Course_name]) VALUES (@Course_name)"
                SelectCommand="SELECT * FROM [Course_master]" UpdateCommand="UPDATE [Course_master] SET [Course_name] = @Course_name WHERE [Course_id] = @Course_id">
                <DeleteParameters>
                    <asp:Parameter Name="Course_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="txtCourse" Name="Course_name" PropertyName="Text"
                        Type="String" />
                    <asp:ControlParameter ControlID="GridView2" Name="Course_id" PropertyName="SelectedValue"
                        Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="txtCourse" Name="Course_name" PropertyName="Text"
                        Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
            <br />
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Name:
                    </td>
                    <td>
                        <asp:TextBox ID="txtCourse" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="txtCourse"
                            ErrorMessage="enter name"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="btnInsert" runat="server" Text="Insert" />
                    </td>
                    <td>
                        <asp:Button ID="btnCancel" runat="server" Text="Cancel" />
                    </td>
                    <td>
                        &nbsp;
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>
