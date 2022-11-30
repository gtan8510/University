<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="GuideDetails.aspx.cs" Inherits="COMP3851B.Views.User.TutorialGuide.GuideDetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
    img {
        background-position: center;
        background-size: cover;
        min-height: 75%;
        outline: 1px solid black;
        max-height: 400px;
        border-radius: 5px;
        width:100%;
        max-width:1000px;
    }
    .search{
        max-width:900px;
        padding: 20px 20px 20px 20px;
        border:1px solid white;
        background-color:white;
        border-radius:10px;
        background: #fff;
        box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
        transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
    }
    body{
        font-family:Roboto, sans-serif
    }
    .jumbotron{
        //background-color:#bce0ff;
        background-image: url(../../../uploads/zoom.jpg);
        background-size: cover;
        min-height:380px;
        position:relative;
        z-index:-99;
    }
    </style>
    <style data-emotion="css"></style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <!--Jumbotron Image-->
    <div runat="server" ID="jumbo" class="jumbotron">
        <div class="container header">
        </div>
    </div>

    <!--Content-->
    <div class="container d-flex justify-content-center" style="margin-top:-250px;">
        <div class="search">

            <!--Header Title-->
            <div class="header" style="text-align:center;">
                <asp:Label ID="lblTitle" runat="server" Class="h2" Text=""></asp:Label>
                <hr/>
            </div> 

            <!--Guide Content-->
            <asp:Label id="lblDesc" runat="server" Text=""></asp:Label>

        </div>
    </div>  

</asp:Content>
