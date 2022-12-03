<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web_HyperVC.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>!</h2>
    <address>
        This is HyperVC Group.&nbsp;&nbsp;&nbsp; Welcom to contact us.</address>

    <address>
        <strong>Support:</strong>   <a href="mailto:137017677@qq.com">137017677@qq.com</a></address>
    <address>
        当然，您可以在下方输入任何您所想反馈的内容，我们将及时加以改进！</address>
    <address>
        <asp:TextBox ID="TxtBoxContact" runat="server" Height="300px" OnTextChanged="TextBox1_TextChanged" Width="600px"></asp:TextBox>
    </address>
    <address>
        <asp:Button ID="BtnContactSend" runat="server" Height="30px" Text="发送" Width="600px" OnClick="BtnContactSend_Click" />
        <br />
    </address>
</asp:Content>
