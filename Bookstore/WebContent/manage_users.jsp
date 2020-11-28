<!DOCTYPE html>
<html>
<head>

	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	  
	if(session.getAttribute("adminUsername") == null){
		response.sendRedirect("logout_error.html");
	}
	%>
	
	<title>Manage Users</title>
	<style>
		h1 {
			color:white;
			text-align:center;
			margin:50px;
		}
		body{
			font-family: Arial, Verdana, Helvetica;
			background-color: #030303;
			background-image: linear-gradient(to right, rgba(40,40,40,0), rgba(40,40,40,0.25));
		}
		input:hover{
			background-color: #DCDCDC;
		}
		#menu {
			margin: auto;
			padding: 2%;
			background: black;
			width: 40%;
			text-align:center;
			border: 5px solid #202020;
		}
		.button{
			background-color: #FFCC10;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0));
  			color: black;
  			cursor: pointer;
  			display: inline-block;
  			font-size: 20px;
  			padding: 20px 40px;
  			text-align: center;
  			text-decoration: none;
			width: 250px;
			margin-bottom: 50px;
		}
		.signout {
			background-color: #FF1030;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 150%);
  			color: black;
  			cursor: pointer;
  			display: inline-block;
  			font-size: 20px;
  			padding: 20px 40px;
  			text-align: center;
  			text-decoration: none;
			width: 180px;
		}
		input{
			display: block;
		}
	</style>
	<meta charset="UTF-8">
</head>
<body>
	
	<h1>Manage Users</h1>
	<main>
		<div id="menu">
			<form action="${pageContext.request.contextPath}/employees" method="post">
				<div><input type="submit" formaction="${pageContext.request.contextPath}/employees" value="Manage Employees" class="button"></div>
				<div><input type="submit" formaction="${pageContext.request.contextPath}/customers" value="Manage Customers" class="button"></div>
				<div><input type="submit" formaction="admin_hp.jsp" value="Main Menu" class="button"></div>
				<div><input type="submit" formaction="${pageContext.request.contextPath}/sign-out" value="Sign Out" class="signout"></div>
			</form>
		</div>
	</main>

</body>
</html>