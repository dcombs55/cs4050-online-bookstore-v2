<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
String user = request.getParameter("Username");
String pass1 = request.getParameter("Password1");
String pass2 = request.getParameter("Password2");
Class.forName("com.mysql.jdbc.Driver");
if(pass1.equals(pass2)){
	try (Connection connection = DriverManager.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
	    PreparedStatement ps = connection
	    .prepareStatement("update Bookstore.Customer set Password=? where UserID=? ")) {
	    ps.setString(2, user);
	    ps.setString(1, pass2);
	    int i =ps.executeUpdate();
	    if(i>0){
	    	response.sendRedirect("resetsuccess.html");
	    }else{
	    	response.sendRedirect("resetagain.html");
	    }
	
	} catch (Exception e) {
	    e.printStackTrace();
	}
}
else{
	response.sendRedirect("resetagain2.html");
}

%>
</body>
</html>