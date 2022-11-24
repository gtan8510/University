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
        <asp:ListView ID="FoodTourView" DataSourceID="FoodTourDataSource" GroupItemCount="3" runat="server">
            <LayoutTemplate>
            <table class="w-100">
                <tr runat="server" class="header">
                  <th runat="server" colspan="3"></th>
                </tr>
                <hr />
                <tr runat="server" id="groupPlaceholder" />
            </table>
            </LayoutTemplate>    
            <GroupTemplate>
                    <tr runat="server" id="FoodRow">
                        <td runat="server" id="itemPlaceholder" />
                    </tr>
            </GroupTemplate>
            <ItemTemplate>
                    <td runat="server" align="center" id="itemPlaceholder" class="center" width="33.3%">
                        <asp:Image ID="Image1" runat="server" Height="200px" Width="350px" ImageUrl='<%# "~/images/" + Eval("foodImage") %>' />
                        <br /><br />
                        <asp:Label ID="Label8" runat="server" Font-Bold="True" Font-Size="Larger" Text='<%# Eval("foodName")%>'></asp:Label>
                        <br />
                        <asp:Label ID="Label9" runat="server" Font-Bold="True" Font-Size="Large" Text='<%# Eval("foodLoc")%>'></asp:Label>
                        <br /><br />
                        <asp:Label ID="Label10" runat="server" Text='<%# "<b>Recommendation Level (1 to 10):</b>" +" "+ Eval("foodRecLvl")%>'></asp:Label>
                        <br />
                        <asp:Label ID="Label11" runat="server" Text='<%# "<b>Price:</b>" +" "+ Eval("foodPrice")%>'></asp:Label>
                        <br />
                        <asp:Label ID="Label12" runat="server" Font-Bold="False" Text='<%# Eval("foodDesc")%>'></asp:Label>
                    </td>
            </ItemTemplate>
        </asp:ListView>
    </div>

    <asp:SqlDataSource ID="FoodTourDataSource" runat="server" 
        ConnectionString="<%$ ConnectionStrings:My3851BConnectionString %>"
        SelectCommand="select * from localFood">
    </asp:SqlDataSource>
</asp:Content>