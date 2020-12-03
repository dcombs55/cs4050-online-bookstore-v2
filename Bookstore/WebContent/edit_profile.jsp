<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
     <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
    <%@page import="bean.Encryption"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Create An Account</title>
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
	button{
			background-color: #000000;
			color: #FFFFFF;
			padding: 15px 32px;
			text-decoration: none;
			display: inline-block;
			font-size: 16px;
			cursor: pointer;
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
			var oldPassword = document.editProfile.oldPassword;
			var password = document.editProfile.pass1;
			var confirmPassword = document.editProfile.pass2;
			var password_confirm_error = document.getElementById('password_confirm_error');
			var password_error = document.getElementById('password_error');
			var old_password_error = document.getElementById('old_password_error');
			password_confirm_error.innerHTML = "";
			password_error.innerHTML = "";
			old_password_error.innerHTML = "";
			
			if(oldPassword.value != "" && password.value != "" && password.value == oldPassword.value){
				oldPassword.style.border = "1px solid red";
				old_password_error.innerHTML = "New Password must not be the same as Old Password<br/>";
				return false;
			}
			else if(oldPassword.value != ""){
				if(!checkPassword(oldPassword.value)){
					oldPassword.style.border = "1px solid red";
					old_password_error.innerHTML = "Password entered is not valid!</br>";
					return false;
				}
				return true;
			}
			
			if(password.value != "" && confirmPassword.value != "" && password.value === confirmPassword.value){
				if(!checkPassword(password.value)){
					password.style.border = "1px solid red";
					password_error.innerHTML = "Password entered is not valid!</br>";
					return false;
				}
				else{
					return true;
				}
			}else if(password.value != "" && confirmPassword.value != ""){
				password.style.border = "1px solid red";
				confirmPassword.style.border = "1px solid red";
				password_confirm_error.innerHTML = "Passwords do not match!</br>";
				return false;
			}	
		}
	</script>
<header>
	<h1>Edit Your Profile!</h1>
</header>
<main>
	<form name="editProfile" action="edit_profile_update.jsp" onsubmit="return validateForm()" method= "post">
	  <%
	  //HttpSession session1 = request.getSession();
	String user = session.getAttribute("username").toString();
	System.out.println(user);
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
Statement s = connection.createStatement();
String s1 = ("select * from Bookstore.Customer where UserID= " + "'" + user+ "'");
String s2 = ("select * from Bookstore.CreditCard where UserID= " + "'" + user+ "'");
String s3 = ("select * from Bookstore.Address where Customer_UserID=" + "'" + user+ "'");
ResultSet rs = s.executeQuery(s1);
while(rs.next()){
%>
		<label>
			First Name
				<input type="text" name="First_Name" value='<%=rs.getString("FirstName")%>'/>
		</label>
		<label>
			Last Name
				<input type="text" name="Last_Name" value='<%=rs.getString("LastName")%>' />
		</label><br/>		
		<%
		}
		%>
		
		<label>
			<b>Change Password</b>
		</label>
		
		<%if(session.getAttribute("password_error") != null){ %>
			${password_error}<br/>
		<% session.removeAttribute("password_error");
		} %>
		
		<label>
			Old password
				<input type="password" name="oldPassword">
		</label>
		<div class="errors" id="old_password_error"></div>
		
		<label>
			New password (New password must not be same as old password)
				<input type="password" name="pass1">
		</label>
		<div class="errors" id="password_error"></div>
		
		<details>
					<summary>Requirements</summary>
					<p>Password must be at least 8 characters long and include at least one uppercase
					letter, lower case letter and number.</p>
		</details><br/>
		
		<label>
			Confirm new password (must match new password)
				<input type="password" name="pass2">
		</label>
		<div class="errors" id="password_confirm_error"></div><br/>
		
		<%
		ResultSet rs3 = s.executeQuery(s3);
		while(rs3.next()){
		%>
		<label>
			<b>Shipping Address</b>
		</label>
		<label>
		Street
		<input type="text" name="street" value='<%=rs3.getString("Street")%>'>
		</label>
		<label>
		City
		<input type="text" name="city" value='<%=rs3.getString("City")%>'>
		</label>
		<label>
		State
		<input type="text" name="state" value='<%=rs3.getString("State")%>'>
		</label><br/>
		<%
		}
		%>
		
		<label>
			<b>Payment Info</b>
		</label>
		<%
		ResultSet rs2 = s.executeQuery(s2);
		while(rs2.next()){
			
		%>
		<label>
			Credit Card Number
			<%if(rs2.getString("CardNum") == ""){ %>
				<input type="text" name="CCNum">
			<%}else{ %>
				<input type="text" name="CCNum" value="<%=Encryption.decrypt(rs2.getString("CardNum"), user)%>">
			<%} %>
		</label>
		<label>
			Exp Date
			<input type="date" name="date" value='<%=rs2.getString("ExpDate")%>'>
		</label>
		<label>
			CCV
			<%if(rs2.getString("CCV") == ""){ %>
				<input type="text" name="ccv">
			<%}else{ %>
				<input type="text" name="ccv" value="<%=Encryption.decrypt(rs2.getString("CCV"), user)%>">
			<%} %>
		</label><br/>
		<%
		}
		%>
		
		<% rs = s.executeQuery(s1);
		while(rs.next()){ %>
			<label><b>Subscription</b></label>
			Do you want to stay subscribed to Promotions?
			<input type ="text" name ="subscribed" value ='<%=rs.getString("Subscribed") %>' />
			</label><br/><br/>
		<%}%>
		
	<input type="submit" value = "Save Changes"></input><br/>
	<a href = "Logincheck.jsp"><button type = "button">Exit</button></a>
	</form>
</main>
</body>
</html>