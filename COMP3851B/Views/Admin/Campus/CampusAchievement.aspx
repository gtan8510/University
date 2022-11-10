<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CampusAchievement.aspx.cs" Inherits="COMP3851B.Views.Admin.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="main-content" aria-busy="False">
            
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
                <img src="../../../Images/UONEditedLogo.png" style=" width :30px ; height: 30px" alt="" />
                <div>
                    <h4>School Admin</h4>
                    <small>Admin</small>
                </div>
            </div>

        </header>
       <br />
           <h1>
               Campus achievement
           </h1>
        <hr style ="border-top : 2px solid black; margin-right : 40px"/>

        <!-- Achievement Name -->
       <asp:Label ID="lblAchievementName" runat="server" Text="Achievement Name"></asp:Label><br />
       <asp:TextBox ID="txtAchievementName" runat="server" style="margin-left : 10px;width: 70%" required ="required"></asp:TextBox><br /><br />

       <!-- Achievement Image -->
       <asp:Label ID="lblAchievementImage" runat="server" Text="Achievement Image"></asp:Label><br />
       <asp:FileUpload ID="fuAchievementImage" runat="server"></asp:FileUpload><br /><br />

       

        <asp:Button ID="btnAdd" runat="server" Font-Bold="True" Text="Insert" Width="120px" class="btn btn-success btn-rounded" OnClick="btnAdd_Click1" />
        <br />

        <br />

       <asp:GridView ID="gridView" runat="server" Width="890px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="offset-sm-0" DataKeyNames="achievementID" ForeColor="Black">
           <columns>
               <asp:BoundField DataField="achievementID" HeaderText="Achievement ID" InsertVisible="False" ReadOnly="True" SortExpression="achievementID" />
               <asp:BoundField DataField="achievementName" HeaderText="Achievement Name" SortExpression="achievementName" />
               <asp:BoundField DataField="achievementImage" HeaderText="Achievement Image" SortExpression="achievementImage" />
           </columns>
           <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
       </asp:GridView>
        
    </div>   
       

</asp:Content>
