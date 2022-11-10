<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Campus Event.aspx.cs" Inherits="COMP3851B.campusEvent" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
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
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br /><br /><br />
    <div style="text-align:center; margin-top : 20px "><strong>Campus Event</strong></div>

    <asp:ListView ID="LVEvent" runat="server">
        <LayoutTemplate>
            <table>
                <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
    
            </table>
        </LayoutTemplate>

        <ItemTemplate>
            <td class="column" >
    <img src="../../../<%#Eval("eventImage")%>" alt="" style="width:300px;height :300px" /></a>

      <figcaption style="text-align :center"><%#Eval("eventName") %></figcaption>
  </td>
            
        </ItemTemplate>

    </asp:ListView>

</asp:Content>
