<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_HyperVC._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>HyperVC - 高光谱图像分类</h1>
        <p>&nbsp;</p>
        <p>现在开始吧！使用简单的几步，即可完成图像分类：</p>
        <p>1. 图像上传</p>
        <p>您可以在此处选择图像后上传。</p>
        <p>
            <asp:Image ID="ImgUser" runat="server" BackColor="White" BorderColor="#FFCCFF" BorderWidth="3px" Height="300px" ToolTip="请上传您的图像" Width="300px" />
        </p>
        <p>
            <asp:FileUpload ID="ImgUp" runat="server" Height="45px" Width="300px" />
        </p>
        <p>
            <asp:Button ID="BtnUpImg" runat="server" Text="上传图像" Width="300px" />
        </p>
        <p>&nbsp;</p>
        <p>2. 开始分类</p>
        <p>您的图像显示在下方，请确认是否正确，点击开始分类即可开始！</p>
        <p>
            <asp:Image ID="ImgUserCheck" runat="server" BackColor="White" BorderColor="#FFCCFF" BorderWidth="3px" Height="300px" ToolTip="请检查确认您的图像" Width="300px" />
        </p>
        <p>
            <asp:Button ID="BtnStart" runat="server" Text="开始分类" Width="300px" />
        </p>
        <p>&nbsp;</p>
        <p>3. 分类结果</p>
        <p>激动人心的时刻到了，这是您的分类结果，请查看！</p>
        <p>(TODO......)</p>
    </div>

</asp:Content>
