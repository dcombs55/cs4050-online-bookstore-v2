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
String s5 = request.getParameter("u");

String s3 = "";
String[] books;
Double[] prices;
String[] books2;
int count =0;
s3 = "select * from Bookstore.Book";
PreparedStatement ps4 = connection.prepareStatement(s3);
ResultSet rs3 = s.executeQuery(s3);
while(rs3.next()){
	count++;
}
books = new String[count];
prices = new Double[count];
books2 = new String[count];
int count2 =0;

ResultSet rs4 = s.executeQuery(s3);
while(rs4.next()){
	books[count2] = rs4.getString("PictureURL");
	prices[count2] = Double.parseDouble(rs4.getString("Price"));
	books2[count2] = rs4.getString("BookName");
	count2++;
}

String st = "select * from Bookstore.Order where OrderID ='" + s5 +"'";
PreparedStatement ps1 = connection.prepareStatement(st);
ResultSet rs1 = s.executeQuery(st);
String url = "";
String ss ="";
String name ="";
String s1 = "";
String u = session.getAttribute("username").toString();
Double price = 0.00;
while(rs1.next()){
	url = rs1.getString("BookURL");
	ss = "select * from Bookstore.Book where PictureURL='" + url + "'";
	s1 = "insert into Bookstore.ShoppingCart (Customer_UserID, BookURL) values"
			+ "('" + u + "','"+ url + "')";
	PreparedStatement ps2;
	ps2 = connection.prepareStatement(s1);
	ps2.executeUpdate();
}
String s2 ="select * from Bookstore.ShoppingCart where Customer_UserID='" + u + "'";
PreparedStatement ps3;
ResultSet rs2 = s.executeQuery(s2);
	while(rs2.next()){
		name = rs2.getString("BookURL");
		for(int i = 0; i< books.length; i++){
			if(name.equals(books[i])){
				s1 = "update Bookstore.ShoppingCart set BookName ='" + books2[i] + "', BookPrice='" + prices[i].toString() +"'"
						+ "where BookURL='" + name + "'";
				ps3 = connection.prepareStatement(s1);
				ps3.executeUpdate();
			}
		}
	}

response.sendRedirect("ViewShoppingCart.jsp");
%>
</body>
</html>