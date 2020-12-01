<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Book Details</title>
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
	#book {
			height: 600px;
			width: 375px;
			margin: 10px;
			background: black;
			float:left;
	}
	details{
		font-size: 20px;
  		color: #000000;
  		font-family:verdana;
  		margin:50px;
  		float:below;
  		padding-bottom:100px;
	}
	body{
		background-image: url('book.jpg');
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
	<h1>Book Details</h1>
	</header>
	  <%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
Statement s = connection.createStatement();
String s2 = request.getParameter("u");
String s1 = ("select * from Bookstore.Book where BookID ='" + s2 +"'");
PreparedStatement ps1 = connection.prepareStatement(s1);
String s3;
ResultSet rs = s.executeQuery(s1);
while(rs.next()){
%>
	<form action="ShoppingCart.jsp?u=<%=session.getAttribute("username")%>" method = "post">
	<input type="hidden" name="ID" value='<%=rs.getString("BookID")%>'></input>
	<input type="hidden" value="<%=rs.getString("BookName")%>" name="title"></input>
	<input type="hidden"  value="<%=rs.getString("PictureURL")%>" name="picture"></input>
	<input type="hidden" value="<%=rs.getString("Price")%>" name="price"></input>
	<book name="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="375" height="600"></book>
	<details>
		<d1>Title: <%=rs.getString("BookName")%></d1><br>
		<d1>Author: <%=rs.getString("Author")%></d1><br>
		<d1>Description: <%=rs.getString("Description")%></d1><br>
		<d1>Price: <%=rs.getString("Price")%></d1><br>
	</details>
	<%
	String back = "";
	if(session.getAttribute("username") != null){
		back = "Logincheck.jsp";
	}
	else{
		back = "homepage.jsp";
	}
		%>
	
	<a href = "<%=back%>"><button type = "button">Back</button></a>
	<input type ="submit" value = "Add to Cart"></input>
	<button>Checkout</button>
	</form>
	<%
}
	%>
</body>
</html>