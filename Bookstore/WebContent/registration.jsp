<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Page</title>
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
			padding: 2.5px;
		}
		h2, #userOptions{
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
		label, input{
			display: block;
		}
		input{
			margin-top: 2px;
			width: 100%;
			height: 25px;
			padding-left: 7.5px;
			margin-bottom: 12.5px;
		}
		form{
			margin-left: 10%;
			margin-right: 10%;
		}
		.required:after {
   			content:" *";
    		color: red;
  		}
		
	</style>
</head>
<body>
	
	<h1>WASHINGTON T. BOOKSTORE</h1>
	<div class="navbar">
		<a href = "homepage.html">HOME</a>
		<a href = "login.html">LOGIN</a>
		<a class ="active" href = "registration.html">REGISTER</a>
		<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
	</div>
	<main>
		<div id = "accountInfoForm">
			<h2>Create an Account </h2>
			<form action="<%= request.getContextPath() %>/register" method="post">
				<label class="required">First Name</label>
				<input type="text" name="firstName" placeholder="Enter First Name" required>
				
				<label class="required">Last Name</label>
				<input type="text" name="lastName" placeholder="Enter Last Name" required>
				
				<label class="required">Email</label>
				<input type="text" name="emailAddress" placeholder="Enter Email" required>
				
				<label class="required">Username</label>
				<input type="text" name="username" placeholder="Enter Username" required>
				
				<label class="required">Password</label>
				<input type="password" name="password" placeholder="Enter Password" required>
				
				<details>
					<summary>Requirements</summary>
					<p>Password must be at least 8 characters long and include at least one uppercase
					letter, lower case letter and number.</p>
				</details>
				
				<br>
				<label class="required">Confirm Password</label>
				<input type="password" placeholder="Re-enter Password" required>
				
				<input type="submit" value="Create Account"/>
			</form>
		</div>

		<br>
		<div id="userOptions">
			<!-- <a href = "confirmation.html"><button>Create Account</button></a> -->
			<p><a style="color:black" href="homepage.html">Cancel</a></p>
		</div>
	<main>

</body>
</html>