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
	
	<title>Manage Books</title>
	<style>
		body{
			font-family: Arial, Verdana, Helvetica;
			background: black;
		}
		#header {
			background-color: #BBBBBB;
			margin: 0px;
			padding: 4px;
		}
		.navbar{
			background-color: #BBBBBB;
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
			background-color: #A0A0A0;
			border: none;
		}
		.navbar .search button:hover {
			background-color: #B0B0B0;
		}
		h1{
			margin-left: 5px;
			color: #8A8A8A;
			text-shadow: -1px -1px 1px #fff, 1px 1px 1px #000;
			opacity: 0.3;
			font-size: 36px;
		}
		#book {
			height: 200px;
			width: 125px;
			margin: 10px;
			background: darkgrey;
		}
		#bookDisplay {
			width: 95%;
			margin-left: 75px;
			text-overflow: ellipsis;
		}
		#booktitle {
			font-weight: bold;
			color:white;
			text-decoration:none;
		}
		#author {
			color:#626262
		}
		#isbn {
			font-size: 10px;
			font-style: italic;
			color:grey;
		}
		a:hover{
			background-color: #ACACAC;
		}
	</style>
	<meta charset="UTF-8">
</head>
<body>
	
	<div id="header">
		<h1>MANAGE BOOKS</h1>
	</div>
	<main>
		<div class="navbar">
			<a href = "admin_hp.html">HOME</a>
			<div class ="search">
				<form action="/booksearch.php">	
					<input type="text" placeholder="Search for books..." name="search">
					<button type="submit">&#128269;</button>
				</form>
			</div>
		</div>
		<div id="feat">Featured &#9733</div>
		<table id="bookDisplay"> 
			<tr>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat1.jpg" width="125" height="200"></div></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat2.jpg" width="125" height="200"></div></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat3.jpg" width="125" height="200"></div></th>
			</tr>
			<tr id ="booktitle">
				<td><a id="booktitle" href = "edit_book.html">Book1</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book2</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book3</a></td>
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
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat4.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat5.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="feat6.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a id="booktitle" href = "edit_book.html">Book4</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book5</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book6</a></td>
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
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best1.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best2.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best3.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a id="booktitle" href = "edit_book.html">Book1</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book2</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book3</a></td>
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
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best4.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best5.jpg" width="125" height="200"></div></a></th>
				<th><a href = "edit_book.html"><div id="book"><img border="0" src="best6.jpg" width="125" height="200"></div></a></th>
			</tr>
			<tr id ="booktitle">
				<td><a id="booktitle" href = "edit_book.html">Book4</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book5</a></td>
				<td><a id="booktitle" href = "edit_book.html">Book6</a></td>
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
	<main>

</body>
</html>