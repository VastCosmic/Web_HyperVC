<%@ Page Title="About" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="About.aspx.cs" Inherits="Web_HyperVC.About" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>HyperVC 高光谱图像分类</h3>
    <p>此Web应用用于对高光谱图像进行分类，并输出结果。</p>
<p>在您上传高光谱图像后，后端将采用深度学习模型对您的图像进行分类，并返回分类结果。</p>
<p>（此项目由OUCSE_18Group_HyperVC项目组_VastCosmic制作）</p>
</asp:Content>
