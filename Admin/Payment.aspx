<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Payment.aspx.vb" Inherits="Admin_Payment" title="Untitled Page" %>
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
                DataKeyNames="Payment_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:CommandField ShowSelectButton="True" />
                    <asp:BoundField DataField="Payment_id" HeaderText="Payment_id" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Payment_id" />
                    <asp:BoundField DataField="Payment_date" HeaderText="Payment_date" 
                        SortExpression="Payment_date" />
                    <asp:BoundField DataField="Amount" HeaderText="Amount" 
                        SortExpression="Amount" />
                    <asp:BoundField DataField="Admission_id" HeaderText="Admission_id" 
                        SortExpression="Admission_id" />
                    <asp:BoundField DataField="Mode of payment" HeaderText="Mode of payment" 
                        SortExpression="Mode of payment" />
                    <asp:BoundField DataField="Bank_name" HeaderText="Bank_name" 
                        SortExpression="Bank_name" />
                    <asp:BoundField DataField="Cheque_no" HeaderText="Cheque_no" 
                        SortExpression="Cheque_no" />
                    <asp:BoundField DataField="Cheque_date" HeaderText="Cheque_date" 
                        SortExpression="Cheque_date" />
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="new record" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Payment] WHERE [Payment_id] = @Payment_id" 
                InsertCommand="INSERT INTO [Payment] ([Payment_date], [Amount], [Admission_id], [Mode of payment], [Bank_name], [Cheque_no], [Cheque_date]) VALUES (@Payment_date, @Amount, @Admission_id, @Mode_of_payment, @Bank_name, @Cheque_no, @Cheque_date)" 
                SelectCommand="SELECT * FROM [Payment]" 
                UpdateCommand="UPDATE [Payment] SET [Payment_date] = @Payment_date, [Amount] = @Amount, [Admission_id] = @Admission_id, [Mode of payment] = @Mode_of_payment, [Bank_name] = @Bank_name, [Cheque_no] = @Cheque_no, [Cheque_date] = @Cheque_date WHERE [Payment_id] = @Payment_id">
                <DeleteParameters>
                    <asp:Parameter Name="Payment_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Payment_date" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Amount" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Admission_id" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox4" Name="Mode_of_payment" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Bank_name" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox6" Name="Cheque_no" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox7" Name="Cheque_date" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="GridView1" Name="Payment_id" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Payment_date" 
                        PropertyName="Text" Type="DateTime" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Amount" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox3" Name="Admission_id" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox4" Name="Mode_of_payment" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Bank_name" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox6" Name="Cheque_no" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox7" Name="Cheque_date" 
                        PropertyName="Text" Type="DateTime" />
                </InsertParameters>
            </asp:SqlDataSource>
        </asp:View>
        <asp:View ID="View2" runat="server">
            <table class="style1">
                <tr>
                    <td>
                        Date:</td>
                    <td>
                        <asp:TextBox ID="txtDate" runat="server" Width="150px"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtDate" ErrorMessage="enter payment_date"></asp:RequiredFieldValidator>
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
                        Student:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList1" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource2" DataTextField="Student_name" 
                            DataValueField="Student_id" Height="19px" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Student_id], [Student_name] FROM [Student_master]">
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
                        Admission:</td>
                    <td>
                        <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                            DataSourceID="SqlDataSource3" DataTextField="Admission_id" 
                            DataValueField="Admission_id" Width="150px">
                        </asp:DropDownList>
                        <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                            ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                            SelectCommand="SELECT [Admission_id] FROM [Admission_master] WHERE ([Student_id] = @Student_id)">
                            <SelectParameters>
                                <asp:ControlParameter ControlID="DropDownList1" Name="Student_id" 
                                    PropertyName="SelectedValue" Type="Decimal" />
                            </SelectParameters>
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
                        <asp:Label ID="Label1" runat="server" Text="Fees:" Visible="False"></asp:Label>
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text="Label" Visible="False"></asp:Label>
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
                        Amount:</td>
                    <td>
                        <asp:TextBox ID="txtAmt" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="txtAmt" ErrorMessage="enter amount"></asp:RequiredFieldValidator>
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
                        Mode:</td>
                    <td>
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                            RepeatDirection="Horizontal">
                            <asp:ListItem>Cash</asp:ListItem>
                            <asp:ListItem>Cheque</asp:ListItem>
                        </asp:RadioButtonList>
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        &nbsp;</td>
                </tr>
                <tr>
                    <td colspan="2">
                        <asp:Panel ID="Panel1" runat="server" Visible="False" Width="644px">
                            <table class="style1">
                                <tr>
                                    <td>
                                        Bank Name:</td>
                                    <td>
                                        <asp:TextBox ID="txtBank" runat="server" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                                            ControlToValidate="txtBank" ErrorMessage="enter bank name"></asp:RequiredFieldValidator>
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
                                        Cheque Number:</td>
                                    <td>
                                        <asp:TextBox ID="txtChequeno" runat="server" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="txtChequeno" ErrorMessage="enter cheque_no"></asp:RequiredFieldValidator>
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
                                        Cheque Date:</td>
                                    <td>
                                        <asp:TextBox ID="txtChequeDate" runat="server" Width="150px"></asp:TextBox>
                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="txtChequeDate" ErrorMessage="enter date"></asp:RequiredFieldValidator>
                                    </td>
                                </tr>
                            </table>
                        </asp:Panel>
                    </td>
                </tr>
                <tr>
                    <td colspan="2">
                        &nbsp;</td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Insert" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Cancel" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

