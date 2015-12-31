<%@ Page Language="VB" MasterPageFile="~/Admin/Admin.master" AutoEventWireup="false" CodeFile="Faculty.aspx.vb" Inherits="Admin_Faculty" title="Untitled Page" %>

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
                DataKeyNames="Faculty_id" DataSourceID="SqlDataSource1">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton2" runat="server" Height="25px" 
                                ImageUrl="~/Control Images/delete.jpg" Width="25px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField ShowHeader="False">
                        <ItemTemplate>
                            <asp:ImageButton ID="ImageButton1" runat="server" CommandName="Select" 
                                Height="25px" ImageUrl="~/Control Images/edit.png" Width="25px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Faculty_id" HeaderText="Faculty_id" 
                        InsertVisible="False" ReadOnly="True" SortExpression="Faculty_id" />
                    <asp:BoundField DataField="Faculty_name" HeaderText="Faculty_name" 
                        SortExpression="Faculty_name" />
                    <asp:TemplateField HeaderText="Address" SortExpression="Address">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Address") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("Address") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label2" runat="server" Text='<%# Bind("City") %>'></asp:Label>
                            <br />
                            <asp:Label ID="Label3" runat="server" Text='<%# Bind("Pincode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="Contact_no" HeaderText="Contact_no" 
                        SortExpression="Contact_no" />
                    <asp:BoundField DataField="Mobile_no" HeaderText="Mobile_no" 
                        SortExpression="Mobile_no" />
                    <asp:BoundField DataField="Email_id" HeaderText="Email_id" 
                        SortExpression="Email_id" />
                    <asp:TemplateField HeaderText="Faculty_image" SortExpression="Faculty_image">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Faculty_image") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Image ID="Image2" runat="server" Height="75px" 
                                ImageUrl='<%# "~\UploadDoc\" + Eval("Faculty_image") %>' Width="75px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <br />
            <asp:Button ID="Button1" runat="server" Text="Add Faculty" />
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
                DeleteCommand="DELETE FROM [Faculty_master] WHERE [Faculty_id] = @Faculty_id" 
                InsertCommand="INSERT INTO [Faculty_master] ([Faculty_name], [Address], [City], [Pincode], [Contact_no], [Mobile_no], [Email_id], [Faculty_image]) VALUES (@Faculty_name, @Address, @City, @Pincode, @Contact_no, @Mobile_no, @Email_id, @Faculty_image)" 
                SelectCommand="SELECT * FROM [Faculty_master]" 
                UpdateCommand="UPDATE [Faculty_master] SET [Faculty_name] = @Faculty_name, [Address] = @Address, [City] = @City, [Pincode] = @Pincode, [Contact_no] = @Contact_no, [Mobile_no] = @Mobile_no, [Email_id] = @Email_id, [Faculty_image] = @Faculty_image WHERE [Faculty_id] = @Faculty_id">
                <DeleteParameters>
                    <asp:Parameter Name="Faculty_id" Type="Decimal" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Faculty_name" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Address" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="City" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox4" Name="Pincode" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Contact_no" 
                        PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox6" Name="Mobile_no" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox7" Name="Email_id" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="Label1" Name="Faculty_image" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="GridView1" Name="Faculty_id" 
                        PropertyName="SelectedValue" Type="Decimal" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="Faculty_name" 
                        PropertyName="Text" Type="String" />
                    <asp:ControlParameter ControlID="TextBox2" Name="Address" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox3" Name="City" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="TextBox4" Name="Pincode" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox5" Name="Contact_no" 
                        PropertyName="Text" Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox6" Name="Mobile_no" PropertyName="Text" 
                        Type="Decimal" />
                    <asp:ControlParameter ControlID="TextBox7" Name="Email_id" PropertyName="Text" 
                        Type="String" />
                    <asp:ControlParameter ControlID="FileUpload1" Name="Faculty_image" 
                        PropertyName="FileName" Type="String" />
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
                        Addres:</td>
                    <td>
                        <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                            ControlToValidate="TextBox2" ErrorMessage="enter address"></asp:RequiredFieldValidator>
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
                        City:</td>
                    <td>
                        <asp:TextBox ID="TextBox3" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                            ControlToValidate="TextBox3" ErrorMessage="enter city"></asp:RequiredFieldValidator>
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
                        PinCode:</td>
                    <td>
                        <asp:TextBox ID="TextBox4" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                            ControlToValidate="TextBox4" ErrorMessage="enter pincode"></asp:RequiredFieldValidator>
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
                        Contact:</td>
                    <td>
                        <asp:TextBox ID="TextBox5" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                            ControlToValidate="TextBox5" ErrorMessage="enter contact_no"></asp:RequiredFieldValidator>
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
                        Mobile :</td>
                    <td>
                        <asp:TextBox ID="TextBox6" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                            ControlToValidate="TextBox6" ErrorMessage="enter mobile_no"></asp:RequiredFieldValidator>
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
                        Email:</td>
                    <td>
                        <asp:TextBox ID="TextBox7" runat="server" Width="150px"></asp:TextBox>
                        &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                            ControlToValidate="TextBox7" ErrorMessage="enter email_id"></asp:RequiredFieldValidator>
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
                        Image:</td>
                    <td>
                        <asp:Image ID="Image1" runat="server" Height="100px" Visible="False" 
                            Width="100px" />
                        <br />
                        <asp:LinkButton ID="LinkButton1" runat="server" Visible="False">Change Image</asp:LinkButton>
                        <br />
                        <asp:FileUpload ID="FileUpload1" runat="server" Width="253px" />
                    </td>
                </tr>
                <tr>
                    <td>
                        &nbsp;</td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Button ID="Button2" runat="server" Text="Insert" />
                    </td>
                    <td>
                        <asp:Button ID="Button3" runat="server" Text="Cancel" Width="55px" />
                    </td>
                </tr>
            </table>
        </asp:View>
    </asp:MultiView>
</asp:Content>

