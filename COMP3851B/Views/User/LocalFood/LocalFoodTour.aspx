<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="LocalFoodTour.aspx.cs" Inherits="COMP3851B.Views.User.Explore.FoodTour.LocalFoodTour" %>
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
            <img src="../../../../Images/foodtourbanner.png" alt="foodBanner" style="width:100%;height:auto">
            <h3 class="first-txt" style="font-size:50px;font-weight:bold;color:white;width:500px">FOOD FANATICS</h3>
            <h3 class="second-txt"  style="font-size:25px;font-weight:bold;color:white;width:1500px">Just arrived in Singapore and not sure what to eat?<br />Here are some of the most popular foods that you should find outside the campus as recommended by some of your seniors.</h3>
        </div>
        <hr />
        <asp:DataList ID="FoodSeminarList" DataSourceID="FoodTourDataSource" runat="server" RepeatColumns="3" RepeatDirection="Horizontal">
        <ItemTemplate>
                <!--<td runat="server" id="itemPlaceholder" />-->
                <td class="auto-style1" width="33%">
                    <asp:Image ID="Image1" runat="server" Height="200px" Width="350px" ImageUrl='<%# "~/images/" + Eval("foodImage") %>' />
                    <br /><br />
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("foodName")%>'></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("foodLoc")%>'></asp:Label>
                    <br /><br />
                    <asp:Label ID="Label3" runat="server" Text='<%# "<b>Recommendation Level (1 to 10):</b>" +" "+ Eval("foodRecLvl")%>'></asp:Label>
                    <br />
                    <asp:Label ID="Label4" runat="server" Text='<%# "<b>Price:</b>" +" "+ Eval("foodPrice")%>'></asp:Label>
                    <br />
                    <asp:Label ID="Label5" runat="server" Font-Bold="False" Text='<%# Eval("foodDesc")%>'></asp:Label>
                </td>
        </ItemTemplate>
        </asp:DataList>
    </div>

    <asp:SqlDataSource ID="FoodTourDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:My3851BConnectionString %>"
        SelectCommand="select * from localFood">
    </asp:SqlDataSource>
</asp:Content>