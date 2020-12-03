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
		padding-bottom: 50px;
		width: 100%;
		font-size: 35px;
		color: white;
		font-family: verdana;
		height: 25px;
		color: #000000;
	}
	
	form{
		text-align: center;
		font-family: verdana;
		padding: 20px 50px 0px 50px;
		width: 100%;
	}
	
	nav {
		background-color: #FF9505;
		color: #FFFFFF;
		height: 100px;
		padding: 50px 1px 1px 1px;
		text-align: center;
		font-size: 35px;
		font-family: verdana;
		font-weight: bold;
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
			.navbar input[type=text] {
				padding: 10px;
				border: none;
			}
	
	.navbar a:hover {
		background-color: #FFC370;
	}
	
	body {
		background-image: url('book.jpg');
		font-family: verdana;
	}
	/* The Modal (background) */
	.modal {
	
	  <% if (session.getAttribute("error") != null || session.getAttribute("success") != null) { %>
    	display: block;
	  <% } else { %> 
	  	display: none;
	  <% } %>
	  
	  position: fixed; /* Stay in place */
	  z-index: 1; /* Sit on top */
	  padding-top: 100px; /* Location of the box */
	  left: 0;
	  top: 0;
	  width: 100%; /* Full width */
	  height: 100%; /* Full height */
	  overflow: auto; /* Enable scroll if needed */
	  background-color: rgb(0,0,0); /* Fallback color */
	  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
	}
	
	/* Modal Content */
	.modal-content {
	  background-color: #fefefe;
	  margin: auto;
	  padding: 20px;
	  border: 1px solid #888;
	  width: 80%;
	}
	
	/* The Close Button */
	.close {
	  color: #aaaaaa;
	  float: right;
	  font-size: 28px;
	  font-weight: bold;
	}
	
	.close:hover,
	.close:focus {
	  color: #000;
	  text-decoration: none;
	  cursor: pointer;
	}
</style>
</head>

<body>
	<nav>
		<a>Welcome to the Washington T. Bookstore</a>
	</nav>
	
	<div class="navbar">
		<a href="homepage.html">HOME</a> <a href="login.jsp">LOGIN</a> 
		<a href="registration.jsp">REGISTER</a> 
		<a href="admin_hp.html">*DEMO ADMIN ACCESS*</a>
	</div>
	
	<header>
		<h2>Please Login</h2>
	</header>
	<form name="login" action="${pageContext.request.contextPath}/login" method="post">
		<label for="username">Username:</label><br> 
		<input type="text" id="username" name="username" required><br> 
		
		<label for="password">Password:</label><br>
		<input type="password" id="password" name="password" required><br> 
		
		<input type="checkbox" id="remember" name="remember" value="remember">
		<label for="remember"> Remember Me</label><br> 
		
		<input type="submit" name="login-action" value="Login">
	</form>
	
	<form name="other-options" action="${pageContext.request.contextPath}/login" method="post">
		<label for="forgot">Forgot password?</label>
		<input type="submit" name="login-action" value="Reset Password"><br>
		
		<br> <label for="create">Don't have an account?</label><br>
		<a href="registration.jsp"><button type="button">Create New Account</button></a>
	</form>
	
	
	<div id="myModal" class="modal">
		<!-- Modal content -->
	  	<div class="modal-content">
	    <span class="close">&times;</span>
	    <% if (session.getAttribute("error") != null){ %>
	  	<p>Unable to reset password. Please try again!</p>
	    <% session.removeAttribute("error"); 
	   	}
	    else if(session.getAttribute("success") != null){ %>
	   	<p>Password was successfully reset!</p>
	    <% session.removeAttribute("success"); 
	    }%>
	</div>
	
	<script>
		// Get the modal
		var modal = document.getElementById("myModal");
		
		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];
		
		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
		  modal.style.display = "none";
		}
		
		// When the user clicks anywhere outside of the modal, close it
		window.onclick = function(event) {
		  if (event.target == modal) {
		    modal.style.display = "none";
		  }
		}
	</script>
	
</body>
</html>