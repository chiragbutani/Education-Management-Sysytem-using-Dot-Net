<%@ Page Language="VB" MasterPageFile="~/Student/Student.master" AutoEventWireup="false" CodeFile="MyPayments.aspx.vb" Inherits="Student_MyPayments" title="Untitled Page" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" Runat="Server">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
    DataKeyNames="Payment_id" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="Payment_id" HeaderText="Payment_id" 
                InsertVisible="False" ReadOnly="True" SortExpression="Payment_id" />
            <asp:BoundField DataField="Payment_date" DataFormatString="{0:d}" 
                HeaderText="Payment_date" SortExpression="Payment_date" />
            <asp:BoundField DataField="Amount" HeaderText="Amount" 
                SortExpression="Amount" />
            <asp:BoundField DataField="Mode of payment" HeaderText="Mode of payment" 
                SortExpression="Mode of payment" />
            <asp:BoundField DataField="Cheque_no" HeaderText="Cheque_no" 
                SortExpression="Cheque_no" />
            <asp:BoundField DataField="Bank_name" HeaderText="Bank_name" 
                SortExpression="Bank_name" />
            <asp:BoundField DataField="Cheque_date" DataFormatString="{0:d}" 
                HeaderText="Cheque_date" SortExpression="Cheque_date" />
        </Columns>
    </asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
    SelectCommand="SELECT Payment.Payment_id, Payment.Payment_date, Payment.Amount, Payment.[Mode of payment], Payment.Cheque_no, Payment.Bank_name, Payment.Cheque_date FROM Payment INNER JOIN Admission_master ON Payment.Admission_id = Admission_master.Admission_id WHERE (Admission_master.Student_id = @Param1)">
    <SelectParameters>
        <asp:SessionParameter Name="Param1" SessionField="sid" />
    </SelectParameters>
</asp:SqlDataSource>
</asp:Content>

