<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="CampusAchievement.aspx.cs" Inherits="COMP3851B.Views.User.Campus.campusAchievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <style>
    /* Three image containers (use 25% for four, and 50% for two, etc) */
.column {
  float: left;
  width: 20%;
  padding: 5px;
}
/* Clear floats after image containers */
.row::after {
  content: "";
  clear: both;
  display: table;
}
</style>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="display : flex ; align-items : center " >
        <div style ="flex-basis :40%; margin-left: 80px;">
        <!-- UON Building Image --> 
            <img src="../../../Images/UONBuilding.jpg" style="margin-top : 50px; margin-left: 20px; max-width : 100%"/>
        </div>
        <!-- text beside image -->
        <div>
        <p style ="padding-left :40px ; padding-right : 40px; text-align :justify; font-size : 20px"><br /><br />First compiled in 2004, the QS World University Rankings currently ranks 1,000 of the world's finest universities. <br /><br />In the 2021 QS World University Rankings our University climbed ten places from last year to now sit among the world’s Top 200 Universities. Our sector has faced a number of external challenges and the University of Newcastle itself has dealt with bushfires, droughts as well as a pandemic affecting our students, staff and communities in the past year.<br /><br />The move from 207 to 197 in twelve months reflects the University’s unwavering focus on delivering inspiring and innovative teaching and learning programs for our students and leading critical research breakthroughs.</p>
    
        </div>
    </div>

    <br />
    <div style="text-align:center; margin-top : 20px "><strong>Campus Achivement</strong></div>

<asp:ListView ID="LVAchievement" runat="server">
        <LayoutTemplate>
            <table>
                <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
    
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <td class="column" >
    <img src="../../../<%#Eval("achievementImage")%>" alt="" style="width:300px;height :300px" /></a>

      <figcaption style="text-align :center"><%#Eval("achievementName") %></figcaption>
  </td>
            
        </ItemTemplate>

    </asp:ListView>
</asp:Content>
