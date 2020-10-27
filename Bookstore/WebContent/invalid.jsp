<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%@page import="database.*"%>
   <!DOCTYPE html>
<html lang="en">
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
/* Style the header */
header {
	text-align: center;
	padding-left: 50px;
	width: 100%;
	font-size: 35px;
	color: white;
	font-family: verdana;
	height: 25px;
	color: #000000;
}

form {
	text-align: center;
	font-family: verdana;
	padding: 50px;
	padding-bottom: 0px;
	width: 100%;
}

nav {
	background-color: #000000;
	color: #FFFFFF;
	height: 100px;
	padding: 50px 1px 1px 1px;
	text-align: center;
	font-size: 35px;
	font-family: verdana;
	font-weight: bold;
}

.navbar {
	background-color: #000000;
	background-image: linear-gradient(to top, rgba(255, 255, 255, 0.5),
		rgba(255, 255, 255, 0) 50%);
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
	background-image: linear-gradient(to top, rgba(0, 0, 0, 0.5),
		rgba(0, 0, 0, 0) 50%);
	color: black;
}

.navbar a:hover {
	background-color: #DCDCDC;
}

body {
	background-image: url('book.jpg');
	font-family: verdana;
}
</style>
</head>

<body>
<h1>Invalid Login! Please try again!</h1>
	<nav>
		<a>Welcome to the Washington T. Bookstore</a>
	</nav>
	<div class="navbar">
		<a href="homepage.html">HOME</a> <a href="login.html">LOGIN</a> <a
			href="registration.html">REGISTER</a> <a href="admin_hp.html">*DEMO
			ADMIN ACCESS*</a>
	</div>
	<header>
		<h2>Please Login</h2>
	</header>
	<form action="Logincheck.jsp" method="post">
		<label for="username">Username:</label><br> <input type="text"
			id="username" name="username"><br> <label for="password">Password:</label><br>
		<input type="password" id="password" name="password"><br> <input
			type="checkbox" id="remember" name="remember" value="remember">
		<label for="remember"> Remember Me</label><br> <input
			type="submit" value="Login"><br>
		<br><a href="reset.jsp"><button type="button">Reset Password</button></a><br>
		<br> <label for="create">Don't have an account?</label><br>
		<a href="registration.html"><button type="button">Create
				New Account</button></a>
	</form>
</body>
</html>