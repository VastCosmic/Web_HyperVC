<%@ Page Title="Result" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Web_HyperVC.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <center style="height: 1366px">
        <div class="jumbotron" style="background: #66FFFF url('Resouce/buwu.jpg') fixed center; width: 130%; background-repeat: no-repeat;">
            <div class="container" style="border: 3px solid #00FFFF; background-color: rgba(255, 255, 255,0.3); border-radius: 15px; width: 130%;">

                <h1>Result</h1>
                <p>
                    <asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" Text="这是您的分类结果，请查看！"></asp:Label>
                </p>
                <p>
                    <asp:Image ID="ImageOut" runat="server" Height="500px" Width="500px" ImageUrl="https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/Indian_Output.png" BorderColor="#CCCCFF" BorderStyle="Double" BorderWidth="2px" />

                </p>
                <p>
                    <asp:Button ID="ImageLoad" runat="server" Text="下载原图" BackColor="#CCFFFF" BorderStyle="None" Enabled="False" Height="30px" OnClick="ImageLoad_Click" Width="150px" />
                </p>
            </div>
        </div>
    </center>
</asp:Content>
