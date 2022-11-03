﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditHomepageFacility.aspx.cs" Inherits="COMP3851B.Views.Admin.AdminEditHomepage.EditHomepageFacility" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
   
      <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../../../CSS/AdminStyle.css" />
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Sofia" />
   <link rel="stylesheet" href="https://maxst.icons8.com/vue-static/landings/line-awesome/font-awesome-line-awesome/css/all.min.css" />
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-person" viewBox="0 0 16 16">
  <path d="M8 8a3 3 0 1 0 0-6 3 3 0 0 0 0 6zm2-3a2 2 0 1 1-4 0 2 2 0 0 1 4 0zm4 8c0 1-1 1-1 1H3s-1 0-1-1 1-4 6-4 6 3 6 4zm-1-.004c-.001-.246-.154-.986-.832-1.664C11.516 10.68 10.289 10 8 10c-2.29 0-3.516.68-4.168 1.332-.678.678-.83 1.418-.832 1.664h10z"/>
</svg>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>

    <style>
        #crud:not(:last-child){
            margin-right: 10px;
        }
    </style>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="main-content">
        <header>
            <h1>
                <asp:Label ID="Label2" runat="server" Text="Label">
                    <span class="fa-lastfm la-bars"></span>
                </asp:Label>
                Dashboard
           </h1>

            <div class="search-wrapper">
                <span class="las la-search"></span>
                <input type="search" placeholder="search here" />
            </div>
            <div class="user-wrapper">
                <img src="../../../Images/UONEditedLogo.png" width="30px" height="30px" alt="" />
                <div>
                    <h4>School Admin</h4>
                    <small>Admin</small>
                </div>
            </div>

        </header>
          </div>

    <br />
<div class="container"  style="margin-left: 280px">

    <div class="form-horizontal">
        <h2>Edit Homepage</h2>
        <hr />

        <div class="form-group">
            <asp:Label ID="lblFacilityName" runat="server"  CssClass="col-md-2 control-label" Text="Facility Name"></asp:Label>
       <div class="col-md-3"> 
           <asp:TextBox ID="txtFacilityName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
            </div>
      
            <br /><br />

            <div class="form-group">
            <asp:Label ID="lblFacilityDesc" runat="server"  CssClass="col-md-2 control-label" Text="Facility Desc"></asp:Label>
       <div class="col-md-3">
           <asp:TextBox ID="txtFacilityDesc" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
                </div>
      
            <br /><br />

        <div class="form-group">
            <asp:Label ID="lblFacilityImage" runat="server"  CssClass="col-md-2 control-label" Text="Facility Image"></asp:Label>
       <div class="col-md-3">
            <asp:FileUpload ID="FuFacilityImg" CssClass="form-control" runat="server" />
       </div>
        </div>
            <br /><br />
         <!--Add & Search / Edit& Cancel buttons -->
            <div id="crud">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" Class="btn btn-secondary" style="color:white" />
            </div>

            <br />
            <hr />

         <!--Notice Label -->
            <div>
                <asp:Label ID="lblNotice" runat="server"  CssClass="col-12 control-label" ForeColor="Red"></asp:Label>
            </div>
            
            <br />

           
        <div class="gridview">
            <asp:GridView ID="GridView1" runat="server"></asp:GridView>
        </div>
               
</div>
    </div>    
     


</asp:Content>
