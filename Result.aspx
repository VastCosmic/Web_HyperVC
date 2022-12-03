<%@ Page Title="Result" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Result.aspx.cs" Inherits="Web_HyperVC.WebForm1" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
        <p>&nbsp;</p>
        <p>
            <asp:Label ID="lblTitle" runat="server" Font-Size="X-Large" Text="这是您的分类结果，请查看！"></asp:Label>
        </p>
        <p>
            <asp:Image ID="ImageOut" runat="server" Height="500px" Width="500px" ImageUrl="https://hypervc-1313154504.cos.ap-shanghai.myqcloud.com/output.png" BorderColor="#CCCCFF" BorderStyle="Double" BorderWidth="2px" />
        </p>
        
</asp:Content>
