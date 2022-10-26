<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.Master" AutoEventWireup="true" CodeBehind="Sports.aspx.cs" Inherits="COMP3851B.Views.User.Sports.Sports" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>


<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
<!-- home section starts  -->

<section class="home">

   <div class="swiper home-slider">

      <div class="swiper-wrapper">

         <div class="swiper-slide slide" style="background:url(html/images/RONALDO.JPG) no-repeat">
            <div class="content">
               <span>Meditate, Grow, Healthy</span>
               <h3>BE THE CHANGE YOU WANT</h3>
               <a href="Package.aspx" class="btn">discover more</a>
            </div>
         </div>

         <div class="swiper-slide slide" style="background:url(html/images/STEPH.JPG) no-repeat">
            <div class="content">
               <span>Meditate, Grow, Healthy</span>
               <h3>DON'T GET COMFORTABLE</h3>
               <a href="Package.aspx" class="btn">discover more</a>
            </div>
         </div>

         <div class="swiper-slide slide" style="background:url(html/images/CANELLO.JPG) no-repeat">
            <div class="content">
               <span>Meditate, Grow, Healthy</span>
               <h3>HURT IS ONLY THE BEGINNING</h3>
               <a href="Package.aspx" class="btn">discover more</a>
            </div>
         </div>
         
      </div>

      <div class="swiper-button-next"></div>
      <div class="swiper-button-prev"></div>

   </div>

</section>

<!-- home section ends -->


<!-- home about section starts  -->

<section class="home-about">

   <div class="image">
      <img src="html/images/HUGS.JPG" alt="">
   </div>

   <div class="content">
      <h3>about us</h3>
      <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Expedita et, recusandae nobis fugit modi quibusdam ea assumenda, nulla quisquam repellat rem aliquid sequi maxime sapiente autem ipsum? Nobis, provident voluptate?</p>
      <a href="About.aspx" class="btn">read more</a>
   </div>

</section>

<!-- home about section ends -->

<!-- services section starts  -->

<section class="services">

   <h1 class="heading-title"> what we do </h1>

   <div class="box-container">

      <div class="box">
         <img src="html/images/icon-1.png" />
         <h3>adventure</h3>
      </div>

      <div class="box">
         <img src="html/images/icon-2.png" alt="">
         <h3>mini games</h3>
      </div>

      <div class="box">
         <img src="html/images/icon-3.png" alt="">
         <h3>trekking</h3>
      </div>

      <div class="box">
         <img src="html/images/icon-4.png" alt="">
         <h3>camping</h3>
      </div>

      <div class="box">
         <img src="html/images/icon-5.png" alt="">
         <h3>gym</h3>
      </div>

      <div class="box">
         <img src="html/images/icon-6.png" alt="">
         <h3>camping</h3>
      </div>

   </div>

</section>

<!-- services section ends -->

<!-- home offer section starts  -->

<section class="home-offer">
   <div class="content">
      <h3>up to 465 active members</h3>
      <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Iure tempora assumenda, debitis aliquid nesciunt maiores quas! Magni cumque quaerat saepe!</p>
      <a href="Book.aspx" class="btn">Send your queries</a>
   </div>
</section>

<!-- home offer section ends -->

<!-- home packages section starts  -->

<section class="home-packages">

   <h1 class="heading-title"> clubs we offer </h1>

   <div class="box-container">

      <div class="box">
         <div class="image">
            <img src="html/images/BASKETBALL2.JPG" alt="">
         </div>
         <div class="content">
            <h3>Basketball Club</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos, sint!</p>
            <a href="Book.aspx" class="btn">Join Now</a>
         </div>
      </div>

      <div class="box">
         <div class="image">
            <img src="html/images/ESPORTS.JPG" alt="">
         </div>
         <div class="content">
            <h3>E-sports Club</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos, sint!</p>
            <a href="Book.aspx" class="btn">Join Now</a>
         </div>
      </div>
      
      <div class="box">
         <div class="image">
            <img src="html/images/MESSI.JPG" alt="">
         </div>
         <div class="content">
            <h3>Soccer Club</h3>
            <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eos, sint!</p>
            <a href="Book.aspx" class="btn">Join Now</a>
         </div>
      </div>

   </div>

   <div class="load-more"> <a href="Package.aspx" class="btn">See More</a> </div>

</section>

<!-- home packages section ends -->
</asp:Content>
