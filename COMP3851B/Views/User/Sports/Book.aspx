<%@ Page Title="" Language="C#" MasterPageFile="~/Views/User/User.Master" AutoEventWireup="true" CodeBehind="Book.aspx.cs" Inherits="COMP3851B.Views.User.Sports.Book" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder2" runat="server"></asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="head" runat="server">
    <link href="css/style.css" rel="stylesheet" />
	<div class="heading" style="background:url(images/TENNIS.JPG) no-repeat">
		<h1>Join now!</h1>
	</div>
	<!-- booking section starts  -->
	<style>
		.booking .booking-form {
		padding:2rem;
		background: var(--light-bg);
		}
		.booking .flex{
		display: flex;
		flex-wrap: wrap;
		gap:2rem;
		}
		.booking .flex .inputBox{
		flex:1 1 41rem;
		}
		.booking .flex .inputBox input{
		width: 100%;
		padding:1.2rem 1.4rem;
		font-size: 1.6rem;
		color:var(--light-black);
		text-transform: none;
		margin-top: 1.5rem;
		border:var(--border);
		}
		.booking .flex .inputBox input:focus{
		background: var(--black);
		color:var(--white);
		}
		.booking .flex .inputBox input:focus::placeholder{
		color:var(--light-white);
		}
		.booking .flex .inputBox span{
		font-size: 1.5rem;
		color:var(--light-black);
		}
		.booking .btn{
		margin-top: 2rem;
		}
	</style>
	<section class="booking">
		<h1 class="heading-title">join our club now!</h1>
		<form action="book_form.PHP" method="post" class="book-form" runat="server">
			<div class="booking-form" >
				<div class="flex">
					<div class="inputBox form-group">
						<span>Name :</span>
						<%--<input type="text" placeholder="enter your name" name="name">--%>
						<asp:TextBox ID="NameTextBox" class="form-control" placeholder="Enter your Name"  runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ControlToValidate="NameTextBox" ID="RequiredFieldValidator1" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Name is Required"></asp:RequiredFieldValidator>
					</div>
					<div class="inputBox form-group">
						<span>Email :</span>
						<%--<input type="email" placeholder="enter your email" name="email">--%>
						<asp:TextBox ID="EmailTextBox" class="form-control" placeholder="Enter your Email" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ControlToValidate="EmailTextBox" ID="RequiredFieldValidator2" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Email is Required"></asp:RequiredFieldValidator>
						<asp:RegularExpressionValidator ControlToValidate="EmailTextBox" ID="RegularExpressionValidator1" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Invalid Email" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"  ></asp:RegularExpressionValidator>
					</div>
					<div class="inputBox form-group">
						<span>Phone :</span>
						<%--<input type="number" placeholder="enter your number" name="phone">--%>
						<asp:TextBox ID="PhoneTextBox" class="form-control" placeholder="Enter your Phone" runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ControlToValidate="PhoneTextBox" ID="RequiredFieldValidator3" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Phone is Required"></asp:RequiredFieldValidator>
					</div>
					<div class="inputBox form-group">
						<span>Address :</span>
						<%--<input type="text" placeholder="enter your address" name="address">--%>
						<asp:TextBox ID="AddressTextBox" class="form-control" placeholder="Enter your Address"  runat="server"></asp:TextBox>
						<asp:RequiredFieldValidator ControlToValidate="AddressTextBox" ID="RequiredFieldValidator4" runat="server" ForeColor="Red" SetFocusOnError="true" Display="Dynamic" ErrorMessage="Address is Required"></asp:RequiredFieldValidator>
					</div>
				</div>
				<%--  <asp:Button ID="SubmitButton" class="btn btn-info" runat="server" Text="Submit" OnClick="SubmitButton_Click" />--%>
			</div>
			<%-- <input type="submit" value="submit" class="btn" name="send">--%>
		</form>
	</section>
</asp:Content>