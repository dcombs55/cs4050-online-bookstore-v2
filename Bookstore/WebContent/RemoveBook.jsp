<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");

Statement s = connection.createStatement();
	String b =request.getParameter("u");
	String s1 = ("delete from Bookstore.ShoppingCart where BookID ='" + b +"'");
	PreparedStatement ps1 = connection.prepareStatement(s1);
	ps1.executeUpdate();
	response.sendRedirect("ViewShoppingCart.jsp");
%>
</body>
</html>