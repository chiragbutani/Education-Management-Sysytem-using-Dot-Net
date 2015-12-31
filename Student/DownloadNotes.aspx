<%@ Page Language="VB" MasterPageFile="~/Student/Student.master" AutoEventWireup="false" CodeFile="DownloadNotes.aspx.vb" Inherits="Student_DownloadNotes" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <h1>Download Notes</h1>
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="Notes_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Notes_id" HeaderText="Notes_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Notes_id" />
            <asp:BoundField DataField="Upload_date" DataFormatString="{0:d}" 
                HeaderText="Upload_date" SortExpression="Upload_date" />
            <asp:BoundField DataField="Subject_name" HeaderText="Subject_name" 
                SortExpression="Subject_name" />
            <asp:TemplateField HeaderText="File" SortExpression="FileUpload">
                <ItemTemplate>
                    <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                        Text='<%# Bind("FileUpload") %>'></asp:LinkButton>
                </ItemTemplate>
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("FileUpload") %>'></asp:TextBox>
                </EditItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT Notes.Notes_id, Notes.Upload_date, Subject_master.Subject_name, Notes.FileUpload FROM Notes INNER JOIN Subject_master ON Notes.Subject_id = Subject_master.Subject_id">
</asp:SqlDataSource>
</asp:Content>

