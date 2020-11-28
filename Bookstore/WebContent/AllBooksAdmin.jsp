<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
	<%
	response.setHeader("Cache-Control","no-cache");
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader ("Expires", 0);
	  
	if(session.getAttribute("adminUsername") == null){
		response.sendRedirect("logout_error.html");
	}
	%>
	
	<title>Admin View</title>
	<style>
		body{
			font-family: Arial, Verdana, Helvetica;
			background-color: #030303;
			background-image: linear-gradient(to left, rgba(80,80,80,0), rgba(80,80,80,1));
		}
		h1{
			margin-left: 5px;
			color: #FFFFFF;
		}
		#feat {
			background-image: linear-gradient(to top, rgba(65,40,255,0.5), rgba(65,40,255,0) 150%);
			height: 25px;
			width: 200px;
			padding: 5px 10px 5px;
			margin: 15px;
			margin-left: 0px;
			font-size:20px;
			font-weight:bold;
			color: #FFFFFF;
		}
		#book {
			height: 200px;
			width: 125px;
			margin: 10px;
			background: black;
		}
		#bookDisplay {
			width: 95%;
			margin-left: 75px;
			text-overflow: ellipsis;
		}
		#booktitle {
			font-weight: bold;
			color:#FFFFFF;
		}
		#author {
			color:#FFFFFF;
		}
		#isbn {
			font-size: 10px;
			font-style: italic;
			color:white;
			margin-left: 75px;
			text-overflow: ellipsis;
		}
		a:hover{
			background-color: #DCDCDC;
		}
  		.column {
			float: left;
			padding-left: 35px;
			padding-bottom: 5px;
		}
		.row::after {
			content: "";
			clear: both;
			display: table;
		}
		.back{
			background-color: black;
			background-image: linear-gradient(to top, rgba(65,40,255,0.5), rgba(65,40,255,0) 150%);
  			color: white;
  			cursor: pointer;
  			display: inline-block;
  			font-size: 20px;
  			margin-top: 50px;
  			padding: 20px 40px;
  			text-align: center;
  			text-decoration: none;
		}
		}
	</style>
	<meta charset="UTF-8">
</head>
<body>	
	<h1>WASHINGTON T. BOOKSTORE</h1>
	<main>
	 <%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
Statement s = connection.createStatement();
String s1 = ("select * from Bookstore.Book where Archived = 'no'");
ResultSet rs = s.executeQuery(s1);
%>
<div id="feat">All Books</div>

		<% 
while(rs.next()){
%>
			<input type="hidden" name="id" value="<%=rs.getString("BookID")%>">
			<div class= "row">
				<div class= "column">
					<tr id>
						<td><a href ="EditBook.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></td>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:white"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:white">By: </i><a style="color:white"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:white">ISBN: </i><a style="color:white"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				if(rs.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "EditBook.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:white"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:white">By: </i><a style="color:white"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:white">ISBN: </i><a style="color:white"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				}
				if(rs.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "EditBook.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:white"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:white">By: </i><a style="color:white"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:white">ISBN: </i><a style="color:white"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
			</div>
			</input>
	<%
				}
	}
	%>
	<div style="text-align:center;"><a href="admin_hp.jsp" class="back">Go Back</a></div>
	<div style="text-align:center;"><a href="AddBook.jsp" class="back">Add Book</a></div>
	<div style="text-align:center;"><a href="DeleteBook.jsp" class="back">Delete Book</a></div>
	<main>


</html>