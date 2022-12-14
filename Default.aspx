<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Web_HyperVC._Default" MaintainScrollPositionOnPostback="true" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">


    <div class="jumbotron" aria-hidden="False" dir="ltr" style="background: #66FFFF url('Resouce/buwu.jpg') no-repeat fixed center; width: 130%; text-align: center;">
        <center>
            <h1 aria-invalid="true">HyperVC - 高光谱图像分类</h1>
        </center>

        <p>&nbsp;</p>

        <div class="container" style="border: 3px solid #00FFFF; background-color: rgb(165, 243, 246, 0.4); border-radius: 15px; width: 130%;">
            <p style="font-weight: bold">1. 图像上传</p>
            <p>您可以在此处选择图像后上传。（格式为.mat）</p>
            <p>&nbsp;</p>
            <p>
                <asp:Label ID="lblStatus" runat="server" Text="是否正确上传图像：否" BorderColor="#CCCCFF" BorderStyle="Solid"></asp:Label>
            </p>
            <p>
                <asp:Label ID="lblStatusFormat" runat="server" Text="当前文件格式：(未知)" BorderColor="#CCCCFF" BorderStyle="Solid"></asp:Label>
            </p>
            <p>
                <center>
                    <asp:FileUpload ID="fileImgUp" runat="server" Height="45px" Width="200px" BorderColor="#CCCCFF" BorderWidth="3px" />
                </center>
            </p>
            <p>
                <asp:Button ID="BtnUpImg" runat="server" Text="上传图像" Width="300px" OnClick="BtnUpImg_Click" BorderColor="#CCFFFF" />
            </p>
        </div>

        <p>&nbsp;</p>

        <div class="container" style="border: 3px solid #00FFFF; background-color: rgb(165, 243, 246, 0.4); border-radius: 15px; width: 130%;">

            <p style="font-weight: bold">2. 开始分类</p>
            <p>您的图像信息将显示在下方，请确认是否正确。</p>
            <p>选择数据集后，点击开始分类即可开始！</p>
            <p>&nbsp;</p>
            <p>
                图像名称：
            </p>
            <p>
                <asp:Label ID="lblImgName" runat="server" Text="（未知）" BorderColor="#CCCCFF" BorderStyle="Solid"></asp:Label>
            </p>
            <p>
                图像大小：
            </p>
            <p>
                <asp:Label ID="lblImgSize" runat="server" Text="（未知）" BorderColor="#CCCCFF" BorderStyle="Solid"></asp:Label>
            </p>
            <p>
                请选择图像所属数据集：
            </p>
            <p>
                <asp:Label ID="lblDataSet" runat="server" Text="（未知数据集）" BorderColor="#CCCCFF" BorderStyle="Solid"></asp:Label>
            </p>
            <p>
                <asp:CheckBox ID="CheckBox_Dataset1" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset1_CheckedChanged" Text="Indian Pines" />
                <asp:CheckBox ID="CheckBox_Dataset2" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset2_CheckedChanged" Text="Salinas" />
                <asp:CheckBox ID="CheckBox_Dataset3" runat="server" AutoPostBack="True" OnCheckedChanged="CheckBox_Dataset3_CheckedChanged" Text="Pavia University" />
            </p>
            <p>
                <asp:Button ID="BtnStart" runat="server" Text="开始分类" Width="300px" BorderColor="White" Enabled="False" OnClick="BtnStart_Click" />
            </p>
            <p>
                <asp:Label ID="lblLoadingHyperVC" runat="server" BorderColor="#CCCCFF" BorderStyle="Double" BorderWidth="2px" Font-Bold="True" Text="单击上方按钮开始分类"></asp:Label>
                <asp:Label ID="lblRecordTime" runat="server" BorderColor="#CCCCFF" BorderStyle="Double" BorderWidth="2px" Font-Bold="True" Text="当前用时：" Visible="False"></asp:Label>
                <asp:Label ID="lblUsedTime" runat="server" BorderColor="#CCCCFF" BorderStyle="Double" BorderWidth="2px" Font-Bold="True" Visible="False"></asp:Label>
                <asp:Timer ID="timer_check" runat="server" Enabled="False" Interval="1000" OnTick="timer_check_Tick">
                </asp:Timer>
            </p>
            <p>
                <asp:Label ID="lblCheckResult" runat="server" Font-Bold="True"></asp:Label>
            </p>


        </div>

    </div>

</asp:Content>
