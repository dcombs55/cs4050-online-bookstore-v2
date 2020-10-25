%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%@page import="database.*"%>
        <!DOCTYPE html>
        <html>

        <head>
            <meta charset="ISO-8859-1">
            <title>Insert title here</title>
        </head>

        <body>

            <jsp:useBean id="login" class="bean.LoginBean" />

            <jsp:setProperty property="*" name="login" />

            <%
  LoginDao loginDao = new LoginDao();
   boolean status = loginDao.validate(login);
   if (status) {
           out.print("<h1>You have logged in successfully" + login.getUsername() + "</h1>");
   }
   else{
	   out.print("<h1> Login unsuccessful. Please try again!");
   }
 %>
 <h1>WASHINGTON T. BOOKSTORE</h1>
	<main>
		<div class="navbar">
			<a class ="active" href = "homepage.html">HOME</a>
			<a href = "login.html">LOGIN</a>
			<a href = "registration.html">REGISTER</a>
			<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
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
	<main>

        </body>

        </html>