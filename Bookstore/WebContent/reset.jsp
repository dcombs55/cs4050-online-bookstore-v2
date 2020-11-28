<!DOCTYPE html>
<html lang="en">
<head>
<title>Reset Password</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	header {
  		text-align: center;
  		font-size: 35px;
  		height: 25px;
  		color: #000000;
  		margin-bottom: 75px;
	}
	body{
		background-image: url('book.jpg');
		font-family:verdana;
	}
	main{
		width: 45%;
		margin: auto;
		background-color: #DCDCDC;
		padding: 2.5px;
		padding-top:20px;
	}
	label, input{
		display: block;
	}
	input{
		margin-top: 2.5px;
		width: 100%;
		height: 25px;
		padding-left: 7.5px;
	}
	label{
		margin-bottom: 12.5px;
	}
	form{
		margin-left: 10%;
		margin-right: 10%;
	}
	.errors{
  		color:red;
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
	<script type="text/javascript">
		function checkPassword(str){
			var re = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
			return re.test(str);
		}
		
		function validateForm(){
			var oldPassword = document.reset.OldPassword;
			var password = document.reset.Password1;
			var confirmPassword = document.reset.Password2;
			var password_confirm_error = document.getElementById('password_confirm_error');
			var password_error = document.getElementById('password_error');
			var old_password_error = document.getElementById('old_password_error');
			password_confirm_error.innerHTML = "";
			password_error.innerHTML = "";
			old_password_error.innerHTML = "";
		
			if(!checkPassword(oldPassword.value)){
				old_password.style.border = "1px solid red";
				old_password_error.innerHTML = "Password entered is not valid!";
				return false;
			}
			
			if(password.value === confirmPassword.value){
				if(!checkPassword(password.value)){
					password.style.border = "1px solid red";
					password_error.innerHTML = "Password entered is not valid!";
					return false;
				}
				else{
					return true;
				}
			}else{
				password.style.border = "1px solid red";
				confirmPassword.style.border = "1px solid red";
				password_confirm_error.innerHTML = "Passwords do not match!";
				return false;
			}	
		}
	</script>
<header>
	<h1>Reset Your Password!</h1>
</header>
<main>
	<form name="reset" action="${pageContext.request.contextPath}/login" onsubmit="return validateForm()" method = "post">
		<label for = "Username">
			Username
			<input type="text" name = "Username" placeholder="Enter existing username" required>
		</label>
		<label>
			Password
			<input type="password" name = "OldPassword" required>
		</label>
		<div class="errors" id="old_password_error"><br/></div>
		
		<label for = "Password1">
			New password (New password must not be same as old password)
			<input type="password" name = "Password1" required>
		</label>
		<div class="errors" id="password_error"><br/></div>
		
		<details>
			<summary>Requirements</summary>
			<p>Password must be at least 8 characters long and include at least one uppercase
			letter, lower case letter and number.</p>
		</details>
		
		<label for = "Password2"">
			Confirm new password (must match new password)
			<input type="password" name = "Password2" required>
		</label>
		<div class="errors" id="password_confirm_error"></div>
		
		<input type = "submit" name = "reset-action" value="Save Changes">
		
		<a href = "login.jsp"><button type = "button">Cancel</button></a>
		
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
</main>

</body>
</html>