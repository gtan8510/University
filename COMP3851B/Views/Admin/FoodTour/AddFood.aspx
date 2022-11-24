<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddFood.aspx.cs" Inherits="COMP3851B.Views.Admin.FoodTour.AddFood" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>
        .dataTable table td {
            padding: 10px;
        }
    </style>
    
    <!--<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">-->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <!--<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>-->
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <h1>
        <asp:Label ID="Label2" runat="server" Text="Label">
            <span class="fa-lastfm la-bars"></span>
        </asp:Label>
            Dashboard
    </h1>

    <div class="search-wrapper">
        <span class="las la-search"></span>
        <asp:TextBox ID="txtSearch" runat="server" placeholder="Search here"></asp:TextBox>
    </div>
    
    
    <div style="margin-left: 212px">
        <div style="font-size:x-large" align="center">Add Food</div>
        <table class="dataTable">
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Image</td>
                <td>
                    <asp:FileUpload ID="FileUpload2" runat="server" Width="300px" /><asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Food Image Required" ControlToValidate="FileUpload2" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Name</td>
                <td>
                    <asp:TextBox ID="TextBox9" runat="server" Width="600px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Food Name Required" ControlToValidate="TextBox9" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Desc</td>
                <td>
                    <asp:TextBox ID="TextBox10" runat="server" Width="600px" Height="102px" TextMode="MultiLine"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Food Description Required" ControlToValidate="TextBox10" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Location</td>
                <td>
                    <asp:TextBox ID="TextBox11" runat="server" Width="600px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Food Location Required" ControlToValidate="TextBox11" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Recommendation Level (1 to 10)</td>
                <td>
                    <asp:TextBox ID="TextBox12" runat="server" Width="600px">0</asp:TextBox><asp:RangeValidator ID="RangeValidator1" runat="server" ErrorMessage="Only a range of 1 to 10 is allowed." ControlToValidate="TextBox12" MinimumValue="1" MaximumValue="10" Type="Integer" Font-Bold="True" ForeColor="Red"></asp:RangeValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Food Price</td>
                <td>
                    <asp:TextBox ID="TextBox13" runat="server" Width="600px"></asp:TextBox><asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ErrorMessage="Food Price Required" ControlToValidate="TextBox13" Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
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
                    <asp:Button ID="btnAdd" runat="server" Font-Bold="True" OnClick="btnAdd_Click" Text="Insert" Width="120px" class="btn btn-success btn-rounded" />
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
                    <asp:GridView ID="GridView2" runat="server" Width="1200px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CssClass="offset-sm-0" DataKeyNames="foodID" ForeColor="Black" HorizontalAlign="Justify">
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
