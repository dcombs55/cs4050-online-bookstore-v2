<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%@page import="database.*"%>
    <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
    <%@page import="java.sql.*"%>
        <!DOCTYPE html>
        <html>

        <head>
        	
		<%
		  	response.setHeader("Cache-Control","no-cache");
		  	response.setHeader("Cache-Control","no-store");
		 	response.setHeader("Pragma","no-cache");
		  	response.setDateHeader ("Expires", 0);
		  
			if(session.getAttribute("username") == null){
				response.sendRedirect("logout_error.html");
			}
		%>
        <title>Washington T. Bookstore</title>
	<style>
		body{
			background-color: #FFFFFF;
			font-family: Arial, Verdana, Helvetica;
		}
		.navbar{
			background-color: #FF9505;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 50%);
			color: #FFFFFF;
			margin: auto;
			margin-bottom: 50px;
			overflow: hidden;
		}
		.navbar a {
			float: left;
			display: block;
			text-align: center;
			padding: 15px 15px;
			text-decoration: none;
			color: white;
		}
		.navbar a.active {
			background-color: #FFC370;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 50%);
			color: black;
		}
		h1{
			color: #FFA21F;
			margin-left: 5px;
		}
		#feat {
			background-image: linear-gradient(to left, rgba(80,80,80,0), rgba(80,80,80,1));
			height: 25px;
			width: 200px;
			padding: 5px 10px 5px;
			margin: 15px;
			margin-left: 0px;
			font-size:20px;
			font-weight:bold
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
		}
		#author {
			color:#424242
		}
		#isbn {
			font-size: 10px;
			font-style: italic;
			color:grey;
		}
		a:hover{
			background-color: #FFC370;
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
		.catalog{
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
	</style>
            <meta charset="ISO-8859-1">
        </head>

        <body>

            <jsp:useBean id="login" class="bean.LoginBean" />

            <jsp:setProperty property="*" name="login" />
			
            <%
	            //HttpSession session1 = request.getSession();
	            //LoginDao loginDao = new LoginDao();
	            //if(loginDao.validateCustomer(login)){
	            	//String user = login.getUsername();
	            	//session1.setAttribute("username", user);
	            	//out.print("<h1>You have logged in successfully " + login.getUsername() + "!</h1>");
	            //}
			   	//else if(loginDao.validateAdmin(login)){
			 	   	//String user = login.getUsername();
			       	//session1.setAttribute("username", user);
					//response.sendRedirect("admin_hp.jsp");
				//}
			   	//else{
			   		//response.sendRedirect("invalid.jsp");
			   	//}
 			%>
 			${welcomeMessage}
 <h1>WASHINGTON T. BOOKSTORE</h1>
	<main>
		<div class="navbar">
			<a class ="active" href = "Logincheck.jsp">HOME</a>
			<a href = "edit_profile.jsp">EDIT PROFILE</a>
			<a href = "prev_orders.jsp">ORDER HISTORY</a>
			<a href = "Logout.jsp">LOGOUT</a>
			<div class ="search">
				<form action="/booksearch.php">	
					<input type="text" placeholder="Search for books..." name="search">
					<button formaction="search.html" type="submit">&#128269;</button>
				</form>
			</div>
		</div>
			 <%
Class.forName("com.mysql.jdbc.Driver");
Connection connection = DriverManager
.getConnection("jdbc:mysql://cs4050-online-bookstore.cmosf0873dbb.us-east-2.rds.amazonaws.com:3306/Bookstore?serverTimezone=UTC", "bookstoreAdmin", "Gogobookstore1");
Statement s = connection.createStatement();
String s1 = ("select * from Bookstore.Book where Archived = 'no' and Featured = 'yes'");
ResultSet rs = s.executeQuery(s1);
%>
		<div id="feat">Featured &#9733</div>
		<% 
while(rs.next()){
%>
			<input type="hidden" name="id" value="<%=rs.getString("BookID")%>">
			<div class= "row">
				<div class= "column">
					<tr id>
						<td><a href ="BookDetails.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></td>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				if(rs.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "BookDetails.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				}
				if(rs.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "BookDetails.jsp?u=<%=rs.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs.getString("IBSN")%></a></td>
					</tr>
				</div>
			</div>
			</input>
	<%
				}
	}
	%>
		
		<%
Statement s2 = connection.createStatement();
String s3 = ("select * from Bookstore.Book where Archived = 'no' and BestSeller = 'yes'");
ResultSet rs1 = s.executeQuery(s3);
%>

		<div id="feat" style="margin-top:60px">Best Sellers</div>
		<% 
		while(rs1.next()){
%>
			<input type="hidden" name="id" value="<%=rs1.getString("BookID")%>">
			<div class= "row">
				<div class= "column">
					<tr id>
						<td><a href ="BookDetails.jsp?u=<%=rs1.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs1.getString("PictureURL")%>" width="125" height="200"></div></td>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs1.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs1.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs1.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				if(rs1.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "BookDetails.jsp?u=<%=rs1.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs1.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs1.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs1.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs1.getString("IBSN")%></a></td>
					</tr>
				</div>
				<%
				}
				if(rs1.next()){
				%>
				<div class= "column">
					<tr>
						<th><a href = "BookDetails.jsp?u=<%=rs1.getString("BookID")%>"><div id="book"><img border="0" src="<%=rs1.getString("PictureURL")%>" width="125" height="200"></div></th>
					</tr>
					<tr id ="booktitle">
						<td><a style="text-decoration:none; color:black"><%=rs1.getString("BookName")%></a></td>
					</tr>
					<br>
					<tr id ="author">
						<td><i style="color:black">By: </i><a style="color:black"><%=rs1.getString("Author")%></a></td>
					</tr>
					<br>
					<tr id="isbn">
						<td><i style="color:black">ISBN: </i><a style="color:black"><%=rs1.getString("IBSN")%></a></td>
					</tr>
				</div>
			</div>
			</input>
	<%
				}
	}
	%>

		<div style="text-align:center;"><a href="AllBooksLogin.jsp" class="catalog">View Full Catalog</a></div>
	</main>

        </body>

        </html>