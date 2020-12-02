<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Previous Orders</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	header {
  		text-align: center;
  		font-size: 35px;
  		height: 25px;
  		color: #000000;
  		margin-bottom: 75px;
  		font-family:verdana;
	}
	body{
		background-image: url('book.jpg');
		font-family:verdana;
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
	#book {
			height: 300px;
			width: 188px;
			margin: 10px;
			background: black;
			float: left;
	}
	.row::after {
			content: "";
			clear: both;
			display: table;
		}
</style>
</head>
<body>
<header>
<h1>Previous Orders</h1>
</header>
  <%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
String s5 = request.getParameter("u");
Statement s = connection.createStatement();
String st = "select * from Bookstore.Order where UserID ='" + session.getAttribute("username") +"' ORDER BY OrderID DESC LIMIT 1";
String s1 = "";
PreparedStatement ps2 = connection.prepareStatement(st);
ResultSet rs2 = s.executeQuery(st);
int count2 = 0;
while(rs2.next()){
	count2 = Integer.parseInt(rs2.getString("OrderID"));
}
String ss = "select * from Bookstore.Order where UserID ='" + session.getAttribute("username") +"' ORDER BY OrderID LIMIT 1";
PreparedStatement ps3 = connection.prepareStatement(ss);
ResultSet rs3 = s.executeQuery(ss);
int count3 = 0;
while(rs3.next()){
	count3 = Integer.parseInt(rs3.getString("OrderID"));
}
for(int i = count3; i <= count2; i++){
	s1 = ("select * from Bookstore.Order where UserID ='" + session.getAttribute("username") +"' and OrderID ='" + i + "'");
	PreparedStatement ps1 = connection.prepareStatement(s1);
	ResultSet rs = s.executeQuery(s1);
	String total = "";
	int count = 0;
	while(rs.next()){
	%>
	<form action = "Reorder.jsp?u=<%=rs.getString("OrderID")%>" method= "post">
	<div class ="row">
	<book id="book"><img border="0" src="<%=rs.getString("BookURL")%>" width="188" height="300"></book>
	<% total = rs.getString("TotalPrice");
	count++;
	}
	%>
	<b>Order Details:</b>
	<p>Price: <%=total%></p>
	<p>Total Books: <%=count%></p>
	</div>
	<input type="submit" value="Reorder">
	</form>
	<% 
}
%>
<a href = "Logincheck.jsp"><button type = "button">Return to Home</button><br><br></a>
</body>

</html>