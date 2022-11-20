<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="EditFood.aspx.cs" Inherits="COMP3851B.Views.Admin.FoodTour.EditFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dataTable table td {
            padding: 10px;
        }
    </style>
    
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 212px">
        <div style="font-size:x-large" align="center">Edit Food</div>
        <table class="dataTable">
            <tr>
                <td style="width: 73px; height: 18px;"></td>
                <td style="height: 18px; width: 172px">Food ID</td>
                <td style="height: 18px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                    <asp:Button ID="btnRetrieve" runat="server" Font-Bold="True" OnClick="Button5_Click" Text="Retrieve Details" Width="150px" class="btn btn-success btn-rounded" />
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Image</td>
                <td>
                    <asp:FileUpload ID="FileUpload2" runat="server" Width="300px" />
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Name</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Desc</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" Width="600px" Height="102px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Location</td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Recommendation Level (1 to 10)</td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Price</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">&nbsp;</td>
                <td>
                    <asp:Button ID="btnUpdate" runat="server" Font-Bold="True" OnClick="Button2_Click" Text="Update" Width="120px" class="btn btn-success btn-rounded" />
                    <asp:Button ID="btnDelete" runat="server" Font-Bold="True" OnClick="Button3_Click" Text="Delete" Width="120px" class="btn btn-danger btn-rounded" />
                    <asp:Button ID="btnCancel" runat="server" Font-Bold="True" Text="Cancel" Width="120px" class="btn btn-danger" CausesValidation="False" UseSubmitBehavior="False" />
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">&nbsp;</td>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">&nbsp;</td>
                <td>
                    <asp:GridView ID="GridView2" runat="server" Width="1200px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="offset-sm-0" DataKeyNames="foodID" ForeColor="Black" EnableSortingAndPagingCallbacks="True">
                        <Columns>
                            <asp:BoundField DataField="foodID" HeaderText="ID" SortExpression="foodID" />
                            <asp:BoundField DataField="foodImage" HeaderText="Image" SortExpression="foodImage" />
                            <asp:BoundField DataField="foodName" HeaderText="Name" SortExpression="foodName" />
                            <asp:BoundField DataField="foodDesc" HeaderText="Description" SortExpression="foodDesc" />
                            <asp:BoundField DataField="foodLoc" HeaderText="Location" SortExpression="foodLoc" />
                            <asp:BoundField DataField="foodRecLvl" HeaderText="RecommendLvl" SortExpression="foodRecLvl" />
                            <asp:BoundField DataField="foodPrice" HeaderText="Price" SortExpression="foodPrice" />
                        </Columns>
                        <FooterStyle BackColor="#CCCCCC" />
                        <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" HorizontalAlign="Center" />
                        <PagerStyle BackColor="#CCCCCC" ForeColor="Black" HorizontalAlign="Left" />
                        <RowStyle BackColor="White" HorizontalAlign="Center" />
                        <SelectedRowStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F1F1F1" />
                        <SortedAscendingHeaderStyle BackColor="#808080" />
                        <SortedDescendingCellStyle BackColor="#CAC9C9" />
                        <SortedDescendingHeaderStyle BackColor="#383838" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="localfoodDS" runat="server" ConnectionString="<%$ ConnectionStrings:My3851BConnectionString %>" SelectCommand="SELECT * FROM [localFood]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
