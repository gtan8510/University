<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditHomepageCourse.aspx.cs" Inherits="COMP3851B.Views.Admin.AdminEditHomepage.EditHomepageCourse" %>
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
        <h2>Homepage Course Dtaa</h2>
        <hr />

        <!--CategoryID -->
        <div class="form-group">
            <asp:Label ID="lblID" runat="server" CssClass="col-12 control-label" Text="Category ID: (No row selected)"></asp:Label>
        </div>
        <br />
        <div class="form-group">
            <asp:Label ID="lblCourseName" runat="server"  CssClass="col-md-2 control-label" Text="Course Name"></asp:Label>
       <div class="col-md-3"> 
           <asp:TextBox ID="txtCourseName" runat="server" CssClass="form-control"></asp:TextBox>
        </div>
            <asp:RequiredFieldValidator ID="courseNameValidator" runat="server" ErrorMessage="Course Name is needed" ControlToValidate="txtCourseName" ForeColor="Red"></asp:RequiredFieldValidator>
            </div>
      
            <br /><br />

            <div class="form-group">
            <asp:Label ID="lblCourseDesc" runat="server"  CssClass="col-md-2 control-label" Text="Course Desc"></asp:Label>
       <div class="col-md-3">
           <asp:TextBox ID="txtCourseDesc" runat="server" CssClass="form-control"></asp:TextBox>
       </div>
                <asp:RequiredFieldValidator ID="courseDescValidator" runat="server" ErrorMessage="Course Description is needed" ControlToValidate="txtCourseDesc" ForeColor="Red"></asp:RequiredFieldValidator>
                </div>
      
            <br /><br />

        <div class="form-group">
            <asp:Label ID="lblCourseImage" runat="server"  CssClass="col-md-2 control-label" Text="Course Image"></asp:Label>
       <div class="col-12">
           <asp:Image ID="ImgThumbnail" ImageUrl="~/Images/insert image.png" runat="server" class="avatar img-thumbnail height=150" Width="150"/>
       </div>
            <br />
            <div class="col-12">
                <asp:FileUpload ID="uploadThumbnail" runat="server" onchange ="img();" />
            </div>
            <br />
            <asp:RequiredFieldValidator ID="courseImageValidator" runat="server" ErrorMessage="Course Image is needed" ControlToValidate="uploadThumbnail" ForeColor="Red"></asp:RequiredFieldValidator>
        </div>
            <br /><br />

       <!--Add & Search / Edit& Cancel buttons -->
            <div id="crud">
                <asp:Button ID="btnAdd" runat="server" Text="Add" CssClass="btn btn-success" OnClick="btnAdd_Click" />
                <asp:Button ID="btnSearch" runat="server" Text="Search" Class="btn btn-secondary" style="color:white" OnClick="btnSearch_Click"/>
            </div>

            <br />
            <hr />

            <!--Notice Label -->
            <div>
                <asp:Label ID="lblNotice" runat="server"  CssClass="col-12 control-label" ForeColor="Red"></asp:Label>
            </div>
            
            <br />

            <!-- GridView -->
            <div class="col-12">
           <asp:GridView ID="GvCourse" runat="server" AutoGenerateColumns="False" DataKeyNames="courseID" DataSourceID="SqlDataSource1" Width="539px" CellPadding="4" ForeColor="#333333" GridLines="None">
               <AlternatingRowStyle BackColor="White" ForeColor="#284775" />
               <Columns>
                   <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                   <asp:BoundField DataField="courseID" HeaderText="courseID" InsertVisible="False" ReadOnly="True" SortExpression="courseID" />
                   <asp:BoundField DataField="courseName" HeaderText="courseName" SortExpression="courseName" />
                   <asp:DynamicField DataField="courseDesc" HeaderText="courseDesc" />
                   <asp:DynamicField DataField="coursePict" HeaderText="coursePict" />
               </Columns>
                <EditRowStyle BackColor="#999999" />
               <FooterStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <HeaderStyle BackColor="#5D7B9D" Font-Bold="True" ForeColor="White" />
               <PagerStyle BackColor="#284775" ForeColor="White" HorizontalAlign="Center" />
               <RowStyle BackColor="#F7F6F3" ForeColor="#333333" />
               <SelectedRowStyle BackColor="#E2DED6" Font-Bold="True" ForeColor="#333333" />
               <SortedAscendingCellStyle BackColor="#E9E7E2" />
               <SortedAscendingHeaderStyle BackColor="#506C8C" />
               <SortedDescendingCellStyle BackColor="#FFFDF8" />
               <SortedDescendingHeaderStyle BackColor="#6F8DAE" />
                </asp:GridView>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:FunUniversityConnectionString %>" DeleteCommand="DELETE FROM [course] WHERE [courseID] = @courseID" InsertCommand="INSERT INTO [course] ([courseName], [courseDesc], [coursePict]) VALUES (@courseName, @courseDesc, @coursePict)" SelectCommand="SELECT [courseID], [courseName], [courseDesc], [coursePict] FROM [course]" UpdateCommand="UPDATE [course] SET [courseName] = @courseName, [courseDesc] = @courseDesc, [coursePict] = @coursePict WHERE [courseID] = @courseID">
                    <DeleteParameters>
                        <asp:Parameter Name="courseID" Type="Int32" />
                    </DeleteParameters>
                    <InsertParameters>
                        <asp:Parameter Name="courseName" Type="String" />
                        <asp:Parameter Name="courseDesc" Type="String" />
                        <asp:Parameter Name="coursePict" Type="Object" />
                    </InsertParameters>
                    <UpdateParameters>
                        <asp:Parameter Name="courseName" Type="String" />
                        <asp:Parameter Name="courseDesc" Type="String" />
                        <asp:Parameter Name="coursePict" Type="Object" />
                        <asp:Parameter Name="courseID" Type="Int32" />
                    </UpdateParameters>
                </asp:SqlDataSource>
            </div>
               
</div>
    </div> 

   


</asp:Content>
