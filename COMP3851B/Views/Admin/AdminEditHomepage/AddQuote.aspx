<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddQuote.aspx.cs" Inherits="COMP3851B.Views.Admin.AdminEditHomepage.AddQuote" %>
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
                <asp:TextBox ID="txtSearch" runat="server" placeholder="Search here"></asp:TextBox>
             
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
    <br />
    <br />
<div class="container"  style="margin-left: 280px">

    <div class="form-horizontal">
        <h2>Edit Homepage Campus</h2>
        <hr />

        <div class="form-group">
            <asp:Label ID="lblQuote" runat="server"  CssClass="col-md-2 control-label" Text=" Quote"></asp:Label>
       <div class="col-md-3"> 
           <asp:TextBox ID="txtQuote" runat="server" CssClass="form-control" TextMode="MultiLine"></asp:TextBox>
        </div>
            </div>
        
      
          <br /><br />

           <div class="form-group">
            <asp:Label ID="lblQuotePerson" runat="server"  CssClass="col-md-2 control-label" Text=" Quote Person"></asp:Label>
       <div class="col-md-3"> 
           <asp:TextBox ID="txtQuotePerson" runat="server" CssClass="form-control" ></asp:TextBox>
        </div>
            </div>
        </div>
      
          <br /><br />

        
       

              <!--Add & Search / Edit& Cancel buttons -->
            <div id="crud">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" Class="btn btn-secondary" style="color:white" OnClick="btnSearch_Click" /> 
                <asp:TextBox ID="TextBox1" CssClass="search-wrapper" runat="server" placeholder="Search here"></asp:TextBox>
            </div>


            <br />
            <hr />

            <!--Notice Label -->
            <div>
                <asp:Label ID="lblNotice" runat="server"  CssClass="col-12 control-label" ForeColor="Red"></asp:Label>
            </div>
            
            <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="3" DataKeyNames="quoteID" DataSourceID="QuoteDataSource" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" Width="586px">
            <Columns>
                <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                <asp:BoundField DataField="quoteID" HeaderText="quoteID" InsertVisible="False" ReadOnly="True" SortExpression="quoteID" />
                <asp:BoundField DataField="quote" HeaderText="quote" SortExpression="quote" />
                <asp:BoundField DataField="quotePerson" HeaderText="quotePerson" SortExpression="quotePerson" />
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#000066" />
            <HeaderStyle BackColor="#006699" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="White" ForeColor="#000066" HorizontalAlign="Left" />
            <RowStyle ForeColor="#000066" />
            <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F1F1F1" />
            <SortedAscendingHeaderStyle BackColor="#007DBB" />
            <SortedDescendingCellStyle BackColor="#CAC9C9" />
            <SortedDescendingHeaderStyle BackColor="#00547E" />
        </asp:GridView>

        <asp:SqlDataSource ID="QuoteDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:FunUniversityConnectionString %>" DeleteCommand="DELETE FROM [quotes] WHERE [quoteID] = @quoteID" InsertCommand="INSERT INTO [quotes] ([quote], [quotePerson]) VALUES (@quote, @quotePerson)" SelectCommand="SELECT * FROM [quotes]" UpdateCommand="UPDATE [quotes] SET [quote] = @quote, [quotePerson] = @quotePerson WHERE [quoteID] = @quoteID">
            <DeleteParameters>
                <asp:Parameter Name="quoteID" Type="Int32" />
            </DeleteParameters>
            <InsertParameters>
                <asp:Parameter Name="quote" Type="String" />
                <asp:Parameter Name="quotePerson" Type="String" />
            </InsertParameters>
            <UpdateParameters>
                <asp:Parameter Name="quote" Type="String" />
                <asp:Parameter Name="quotePerson" Type="String" />
                <asp:Parameter Name="quoteID" Type="Int32" />
            </UpdateParameters>
        </asp:SqlDataSource>

</div>
</asp:Content>
