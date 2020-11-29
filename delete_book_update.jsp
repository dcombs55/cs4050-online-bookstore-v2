<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
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
String name = request.getParameter("Book_Name");
String s1 = "update Bookstore.Book set Archived = 'yes' where BookName ='" + name + "'";
PreparedStatement ps1 = connection.prepareStatement(s1);
ps1.executeUpdate();
response.sendRedirect("AllBooksAdmin.jsp");
 %>
</body>
</html>