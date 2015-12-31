<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="notes.aspx.vb" Inherits="Admin_notes" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:MultiView ID="MultiView1" runat="server" ActiveViewIndex="0">
        <asp:View ID="View1" runat="server">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="Notes_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:BoundField DataField="Notes_id" HeaderText="Notes_id" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Notes_id" />
                    <asp:BoundField DataField="Subject_id" HeaderText="Subject_id" 
                        SortExpression="Subject_id" />
                    <asp:BoundField DataField="Upload_date" HeaderText="Upload_date" 
                        SortExpression="Upload_date" DataFormatString="{0:d}" />
                    <asp:BoundField DataField="FileUpload" HeaderText="FileUpload" 
                        SortExpression="FileUpload" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="new record" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Notes] WHERE [Notes_id] = @Notes_id" 
                InsertCommand="INSERT INTO [Notes] ([Subject_id], [Upload_date], [FileUpload]) VALUES (@Subject_id, @Upload_date, @FileUpload)" 
                SelectCommand="SELECT * FROM [Notes]" 
                UpdateCommand="UPDATE [Notes] SET [Subject_id] = @Subject_id, [Upload_date] = @Upload_date, [FileUpload] = @FileUpload WHERE [Notes_id] = @Notes_id">
                <DeleteParameters>
                    <asp:Parameter Name="Notes_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="Subject_id" Type="Decimal" />
                    <asp:Parameter Name="Upload_date" Type="DateTime" />
                    <asp:Parameter Name="FileUpload" Type="String" />
                    <asp:Parameter Name="Notes_id" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Subject_id" 
                        PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Upload_date" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="FileUpload1" Name="FileUpload" 
                        PropertyName="FileName" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Subject_id&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="TextBox1" ErrorMessage="enter subject_id"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Upload_date&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="enter date"></asp:RequiredFieldValidator>
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        Fileupload&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:FileUpload ID="FileUpload1" runat="server" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button2" runat="server" Text="insert" />
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <asp:Button ID="Button3" runat="server" Text="cancel" />
                    </td>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

