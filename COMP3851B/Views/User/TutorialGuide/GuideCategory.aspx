<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="GuideCategory.aspx.cs" Inherits="COMP3851B.Views.User.TutorialGuide.GuideCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <meta name="viewport" content="width-device-width, initial scale=1.0" />
    <link rel="stylesheet" href="../../../CSS/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <style>
        td{
            display:inline-block;
            width:max-content;
        }
        tr{
            width:max-content;
        }
        .ButtonDirect{
            color:black;
        }
        .ButtonDirect:hover{
            color:blue !important;
        }
        .card-image-top{
            height: 11vw;
            object-fit: contain;
        }
        .Image{
            width:100%;
            max-height:300px;
            vertical-align: middle;
            border-style: none;
            height: 250px;
            object-fit: cover;
        }
        .outer{
            border: none;
        }
        .content, .search{
            border-radius:10px;
            background: #fff;
            box-shadow: 0 6px 10px rgba(0,0,0,.08), 0 0 6px rgba(0,0,0,.05);
            transition: .3s transform cubic-bezier(.155,1.105,.295,1.12),.3s box-shadow,.3s -webkit-transform cubic-bezier(.155,1.105,.295,1.12);
            cursor: pointer;
        }

        .content:hover{
            transform: scale(1.05);
            box-shadow: 0 10px 20px rgba(0,0,0,.12), 0 4px 8px rgba(0,0,0,.06);
        }
        body, .outer{
            background-color: white;
        }
        .jumbotron{
            background:url(../../../Images/Support-header.jpg) no-repeat;
            background-size: 100% 100%;
            min-height:380px;
            position:relative;
            z-index:-99;
        }
        .form-control{
            -webkit-border-top-left-radius: 30px;
            -webkit-border-bottom-left-radius: 30px;
            -moz-border-radius-topleft: 30px;
            -moz-border-radius-bottomleft: 30px;
            border-top-left-radius: 30px;
            border-bottom-left-radius: 30px;
            -webkit-border-top-right-radius: 30px;
            -webkit-border-bottom-right-radius: 30px;
            -moz-border-radius-topright: 30px;
            -moz-border-radius-bottomright: 30px;
            border-top-right-radius: 30px;
            border-bottom-right-radius: 30px;
            
        }
        .btnSearch{
            margin-left:10px;
        }
        .search{
            margin-top: -45px;
            border:1px solid white;
            padding: 20px 20px 20px 20px;
            background-color:white;
        }
        .txtSearch, btnSearch{
            height:52px;
        }
        .fa fa-search{
            font-size:2em;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:50px;">
        <div class="jumbotron">
            <div class="container">
                <h3 id="H1" runat="server" style="color:white;">Seach Example</h3>
            </div>
        </div>

        <div class="container search">
            <div style="display:flex; flex-direction:row;">
                <asp:TextBox ID="TextBox2" class="form-control txtSearch" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
                <asp:LinkButton runat="server" ID="LinkButton2" CssClass="btnSearch"><i class="fa fa-search fa-3x" aria-hidden="true"></i></asp:LinkButton>
            </div>
        </div>
        <!--<h3 id="lblHeader" runat="server"></h3>

        <br />

        <div class="container">
            <div class="input-group mb-3">
                <asp:TextBox ID="txtSearch" class="form-control col-8" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
              <div class="input-group-append">
                <asp:Button ID="btnSearch" class="btn btn-outline-success col-4" runat="server" Text="Search" style="z-index:-1;"/>
              </div>
            </div>      
        </div>-->

        <div class="container">
            <div class="col-md-12 pt-1">
                <div class="card outer">
                    <div class="card-body">
                        <asp:ListView ID="ListView1" runat="server" GroupItemCount="4" GroupPlaceholderID="groupPlaceHolder1" ItemPlaceholderID="itemPlaceHolder1" OnItemCommand="ListView1_ItemCommand1" DataKeyNames="gdeID">
                            <EmptyDataTemplate>
                                <div class="container">
                                    <hr />
                                    <br />
                                    <h3>
                                        There is no information on this topic as of yet. 
                                    </h3>
                                    <h3>
                                        Write us a feedback on what you would like to see for this topic.
                                    </h3>
                                </div>
                            </EmptyDataTemplate>
                            <GroupTemplate>
                                <div class="row text-center">
                                    <asp:PlaceHolder runat="server" ID="itemPlaceHolder1"></asp:PlaceHolder>
                                </div>
                            </GroupTemplate>
                            <ItemTemplate>
                                <div class="col-lg-3 col-md-6 col-sm-6 d-flex align-items-stretch">
                                    <div class="card content">
                                        <div class="card-body">
                                            <asp:Image ID="Image1" class="card-img-top" ImageUrl='<%# Bind("gdeThumbnail", "{0}") %>' runat="server" CssClass="Image"/>
                                        </div>
                                        <div class="card-footer">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ButtonDirect" Text='<%# Bind("gdeTitle") %>' CommandName="ToGuide" CommandArgument='<%# Eval("gdeID") %>'></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </ItemTemplate>
                            <AlternatingItemTemplate>
                                <div class="col-lg-3 col-md-6 col-sm-6 d-flex align-items-stretch">
                                    <div class="card content">
                                        <div class="card-body">
                                            <asp:Image ID="Image1" class="card-img-top" ImageUrl='<%# Bind("gdeThumbnail", "{0}") %>' runat="server" CssClass="Image"/>
                                        </div>
                                        <div class="card-footer">
                                    <asp:LinkButton ID="LinkButton1" runat="server" CssClass="ButtonDirect" Text='<%# Bind("gdeTitle") %>' CommandName="ToGuide" CommandArgument='<%# Eval("gdeID") %>'></asp:LinkButton>
                                        </div>
                                    </div>
                                </div>
                            </AlternatingItemTemplate>
                        </asp:ListView>
                    </div>
                </div>
            </div>
        </div>
        <br /><br /><br /><br /><br /><br /><br /><br />
    </div>
</asp:Content>
