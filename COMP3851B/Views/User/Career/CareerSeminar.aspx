<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="CareerSeminar.aspx.cs" Inherits="COMP3851B.Views.User.CareerNew.CareerSeminar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .button {
  background-color: #84B4FD;
  border: none;
  color: white;
  padding: 5px 32px;
  text-align: center;
  text-decoration: none;
  /*display: inline-block;*/
  font-size: 12px;
  height:30px;
    }

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
            <img src="../../../Images/careersembanner.png" alt="semBanner" style="width:100%;height:auto">
            <h3 class="first-txt" style="font-size:50px;font-weight:bold;color:white">CAREER SEMINARS</h3>
            <h3 class="second-txt"  style="font-size:25px;font-weight:bold;color:white">Here are the upcoming career seminars organized by the school.</h3>
        </div>
        <table class="w-100">
            <tr>
                <td class="auto-style1">
                    <asp:Image ID="Image1" runat="server" Height="200px" Width="350px" />
                </td>
                <td class="auto-style2">
                    <asp:Label ID="Label1" runat="server" Font-Bold="True" Font-Size="Larger" Text="seminarName"></asp:Label>
                    <br />
                    <asp:Label ID="Label2" runat="server" Font-Bold="True" Font-Size="Large" Text="seminarDate"></asp:Label>
                    <br />
                    <asp:Label ID="Label3" runat="server" Text="seminarDesc"></asp:Label>
                </td>
                <td><strong>Location:</strong>
                    <asp:Label ID="Label4" runat="server" Text="seminarLoc"></asp:Label>
                    <br />
                    <strong>Time:
                    <asp:Label ID="Label5" runat="server" Font-Bold="False" Text="seminarStarttime"></asp:Label>
&nbsp;-
                    <asp:Label ID="Label6" runat="server" Font-Bold="False" Text="seminarEndtime"></asp:Label>
                    <br />
                    Open To:
                    <asp:Label ID="Label7" runat="server" Font-Bold="False" Text="seminarOpenTo"></asp:Label>
                    </strong></td>
            </tr>
        </table>
    </div>
</asp:Content>
