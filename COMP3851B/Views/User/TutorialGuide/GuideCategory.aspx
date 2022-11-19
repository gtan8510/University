<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="GuideCategory.aspx.cs" Inherits="COMP3851B.Views.User.TutorialGuide.GuideCategory" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <meta name="viewport" content="width-device-width, initial scale=1.0" />
    <link rel="stylesheet" href="../../../CSS/style.css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
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
        .content{
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
            background-color: lightgrey;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-top:100px;">
        <h3 id="lblHeader" runat="server"></h3>

        <br />

        <div class="container">
            <div class="input-group mb-3">
                <asp:TextBox ID="txtSearch" class="form-control col-8" type="search" placeholder="Search" aria-label="Search" runat="server"></asp:TextBox>
              <div class="input-group-append">
                <asp:Button ID="btnSearch" class="btn btn-outline-success col-4" runat="server" Text="Search" style="z-index:-1;"/>
              </div>
            </div>      
        </div>

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
