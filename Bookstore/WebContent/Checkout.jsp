<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<html>
<head>
<meta charset="UTF-8">
<title>Congrats!</title>
</head>
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
<body>
<header>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

String s5 = request.getParameter("u");
Statement s = connection.createStatement();
%>
<h1>Congratulations!</h1>
</header>
<b>You have successfully purchased:</b><br>
<%
String s1 = ("select * from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'");
PreparedStatement ps1 = connection.prepareStatement(s1);
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
String s2 = ("select * from Bookstore.Address where Customer_UserID ='" + s5 +"'");
PreparedStatement ps2 = connection.prepareStatement(s2);
ResultSet rs2 = s.executeQuery(s2);
while(rs2.next()){
%>

<p>Your order has been sent to: <%=rs2.getString("Street")%> <%=rs2.getString("City")%>,
<%=rs2.getString("State")%></p>
<%
}

String s3 = ("select * from Bookstore.CreditCard where UserID ='" + s5 +"'");
PreparedStatement ps3 = connection.prepareStatement(s3);
ResultSet rs3 = s.executeQuery(s3);
while(rs3.next()){
%>
<p>Card ending in: <%
String lastFour= "";
String fullCard = rs3.getString("CardNum");
lastFour = fullCard.substring(fullCard.length()-4);
%>
<%=lastFour%> has been charged: <%=total%></p>
<%
}
String s4 = ("select * from Bookstore.Customer where UserID ='" + s5 +"'");
PreparedStatement ps4 = connection.prepareStatement(s4);
ResultSet rs4 = s.executeQuery(s4);
while(rs4.next()){
%>
<p>A confirmation email has been sent with more details to: <%=rs4.getString("Email")%></p>
<%
}
%>
<b> Thank you for shopping with Washington T. Bookstore!</p>
<%
	String s6 = "delete from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'";
	PreparedStatement ps5 = connection.prepareStatement(s4);
	ps5.executeUpdate();
%>
<a href = "Logincheck.jsp"><button type = "button">Return to Home</button><br><br></a>

</body>
</html>