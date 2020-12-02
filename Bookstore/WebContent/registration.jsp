<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
	<title>Registration Page</title>
	<style>
		body{
			background-color: #FFFFFFF;
			background-image: url('book.jpg');
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
		.navbar input[type=text] {
			padding: 10px;
			border: none;
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
		#server_errors{
			margin-left: 10%;
			margin-right: 10%;
			width: 80%;
			margin-top: 20px;
		}
		.required:after {
   			content:" *";
    		color: red;
  		}
  		.errors{
  			color:red;
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
			var emailAddress = document.register.emailAddress;
			var password = document.register.password;
			var confirmPassword = document.register.confirmPassword;
			var password_confirm_error = document.getElementById('password_confirm_error');
			var password_error = document.getElementById('password_error');
			var email_error = document.getElementById("email_error");
			password_confirm_error.innerHTML = "";
			password_error.innerHTML = "";
			email_error.innerHTML = "";
			
			var atposition = emailAddress.value.indexOf("@");
			var dotposition = emailAddress.value.substring(atposition).indexOf(".") + atposition;
			if (atposition < 1 || dotposition < atposition+2 || dotposition+2 >= emailAddress.value.length){  
				emailAddress.style.border = "1px solid red";
				email_error.innerHTML = "Please enter a valid e-mail address";  
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
	
	<h1>WASHINGTON T. BOOKSTORE</h1>
	<div class="navbar">
		<a href = "homepage.html">HOME</a>
		<a href = "login.jsp">LOGIN</a>
		<a class ="active" href = "registration.jsp">REGISTER</a>
		<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
	</div>
	<main>
	<div class="errors" id="server_errors">${errors}
		
		<%if(session.getAttribute("errors") != null) {
			session.removeAttribute("errors");
		} %>
	</div>
		<div id = "accountInfoForm">
			<h2>Create an Account </h2>
			<form name="register" action="${pageContext.request.contextPath}/register" onsubmit="return validateForm()" method="post">
				<label class="required">First Name</label>
				<input type="text" name="firstName" placeholder="Enter First Name" required>
				
				<label class="required">Last Name</label>
				<input type="text" name="lastName" placeholder="Enter Last Name" required>
				
				<label class="required">Email</label>
				<input type="text" name="emailAddress" placeholder="Enter Email" required>
				<div class="errors" id="email_error"></div>
				
				<label class="required">Phone Number</label>
				<input type="tel" name="phone" pattern="[0-9]{3}-[0-9]{3}-[0-9]{4}" placeholder="Enter Phone Number (XXX-XXX-XXXX)" required>
				
				<label class="required">Username</label>
				<input type="text" name="username" placeholder="Enter Username" required>
				
			    <label class ="required">SubscribedtoPromotions</label>
			    <input type ="text" name="subscribed" placeholder="Enter yes or no" required>
				
				<label class="required">Password</label>
				<input type="password" name="password" placeholder="Enter Password" required>
				<div class="errors" id="password_error"><br/></div>
				
				<details>
					<summary>Requirements</summary>
					<p>Password must be at least 8 characters long and include at least one uppercase
					letter, lower case letter and number.</p>
				</details>
				
				<br>
				<label class="required">Confirm Password</label>
				<input type="password" name="confirmPassword" placeholder="Re-enter Password" required>
				<div class="errors" id="password_confirm_error"></div>
				
				<input type="submit" value="Create Account"/>
			</form>
		</div>

		<br>
		<div id="userOptions">
			<!-- <a href = "confirmation.html"><button>Create Account</button></a> -->
			<p><a style="color:black" href="homepage.html">Cancel</a></p>
		</div>
	</main>

</body>
</html>