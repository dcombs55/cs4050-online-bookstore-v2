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
String q = request.getParameter("Book_Name");
String w = request.getParameter("author");
String e = request.getParameter("ibsn");
String r = request.getParameter("price");
String t = request.getParameter("desc");
String y = request.getParameter("copies");
String u = request.getParameter("bookURL");
if(q!=null && w!=null && e!=null && r!=null && t!=null && y!=null && u!=null){
	String s1 = "insert into Bookstore.Book (BookName,Author,IBSN,Price,Description,NumOfCopies, PictureURL,Archived) values (?,?,?,?,?,?,?,'no')";
	PreparedStatement ps1 = connection.prepareStatement(s1);
	ps1.setString(1,q);
	ps1.setString(2,w);
	ps1.setString(3,e);
	ps1.setString(4,r);
	ps1.setString(5,t);
	ps1.setString(6,y);
	ps1.setString(7,u);
	ps1.executeUpdate();
	response.sendRedirect("AllBooksAdmin.jsp");
}
%>
</body>
</html>