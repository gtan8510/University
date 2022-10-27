<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LocalFoodTour.aspx.cs" Inherits="COMP3851B.Views.User.Explore.LocalFoodTour" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .first-txt {
            position: absolute;
            top: 200px;
            left: 50px;
        }

        .second-txt {
            position: absolute;
            top: 300px;
            left: 50px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
    <!--Content Title-->
        <div class="row">
            <img src="../../../Images/foodtourbanner.png" alt="semBanner" style="width:100%;height:auto">
            <h3 class="first-txt" style="font-size:50px;font-weight:bold;color:white">FOOD FANATICS</h3>
            <h3 class="second-txt"  style="font-size:25px;font-weight:bold;color:white">Just arrived in Singapore and not sure what to eat?<br />Here are the TOP 15 foods that you should try out as recommended by some of your seniors.</h3>
        </div>
        <asp:Table ID="Table1" runat="server" Height="200px" Width="100%">  
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage1" style="align-content:center;width:80%;height:auto"></asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage2" style="align-content:center;width:80%;height:auto"></asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage3" style="align-content:center;width:80%;height:auto"></asp:TableCell>
            </asp:TableRow>    
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell>   
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell> 
            </asp:TableRow>
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell>   
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell> 
            </asp:TableRow>   
        </asp:Table>
        <asp:Table ID="Table2" runat="server" Height="200px" Width="100%">  
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage1" style="align-content:center;width:80%;height:auto"></asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage2" style="align-content:center;width:80%;height:auto"></asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><img src="../../../Images/insert%20image.png" alt="foodImage3" style="align-content:center;width:80%;height:auto"></asp:TableCell>
            </asp:TableRow>    
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell>   
                <asp:TableCell runat="server" Width="33%"><p style="font-size:20px;font-weight:bold;padding:0px;margin:0px">foodName</p><div style="font-size:16px;font-weight:bold;">foodLoc</div><b>Recommendation Level:</b> foodRecLvl</asp:TableCell> 
            </asp:TableRow>
            <asp:TableRow runat="server">  
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell>  
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell>   
                <asp:TableCell runat="server" Width="33%"><b>Price Range:</b> foodPrice<br />foodDesc</asp:TableCell> 
            </asp:TableRow>   
        </asp:Table>
    </div>
</asp:Content>
