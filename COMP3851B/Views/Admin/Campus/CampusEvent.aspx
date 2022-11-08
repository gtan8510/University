<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="CampusEvent.aspx.cs" Inherits="COMP3851B.Views.Admin.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
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
                <img src="../../../Images/UONEditedLogo.png" alt="" style="width :30px ; height : 30px"/>
                <div>
                    <h4>School Admin</h4>
                    <small>Admin</small>
                </div>
            </div>

        </header>

    <br />
        <h1>
               Campus Event
           </h1>
           <hr style ="border-top : 2px solid black; margin-right : 40px"/>

       <!-- Event Name -->
        <asp:Label ID="lblEventName" runat="server" Text="Event Name"></asp:Label><br />
        <asp:TextBox ID="txtEventName" runat="server" style="margin-left : 10px;width: 70%" required="required"></asp:TextBox><br />

        <!-- Event Image -->
        <asp:Label ID="lblEventImage" runat="server" Text="Event Image"></asp:Label><br />
       <asp:FileUpload ID="fuEventImage" runat="server"></asp:FileUpload><br /><br />
        <asp:Button ID="btnAdd" runat="server" Font-Bold="True" Text="Insert" Width="120px" class="btn btn-success btn-rounded" OnClick="btnAdd_Click1" />
        <br />

        <br />

       <asp:GridView ID="gridView" runat="server" Width="890px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="offset-sm-0" DataKeyNames="eventID" ForeColor="Black">
           <columns>
               <asp:BoundField DataField="eventID" HeaderText="Event ID" InsertVisible="False" ReadOnly="True" SortExpression="eventID" />
               <asp:BoundField DataField="eventName" HeaderText="Event Name" SortExpression="eventName" />
               <asp:BoundField DataField="eventImage" HeaderText="Event Image" SortExpression="eventImage" />
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
