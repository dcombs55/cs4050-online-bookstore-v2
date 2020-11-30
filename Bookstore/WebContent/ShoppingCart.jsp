<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Shopping Cart</title>
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
	}
</style>
</head>
<body>
<header>
<h1>Shopping Cart</h1>
</header>
<p>Cart</p>
  <%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

Statement s4 = connection.createStatement();
String s5 = request.getParameter("u");
String t = request.getParameter("title");
String p = request.getParameter("price");
String pic = request.getParameter("picture");
String s6 = ("insert into Bookstore.ShoppingCart values ('" + t +"','" + s5 + "','" +
		p +"','" + pic + "')");
PreparedStatement ps2 = connection.prepareStatement(s6);
ps2.executeUpdate();
Statement s = connection.createStatement();
String s1 = ("select * from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'");
PreparedStatement ps1 = connection.prepareStatement(s1);
String s3;
ResultSet rs = s.executeQuery(s1);
double total = 0.00;
int count = 0;
while(rs.next()){
%>
<book id="book"><img border="0" src="<%=rs.getString("BookURL")%>" width="188" height="300"></book><br>
<%
count++;
total += Double.parseDouble(rs.getString("BookPrice"));
}
%>
<b>Order Details:</b>
<p>Price: <%=Double.toString(total)%></p>
<p>Total Books: <%=Integer.toString(count)%></p>
<p>Active Promotions: N/A</p>
<b>Payment Info</b>
<p>Show Saved Info Here...(if any)</p>
<a href = "edit_profile.html"><button type = "button">Edit Payment Info</button><br></a>
<b>Shipping Info</b>
<p>Show Saved Info Here...(if any)</p>
<a href = "edit_profile.html"><button type = "button">Edit Shipping Info</button><br><br></a>

<a href = "book_details.html"><button type = "button">Back</button></a>
<a href = "book1_emptycart.html"><button type = "button">Remove Item(s) from Cart</button></a>
<a href = "checkout.html"><button type = "button">Checkout</button></a>
</body>

</html>