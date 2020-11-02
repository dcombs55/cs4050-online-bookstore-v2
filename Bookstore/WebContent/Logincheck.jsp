<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
 pageEncoding="ISO-8859-1"%>
    <%@page import="database.*"%>
        <!DOCTYPE html>
        <html>

        <head>
        <title>Washington T. Bookstore</title>
	<style>
		body{
			background-color: #000000;
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
		.navbar input[type=text] {
			padding: 10px;
			border: none;
		}
		.navbar .search {
			float: right;
			padding-top: 6px;
		}
		.navbar .search button {
			float: right;
			margin-right: 5px;
			cursor: pointer;
			height: 36px;
			width: 36px;
			background-color: #EFEFEF;
			border: none;
		}
		.navbar .search button:hover {
			background-color: #DFDFDF;
		}
		h1{
			color: #FFA21F;
			margin-left: 5px;
		}
		h3{
			color: #A35F00;
			margin-left: 5px;
		}
		#feat {
			background-image: linear-gradient(to left, rgba(255,149,5,0), rgba(255,149,5,1));
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
			color:#FFC370
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
			background-color: #FFA21F;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 150%);
  			color: white;
  			cursor: pointer;
  			display: inline-block;
  			font-size: 20px;
  			margin-top: 50px;
  			padding: 20px 40px;
  			text-align: center;
  			text-decoration: none;
		}
		.modal {
			  display: none; /* Hidden by default */
			  position: fixed; /* Stay in place */
			  z-index: 1; /* Sit on top */
			  padding-top: 100px; /* Location of the box */
			  left: 0;
			  top: 0;
			  width: 100%; /* Full width */
			  height: 100%; /* Full height */
			  overflow: auto; /* Enable scroll if needed */
			  background-color: rgb(0,0,0); /* Fallback color */
			  background-color: rgba(0,0,0,0.4); /* Black w/ opacity */
			}
			
		/* Modal Content */
		.modal-content {
		  background-color: #fefefe;
		  margin: auto;
		  padding: 20px;
		  border: 1px solid #888;
		  width: 80%;
		}
		
		/* The Close Button */
		.close {
		  color: #aaaaaa;
		  float: right;
		  font-size: 28px;
		  font-weight: bold;
		}
		
		.close:hover,
		.close:focus {
		  color: #000;
		  text-decoration: none;
		  cursor: pointer;
		}
	</style>
            <meta charset="ISO-8859-1">
        </head>

        <body>

            <jsp:useBean id="login" class="bean.LoginBean" />

            <jsp:setProperty property="*" name="login" />

            <%
  LoginDao loginDao = new LoginDao();
   boolean status = loginDao.validate(login);
   if (status) {
	   if(login.getUsername().equals("admin") && login.getPassword().equals("admin")){
		   response.sendRedirect("admin_hp.html");
	   }
	   else{
		   out.print("<h3>You have successfully logged in, " + login.getUsername() + "!</h3>");
	   }
   }
   else{
	   response.sendRedirect("invalid.jsp");
   }
 %>
 	
 <h1>WASHINGTON T. BOOKSTORE</h1>
	<main>
		<div class="navbar">
			<a class ="active" href = "homepage.html">HOME</a>
<<<<<<< HEAD
			<a href = "edit_profile.html">EDIT PROFILE</a>
=======
			<a href = "login.html">LOGIN</a>
			<a href = "registration.jsp">REGISTER</a>
			<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
>>>>>>> 541d1e89235d9701a0d1f7690ef85d10a44696ba
			<a href = "Logout.jsp">LOGOUT</a>
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
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book1</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book2</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book3</a></td>
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
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book4</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book5</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book6</a></td>
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
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book1</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book2</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book3</a></td>
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
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book4</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book5</a></td>
				<td><a style="text-decoration:none; color:#FF9505" href = "book_details.html">Book6</a></td>
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
		<div id="myModal" class="modal">
	
	  <!-- Modal content -->
	  <div class="modal-content">
	    <span class="close">&times;</span>
	    <p>Login successful! Welcome back!</p>
	</div>
	</main>
	<script>
	// Get the modal
	var modal = document.getElementById("myModal");
	
	// Get the <span> element that closes the modal
	var span = document.getElementsByClassName("close")[0];
	
	// When the user clicks on <span> (x), close the modal
	span.onclick = function() {
	  modal.style.display = "none";
	}
	
	// When the user clicks anywhere outside of the modal, close it
	window.onclick = function(event) {
	  if (event.target == modal) {
	    modal.style.display = "none";
	  }
	}
	</script>
        </body>

        </html>