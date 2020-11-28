<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%@page import="database.*"%>
    <%@page import="java.util.*"%>
    <%@page import="javax.*"%>
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
			<a class ="active" href = "homepage.html">HOME</a>
			<a href = "edit_profile.jsp">EDIT PROFILE</a>
			<a href = "Logout.jsp" <%session.removeAttribute("username");%>>LOGOUT</a>
			<div class ="search">
				<form action="/booksearch.php">	
					<input type="text" placeholder="Search for books..." name="search">
					<button formaction="search.html" type="submit">&#128269;</button>
				</form>
			</div>
		</div>
		<div id="feat">Featured &#9733</div>
		<table id="bookDisplay"> 
			<tr>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat1.jpg" width="125" height="200"></div></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat2.jpg" width="125" height="200"></div></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat3.jpg" width="125" height="200"></div></th>
			</tr>
			<tr id ="booktitle">
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book1</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book2</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book3</a></td>
			</tr>
			<tr id ="author">
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
			</tr>
			<tr id="isbn">
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
			</tr>
			<tr>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat4.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat5.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="feat6.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book4</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book5</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book6</a></td>
			</tr>
			<tr id ="author">
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
			</tr>
			<tr id="isbn">
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
			</tr>
		</table>


		<div id="feat" style="margin-top:60px">Best Sellers</div>
		<table id="bookDisplay"> 
			<tr>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best1.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best2.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best3.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book1</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book2</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book3</a></td>
			</tr>
			<tr id ="author">
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
			</tr>
			<tr id="isbn">
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
			</tr>
			<tr>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best4.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best5.jpg" width="125" height="200"></div></a></th>
				<th><a href = "book_details.html"><div id="book"><img border="0" src="best6.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book4</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book5</a></td>
				<td><a style="text-decoration:none; color:black" href = "book_details.html">Book6</a></td>
			</tr>
			<tr id ="author">
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
				<td><i>By</i> Author</td>
			</tr>
			<tr id="isbn">
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
				<td>ISBN: xxx-x-xx-xxxxxx-x</td>
			</tr>
		</table>

		<div style="text-align:center;"><a href="#" class="catalog">View Full Catalog</a></div>
	</main>

        </body>

        </html>