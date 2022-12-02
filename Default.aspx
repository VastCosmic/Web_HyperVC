<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_HyperVC._Default" MaintainScrollPositionOnPostback="true"%>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>HyperVC - 高光谱图像分类</h1>
        <p>&nbsp;</p>
        <p>现在开始吧！使用简单的几步，即可完成图像分类：</p>
        <p>&nbsp;</p>
        <p>1. 图像上传</p>
        <p>您可以在此处选择图像后上传。（格式为.mat）</p>
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblStatus" runat="server" Text="是否正确上传图像：否"></asp:Label>
        </p>
        <p>
            <asp:Label ID="lblStatusFormat" runat="server" Text="当前文件格式：(未知)"></asp:Label>
        </p>
        <p>
            <asp:FileUpload ID="fileImgUp" runat="server" Height="45px" Width="300px" />
        </p>
        <p>
            <asp:Button ID="BtnUpImg" runat="server" Text="上传图像" Width="300px" OnClick="BtnUpImg_Click" />
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>2. 开始分类</p>
        <p>您的图像信息将显示在下方，请确认是否正确。</p>
        <p>选择数据集后，点击开始分类即可开始！</p>
        <p>&nbsp;</p>
        <p>
            图像名称：</p>
        <p>
            <asp:Label ID="lblImgName" runat="server" Text="（未知）"></asp:Label>
        </p>
        <p>
            图像大小：</p>
        <p>
            <asp:Label ID="lblImgSize" runat="server" Text="（未知）"></asp:Label>
        </p>
        <p>
            请选择图像所属数据集：</p>
        <p>
            <asp:Label ID="lblDataSet" runat="server" Text="（未知数据集）"></asp:Label>
        </p>
        <p>
            <asp:CheckBox ID="CheckBox_Dataset1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset1_CheckedChanged" Text="数据集1" />
            <asp:CheckBox ID="CheckBox_Dataset2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset2_CheckedChanged" Text="数据集2" />
            <asp:CheckBox ID="CheckBox_Dataset3" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset3_CheckedChanged" Text="数据集3" />
        </p>
        <p>
            <asp:Button ID="BtnStart" runat="server" Text="开始分类" Width="300px" />
        </p>
        <p>&nbsp;</p>
        <p>&nbsp;</p>
        <p>3. 分类结果</p>
        <p>激动人心的时刻到了，这是您的分类结果，请查看！</p>
        <p>(TODO......)</p>
    </div>
    
</asp:Content>
