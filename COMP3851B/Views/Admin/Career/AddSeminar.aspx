<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Admin/Admin.Master" AutoEventWireup="true" CodeBehind="AddSeminar.aspx.cs" Inherits="COMP3851B.Views.Admin.Career.AddSeminar" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
    <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div style="margin-left: 212px">
        <div style="font-size:x-large" align="center">Add Seminar</div>
        <table class="w-100">
            <!--<tr>
                <td style="width: 73px; height: 18px;"></td>
                <td style="height: 18px; width: 172px">Seminar ID</td>
                <td style="height: 18px">
                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                </td>
            </tr>-->
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Image</td>
                <td>
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="300px" />
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Date<br />(YYYY-MM-DD)</td>
                <td>
                    <asp:TextBox ID="TextBox8" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Name</td>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Desc</td>
                <td>
                    <asp:TextBox ID="TextBox3" runat="server" Width="600px" Height="102px" TextMode="MultiLine"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Location</td>
                <td>
                    <asp:TextBox ID="TextBox4" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Start Time</td>
                <td>
                    <asp:TextBox ID="TextBox5" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px; height: 18px;"></td>
                <td style="width: 172px; height: 18px">Seminar End Time</td>
                <td style="height: 18px">
                    <asp:TextBox ID="TextBox6" runat="server" Width="600px"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td style="width: 73px">&nbsp;</td>
                <td style="width: 172px">Seminar Open To:</td>
                <td>
                    <asp:TextBox ID="TextBox7" runat="server" Width="600px"></asp:TextBox>
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
                    <asp:Button ID="btnAdd" runat="server" Font-Bold="True" OnClick="Button1_Click" Text="Insert" Width="120px" class="btn btn-success btn-rounded" />
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
                    <asp:GridView ID="GridView1" runat="server" Width="890px" AutoGenerateColumns="False" BackColor="#CCCCCC" BorderColor="#999999" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" CssClass="offset-sm-0" DataKeyNames="seminarID" ForeColor="Black">
                        <Columns>
                            <asp:BoundField DataField="seminarID" HeaderText="seminarID" InsertVisible="False" ReadOnly="True" SortExpression="seminarID" />
                            <asp:BoundField DataField="seminarImage" HeaderText="seminarImage" SortExpression="seminarImage" />
                            <asp:BoundField DataField="seminarDate" HeaderText="seminarDate" SortExpression="seminarDate" />
                            <asp:BoundField DataField="seminarName" HeaderText="seminarName" SortExpression="seminarName" />
                            <asp:BoundField DataField="seminarDesc" HeaderText="seminarDesc" SortExpression="seminarDesc" />
                            <asp:BoundField DataField="seminarLoc" HeaderText="seminarLoc" SortExpression="seminarLoc" />
                            <asp:BoundField DataField="seminarStartTime" HeaderText="seminarStartTime" SortExpression="seminarStartTime" />
                            <asp:BoundField DataField="seminarEndTime" HeaderText="seminarEndTime" SortExpression="seminarEndTime" />
                            <asp:BoundField DataField="seminarOpenTo" HeaderText="seminarOpenTo" SortExpression="seminarOpenTo" />
                        </Columns>
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
                    <asp:SqlDataSource ID="seminarDS" runat="server" ConnectionString="<%$ ConnectionStrings:My3851BConnectionString %>" SelectCommand="SELECT * FROM [seminar]"></asp:SqlDataSource>
                </td>
            </tr>
        </table>
        <br />
    </div>
</asp:Content>
