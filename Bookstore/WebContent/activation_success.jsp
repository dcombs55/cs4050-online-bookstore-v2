<%@ page language="java" contentType="text/html; charset=ISO-8859-1" 
pageEncoding="ISO-8859-1"%>
<%@page import="database.*"%>
<!DOCTYPE html>
<html>
<head>
	<title>Account Successfully Activated</title>
	<style>
		body{
			background-color: #FFFFFF;
			font-family: Arial, Verdana, Helvetica;
		}
		.navbar{
			background-color: #FF9505;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 50%);
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
			background-color: #FFC370;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 50%);
			color: black;
		}
		h1{
			color: #FFA21F;
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
		#activationDialog{
			text-align: center;
		}
		input[type="submit"]{
			background-color: #000000;
			border: none;
			color: white;
			padding: 16px 32px;
			text-decoration: none;
			margin-left: 6.5px;
			margin-top: 20px;
			margin-bottom: 20px;
			cursor: pointer;
		}
		form{
			margin-left: 38%;
			text-align:center;
		}
		input{
			display: block;
		}
		.errors{
  			color:red;
  			margin-bottom: 8px;
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
			<div id="activateForm">
				<a href = "homepage.html"><button type = "button">Go Shopping!/button></a>
				<a href = "edit_profile.jsp"><button type = "button">Edit Profile!</button></a>
				</form>
			</div>
			
		</div>
	</main>

</body>
</html>