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
HttpSession session1 = request.getSession();
String user = session1.getAttribute("username").toString();
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
String q = request.getParameter("First_Name");
String w = request.getParameter("Last_Name");
String e = request.getParameter("street");
String r = request.getParameter("city");
String t = request.getParameter("state");
String y = request.getParameter("CCNum");
String u = request.getParameter("date");
String i = request.getParameter("ccv");
String s1 = "update Bookstore.Customer set FirstName=?,LastName=? where UserID= " + "'" + user+ "'";
PreparedStatement ps1 = connection.prepareStatement(s1);
ps1.setString(1,q);
ps1.setString(2,w);
ps1.executeUpdate();
String s2;
PreparedStatement ps2;
if(e==null && r==null && t==null){	
	s2 = "update Bookstore.Address set Street=?,City=?,State=?,Customer_UserID=?";
	ps2 =connection.prepareStatement(s2);
	ps2.setString(1,e);
	ps2.setString(2,r);
	ps2.setString(3,t);
	ps2.setString(4,user);
}else{
	s2 = "update Bookstore.Address set Street=?,City=?,State=? where Customer_UserID= " + "'" + user+ "'";
	ps2 =connection.prepareStatement(s2);
	ps2.setString(1,e);
	ps2.setString(2,r);
	ps2.setString(3,t);
}
ps2.executeUpdate();
String s3;
PreparedStatement ps3;
if(y==null && u==null && i==null){
	s3 = "update Bookstore.CreditCard set CardNum=?,ExpDate=?,CCV=?,userID=?";
	ps3 =connection.prepareStatement(s3);
	ps3.setString(1,y);
	ps3.setString(2,u);
	ps3.setString(3,i);
	ps3.setString(4,user);
}
else{
	s3 = "update Bookstore.CreditCard set CardNum=?,ExpDate=?,CCV=? where UserID= " + "'" + user+ "'";
	 ps3 =connection.prepareStatement(s3);
	ps3.setString(1,y);
	ps3.setString(2,u);
	ps3.setString(3,i);
}
ps3.executeUpdate();
response.sendRedirect("edit_profile.jsp");
%>
</body>
</html>