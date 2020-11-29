<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Edit Book</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	header {
  		text-align: center;
  		font-size: 35px;
  		height: 25px;
  		color: #FFFFFF;
  		margin-bottom: 75px;
	}
	body{
		font-family:verdana;
		background-color: #030303;
		background-image: linear-gradient(to right, rgba(40,40,40,0), rgba(40,40,40,0.25));
	}
	main{
		width: 45%;
		margin: auto;
		background-color: #FC2C00;
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
	<h1>Edit Book!</h1>
</header>
<main>
	<form action="edit_book_update.jsp" method= "post">
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
<input type="hidden" name="ID" value='<%=rs.getString("BookID")%>'>
		<label>
			Book Name
				<input type="text" name="Book_Name" value='<%=rs.getString("BookName")%>'/>
		</label>
		<label>
			IBSN
				<input type="text" name="ibsn" value='<%=rs.getString("IBSN")%>' />
		</label>
		<label>
			Author
			<input type="text" name="author" value='<%=rs.getString("Author")%>'>
		</label>
		<label>
		Price
		<input type="text" name="price" value='<%=rs.getString("Price")%>'>
		</label>
		<label>
		Description
		<input type="text" name="desc" value='<%=rs.getString("Description")%>'>
		</label>
		<label>
		Copies Left
		<input type="text" name="copies" value='<%=rs.getString("NumOfCopies")%>'>
		</label>
		<label>
			URL
				<input type="text" name="bookURL" value='<%=rs.getString("PictureURL")%>'>
		</label>
		<label>
			Featured (yes/no)
				<input type="text" name="featured" value='<%=rs.getString("Featured")%>'>
		</label>
		<label>
			Best Seller (yes/no)
				<input type="text" name="BestSeller" value='<%=rs.getString("BestSeller")%>'>
		</label>
		<%
		}
		%>
	<input type="submit" value = "Save Changes"></input>
	<a href = "AllBooksAdmin.jsp"><button type = "button">Exit</button></a>
	</form>
</main>
</body>
</html>