<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="GuideDetails.aspx.cs" Inherits="COMP3851B.Views.User.TutorialGuide.GuideDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container" style="margin-top:100px">
        <div style="text-align:center;">
            <asp:Label ID="lblTitle" runat="server" Text=""></asp:Label>
        </div>
        <hr />
        <asp:Label id="lbltest" runat="server" Text=""></asp:Label>
    </div>
</asp:Content>
