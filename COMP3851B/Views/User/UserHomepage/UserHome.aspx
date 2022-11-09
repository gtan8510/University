<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="UserHome.aspx.cs" Inherits="COMP3851B.Views.User.UserHomepage.UserHome" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <meta name="viewport" content="width-device-width, initial scale=1.0" />
    <link rel="stylesheet" href="../../../CSS/style.css" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
   <section class="header">
    <div id="backgroundImage"></div>
    <div class ="text-box">
        <h1>Sydney's Most Trusted University</h1>
        <p>UON is one of the oldest and the most historic university in Australia that provide student the best course they can choose
            <br />Our aim is to make a student think critically and they can impact to the future of the world.
        </p>
        <a href="" class="imageBtn">Visit Us To Know More</a>
    </div>
    </section>
    <section class="course">
        <h1>Quotes</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        
        <asp:ListView ID="LVQuotes" runat="server" >
            <LayoutTemplate>
                <table>
                    <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
                </table>
            </LayoutTemplate>
            
            <ItemTemplate>
                <td class="course-col"> 
               <h3><%#Eval("quotePerson") %></h3>
                <p><%#Eval("quote") %></p>       
                </td>
            </ItemTemplate>
        </asp:ListView>
    </section>
    <section class="campus">
        <h1> Our Global Campus</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <asp:ListView ID="LVCampus" runat="server">
            <LayoutTemplate>
                <table>
                    <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
                </table>
            </LayoutTemplate>
            <ItemTemplate>
                <td class="campus-col">
                    <div>
                 <img src="../../../<%#Eval("campusImg") %>" alt="" class= "" height="250px" width="420px" /></a>
                    <div class="layer">
                    <h3><%#Eval("campusLoc") %></h3>

                    </div>
                   </td>
              
                </div>

            </ItemTemplate>
        </asp:ListView>
       

      
    </section>

    <section class="facilities">
        <h1> Our Facilities </h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>

        <asp:ListView ID="LVFacility" runat="server">
            <LayoutTemplate>
             <table>
                    <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
                </table>

            </LayoutTemplate>

             <ItemTemplate>
                <td class="facilities-col"> 
                <img src="../../../<%#Eval("FacilityPict") %>" alt="" class= "" height="200px" width="350px" /></a>
               <h3><%#Eval("facilityName") %></h3>
                <p><%#Eval("facilityDesc") %></p>       
                </td>
            </ItemTemplate>
        </asp:ListView>

    </section>

    <section class="testimonial">
        <h1>What Our Student Says</h1>
        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.</p>
        <asp:ListView ID="LVTestimonial" runat="server">
             <LayoutTemplate>
                <table>
                    <tr class="row">
                        
                        <asp:PlaceHolder ID="ItemPlaceholder" runat="server"></asp:PlaceHolder>
                    
                    </tr>
                </table>
            </LayoutTemplate>
             <ItemTemplate>
                <td class="testimonial-col">
                    
                    <img src="../../../Images/man.png" />
                   
                 
                   <div>
                    <p><%#Eval("studentFeedback") %></p>
                        <h3><%#Eval("studentName") %></h3>
                       </div>
                    
                   </td>
              
                

            </ItemTemplate>
        </asp:ListView>
    
    </section>

     <section class="contactUs">
        <h1>Enroll for our course in the future from anywhere around the world</h1>
        <a href="ContactUs.aspx" class="contactBtn">CONTACT US</a>
    </section>
</asp:Content>
