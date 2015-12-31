<%@ Page Language="VB" MasterPageFile="~/General.master" AutoEventWireup="false"
    CodeFile="Home.aspx.vb" Inherits="Test" Title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="Server">
Akash InfoTech provide world’s first and only life time support training programs that cover newer, innovative and affordable online higher education programs and courses that meet the needs of a wide and diverse market. <br /><center><img src="1.jpg" /></center><br /> With our expertise, students can study at their own pace to fulfill their educational goals. We help you in hiking your current salary or get you well deserved job and salary as per your expectations. Our training program also comes with life time support – only offered by us in the world. The programs cover cutting edge IT education updated regularly – programming, web technology and digital marketing.
</asp:Content>
<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="ContentPlaceHolder3">
    <h2>
        Courses Offered By Us</h2>
    <ul>
        <%  Dim dm As New datamanager
            Dim dt As System.Data.DataTable = dm.getdata("Select * from Course_Master")
            For i = 0 To dt.Rows.Count - 1%>
        <li><a href="#">
            <%=dt.Rows(i).Item(1).ToString()%></a></li>
        <%Next%>
    </ul>
</asp:Content>
