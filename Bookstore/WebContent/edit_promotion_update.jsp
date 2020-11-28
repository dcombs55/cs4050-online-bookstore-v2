<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
    <%@page import="java.util.Scanner" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	  
	if(session.getAttribute("adminUsername") == null){
		response.sendRedirect("logout_error.html");
	}
	%>
<title>Insert title here</title>
</head>

<body>
<%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
String promoType = request.getParameter("promoType");
String amount = request.getParameter("amount");
String startDate = request.getParameter("startDate");
String endDate = request.getParameter("endDate");
String reset = request.getParameter("reset");
String s1 = "update Bookstore.Promotion set ";
int prT = 0, amt = 0, stD = 0, enD = 0, res = 0; // These are the index values of each of the parameters
if(promoType != null){
	s1 = s1.concat("PromoType=?, ");
	prT++;
	amt++;
	stD++;
	enD++;
	res++;
}
if(amount != null){
	s1 = s1.concat("PromoAmount=?, ");
	amt++;
	stD++;
	enD++;
	res++;
}
else amt = 0;
if(startDate != null){
	s1 = s1.concat("StartDate=?, ");
	stD++;
	enD++;
	res++;
}
else stD = 0;
if(endDate != null){
	s1 = s1.concat("EndDate=?, ");
	enD++;
	res++;
}
else enD = 0;
if(reset != null){
	s1 = s1.concat("TotalUsers=?, ");
	res++;
}
else res = 0;
if(s1.lastIndexOf(",") != -1) {
	s1 = s1.substring(0,s1.lastIndexOf(",")).trim();
	s1 = s1.concat(" where PromoID=?");
}
else s1 = "";
if(s1 != "") {
	PreparedStatement ps1 = connection.prepareStatement(s1);
	if(prT > 0)
		if(promoType == "amnt")
			ps1.setInt(prT, 1);
		else ps1.setInt(prT, 2);
	if(amt > 0) {
		Scanner sc = new Scanner(amount);
		double amountDubb = sc.nextDouble();
		sc.close();
		if(promoType == "perc" && amountDubb > 100) amountDubb = 100; // Any greater value for a percentage is a reverse payment
		ps1.setDouble(amt, amountDubb);
	}
	if(stD > 0)
		ps1.setString(stD, startDate);
	if(enD > 0)
		ps1.setString(enD, endDate);
	if(res > 0)
		ps1.setInt(res,0);
	ps1.executeUpdate();
}
response.sendRedirect("edit_promotion.jsp");
%>
</body>
</html>