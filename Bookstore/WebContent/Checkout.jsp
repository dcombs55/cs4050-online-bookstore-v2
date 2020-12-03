<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
 <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
   <%@page import ="java.io.*"%>
   <%@page import ="java.util.*"%>
    <%@page import ="javax.mail.*"%>
   <%@page import ="javax.mail.internet.*"%>
   <%@page import ="javax.activation.*"%>
    <%@page import ="javax.servlet.*"%>
     <%@page import ="javax.servlet.ServletException"%>
      <%@page import ="javax.servlet.annotation.WebServlet"%>
       <%@page import ="javax.servlet.http.*"%>
       <%@page import="bean.Encryption"%>
       
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
String s7 = "select * from Bookstore.Customer where UserID = '" + s5 + "'";
PreparedStatement ps6 = connection.prepareStatement(s7);
ResultSet rs5 = s.executeQuery(s7);
String emailAddress = "";
String firstName = "";
while(rs5.next()){
	emailAddress = rs5.getString("Email");
	firstName = rs5.getString("FirstName");
}
String s8 = "select * from Bookstore.Address where Customer_UserID = '" + s5 + "'";
PreparedStatement ps7 = connection.prepareStatement(s8);
ResultSet rs6 = s.executeQuery(s8);
String street = "";
String state = "";
String city = "";
while(rs6.next()){
	street = rs6.getString("Street");
	city = rs6.getString("City");
	state = rs6.getString("State");
}

String s9 = ("select * from Bookstore.CreditCard where UserID ='" + s5 +"'");
PreparedStatement ps8 = connection.prepareStatement(s9);
ResultSet rs7 = s.executeQuery(s9);
String lastFour1= "";
while(rs7.next()){
String fullCard = Encryption.decrypt(rs7.getString("CardNum"),s5);
lastFour1 = fullCard.substring(fullCard.length()-4);

}

String result;
String from = "washingtont.bookstore@gmail.com"; //change name to sendingEmail
String to = emailAddress; //change name to recipientEmail

Properties properties = new Properties();
properties.put("mail.smtp.auth", "true"); //sets if the email needs to be authenticated
properties.put("mail.smtp.starttls.enable", "true");
properties.put("mail.smtp.host", "smtp.gmail.com"); //your email host
properties.put("mail.smtp.port", "587"); //the port of your email

String myAccountEmail = "washingtont.bookstore@gmail.com";
String password1 = "softwareengr2";
//when using gMail you need to toggle it so that it allows less secure apps to access (fix this later)
//need to find a way to not include password credentials in code

Session mailSession = Session.getInstance(properties, new Authenticator() {
	@Override
	protected PasswordAuthentication getPasswordAuthentication() {
		return new PasswordAuthentication(myAccountEmail, password1);
	}
});
try{
	try { //sending confirmation email
        // Create a default MimeMessage object.
        MimeMessage message = new MimeMessage(mailSession);
        
        // Set From: header field of the header.
        message.setFrom(new InternetAddress(from));
        
        // Set To: header field of the header.
        message.addRecipient(Message.RecipientType.TO,
                                 new InternetAddress(to));
        // Set Subject: header field
        message.setSubject("Welcome to Washington T. Bookstore!");
        
        // Now set the actual message
        String messageContent = "<h1>Hi " + firstName + ", <h1>"
        		+ "<center><p>Your order is currently being processed and will be sent to you in 3-5 business days"
        		+ "<br/>This order will be sent to " + street + " " + city + " " + state
        		+ "<br/>The card ending in " +lastFour1 +" will be charged"
        		+ "<br/>Thank you for shopping with Washington T. Bookstore!"
        		+ "<br/>For more details, view your previous orders when logged in!";
        
        message.setContent(messageContent, "text/html");
        
        // Send message
        Transport.send(message);
        result = "Sent message successfully....";
     } catch (MessagingException mex) {
        mex.printStackTrace();
        result = "Error: unable to send message....";
     }
	


}catch (Exception e) {
    // TODO Auto-generated catch block
    e.printStackTrace();
}

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
String st = "select * from Bookstore.Order ORDER BY OrderID DESC LIMIT 1";
PreparedStatement ps9 = connection.prepareStatement(st);
ResultSet rs9 = s.executeQuery(st);
int count2 = 0;
while(rs9.next()){
	count2 = Integer.parseInt(rs9.getString("OrderID")) + 1;
}
String su = ("select * from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'");
PreparedStatement ps10 = connection.prepareStatement(su);
ResultSet rs10 = s.executeQuery(su);
String ss = "";
PreparedStatement ps11;
String c = "complete";
while(rs10.next()){
	ss = ("insert into Bookstore.Order values ('" + total + "','" + c + "','" + Integer.toString(count2) +"','" + s5 + "','"
			+ rs10.getString("BookURL") + "')");
	ps11 = connection.prepareStatement(ss);
	ps11.executeUpdate();
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
String fullCard = Encryption.decrypt(rs3.getString("CardNum"),s5);
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
<p> Your Order ID is: <%=count2%></p>
<b> Thank you for shopping with Washington T. Bookstore!</p>
<%
	String s6 = "delete from Bookstore.ShoppingCart where Customer_UserID ='" + s5 +"'";
	PreparedStatement ps5 = connection.prepareStatement(s6);
	ps5.executeUpdate();
%>
<a href = "Logincheck.jsp"><button type = "button">Return to Home</button><br><br></a>

</body>
</html>