<!DOCTYPE html>
<html>
<head>
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
			<form action="${pageContext.request.contextPath}/register" method="post">
				<div><input type="submit" formaction="${pageContext.request.contextPath}/register" value="Manage Employees" class="button"></div>
				<div><input type="submit" formaction="#" value="Manage Customers" class="button"></div>
				<div><input type="submit" formaction="admin_hp.html" value="Main Menu" class="button"></div>
				<div><input type="submit" formaction="homepage.html" value="Sign Out" class="signout"></div>
			</form>
		</div>
	</main>

</body>
</html>