<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="Web_HyperVC.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center>
        <div class="jumbotron" style="background: #66FFFF url('Resouce/buwu.jpg') fixed center; width: 130%; background-repeat: no-repeat;">
            <div class="container" style="border: 3px solid #00FFFF; background-color: rgba(255, 255, 255,0.3); border-radius: 15px; width: 130%;">
                <h1>Contact!</h1>

                <p style="font-size: large">
                    This is HyperVC Group.&nbsp;&nbsp;&nbsp; Welcom to contact us.
                </p>

                <p style="font-size: large">
                    <strong>Support:</strong>   <a href="mailto:137017677@qq.com">137017677@qq.com</a>
                </p>
                <p style="font-size: large">
                    当然，您可以在下方输入任何您所想反馈的内容，我们将及时加以改进！
                </p>
                <p>
                    <asp:TextBox ID="TxtBoxContact" runat="server" ForeColor="Black" TextMode="MultiLine" BackColor="Transparent" Height="100px" Width="401px" BorderColor="#CCFFFF" BorderWidth="3px"></asp:TextBox>
                </p>
                <p>
                    <asp:Button ID="BtnContactSend" runat="server" Text="发送" OnClick="BtnContactSend_Click" Height="50px" Width="150px" BackColor="#CCFFFF" BorderStyle="None" />
                </p>

            </div>
        </div>
    </center>
</asp:Content>


