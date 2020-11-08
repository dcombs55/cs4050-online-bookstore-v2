<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Profile</title>
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
</style>
</head>
<body>
<header>
	<h1>Edit Your Profile!</h1>
</header>
<main>
	<form action="edit_profile_update.jsp" method= "post">
	  <%
	  HttpSession session1 = request.getSession();
	String user = session1.getAttribute("username").toString();
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
		</label>
		<%
		}
		%>
		<label>
			Password (To change your password, you must enter your password)
			<input type="password" name = "OldPassword" required>
		</label>
		<label for = "Password1">
			New password (New password must not be same as old password)
				<input type="password" name = "Password1" required>
		</label>
		<details>
			<summary>Requirements</summary>
			<p>Password must be at least 8 characters long and include at least one uppercase
			letter, lower case letter and number.</p>
		</details>
		<label for = "Password2"">
			Confirm new password (must match new password)
			<input type="password" name = "Password2" required>
		</label>
		<%
		ResultSet rs3 = s.executeQuery(s3);
		while(rs3.next()){
		%>
		<label>
			Shipping Address
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
		</label>
		<%
		}
		%>
		<label>
			Payment Info
		</label>
		<%
		ResultSet rs2 = s.executeQuery(s2);
		while(rs2.next()){
			
		%>
		<label>
			Credit Card Number
				<input type="text" name="CCNum" value='<%=rs2.getString("CardNum")%>'>
		</label>
		<label>
			Exp Date
			<input type="date" name="date" value='<%=rs2.getString("ExpDate")%>'>
		</label>
		<label>
			CCV
				<input type="text" name="ccv" value='<%=rs2.getString("CCV")%>'>
		</label>
		<%
		}
		%>
	<input type="submit" value = "Save Changes"></input>
	<a href = "homepage.html"><button type = "button">Exit</button></a>
	</form>
</main>
</body>
</html>