<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Confirmation</title>
	<style>
		body{
			font-family: Arial, Verdana, Helvetica;
		}
		.navbar{
			background-color: #000000;
			background-image: linear-gradient(to top, rgba(255,255,255,0.5), rgba(255,255,255,0) 50%);
			color: #FFFFFF;
			margin: auto;
			margin-bottom: 50px;
			overflow: hidden;
		}
		.navbar a {
			float: left;
			display: block;
			text-align: center;
			padding: 15px 15px;
			text-decoration: none;
			color: white;
		}
		.navbar a.active {
			background-color: lightgrey;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 50%);
			color: black;
		}
		h1{
			margin-left: 5px;
		}
		a:hover{
			background-color: #DCDCDC;
		}
		main{
			width: 45%;
			margin: auto;
			background-color: #DCDCDC;
			padding: 2.5px 2.5px 8px 2.5px;
		}
		h2, #confirm{
			text-align: center;
		}
		button{
			background-color: #000000;
			color: #FFFFFF;
			padding: 15px 32px;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			cursor: pointer;
		}
		div{
			width: 100%;
		}
		#confirmationDialog{
			text-align: center;
		}
		label, input{
			display: block;
		}
		input{
			margin-top: 2px;
			width: 100%;
			height: 25px;
			padding-left: 7.5px;
		}
		
	</style>
</head>
<body>
	
	<h1>WASHINGTON T. BOOKSTORE</h1>
	<div class="navbar">
		<a href = "homepage.html">HOME</a>
		<a href = "login.html">LOGIN</a>
		<a class ="active" href = "registration.jsp">REGISTER</a>
		<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
	</div>
	<main>
		<div id = "confirmationDialog">
			<h1>User successfully registered!</h1>
			<h2>Thank you for creating an account with Washington T. Bookstore!</h2>
			<p>To finish setting up your account, you just need to confirm the email that was sent to you.</p>
		</div>

		<br>
		<div id="confirm">
			<button>Confirm Email</button>
		</div>
	<main>

</body>
</html>