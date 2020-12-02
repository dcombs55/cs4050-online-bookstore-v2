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
String s6 = ("insert into Bookstore.ShoppingCart (BookName,Customer_UserID,BookPrice,BookURL) values ('" + t +"','" + s5 + "','" +
		p +"','" + pic + "')");
PreparedStatement ps2 = connection.prepareStatement(s6);
ps2.executeUpdate();
Statement s = connection.createStatement();
String s1 = ("select * from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'");
PreparedStatement ps1 = connection.prepareStatement(s1);
ResultSet rs = s.executeQuery(s1);
double total = 0.00;
int count = 0;
while(rs.next()){
%>
<book id="book"><img border="0" src="<%=rs.getString("BookURL")%>" width="188" height="300"></book><br>
<form action ="RemoveBook.jsp?u=<%=rs.getString("BookID")%>" method="post">
<input type="submit" value="Remove Book">

</form>
<%
count++;
total += Double.parseDouble(rs.getString("BookPrice"));
}
%>
<form>
<b>Order Details:</b>
<p>Price: <%=Double.toString(total)%></p>
<p>Total Books: <%=Integer.toString(count)%></p>
<p>Active Promotions: N/A</p>
<b>Payment Info</b>
<%
Statement s2 = connection.createStatement();
String s3 = ("select * from Bookstore.CreditCard where UserID ='" + s5 +"'");
PreparedStatement ps3 = connection.prepareStatement(s3);
ResultSet rs1 = s.executeQuery(s3);
while(rs1.next()){
	%>
<p>Card Type: <%=rs1.getString("CardType")%></p>
<p>Card #: Ending in <%
String lastFour= "";
String fullCard = rs1.getString("CardNum");
lastFour = fullCard.substring(fullCard.length()-4);
%>
<%=lastFour%>
</p>
<%
}
%>
<a href = "edit_profile.jsp"><button type = "button">Edit Payment Info</button><br></a>
<b>Shipping Info</b>
<%
Statement s8 = connection.createStatement();
String s7 = ("select * from Bookstore.Address where Customer_UserID ='" + s5 +"'");
PreparedStatement ps4 = connection.prepareStatement(s7);
ResultSet rs2 = s.executeQuery(s7);
while(rs2.next()){
	%>
<p>Street: <%=rs2.getString("Street")%></p>
<p>City: <%=rs2.getString("City")%></p>
<p>State: <%=rs2.getString("State")%></p>
<%
}
%>
<a href = "edit_profile.jsp?u=<%=session.getAttribute("username")%>"><button type = "button">Edit Shipping Info</button><br><br></a>
<a href = "Logincheck.jsp?u=<%=session.getAttribute("username")%>"><button type = "button">Back</button></a>
<a href = "Checkout.jsp?u=<%=session.getAttribute("username")%>"><button type = "button">Checkout</button></a>
</form>
</body>

</html>