<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<title>Add Book</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	header {
  		text-align: center;
  		font-size: 35px;
  		height: 25px;
  		color: #FFFFFF;
  		margin-bottom: 75px;
	}
	body{
		font-family:verdana;
		background-color: #030303;
		background-image: linear-gradient(to right, rgba(40,40,40,0), rgba(40,40,40,0.25));
	}
	main{
		width: 45%;
		margin: auto;
		background-color: #FC2C00;
		padding: 2.5px;
		padding-top:20px;
	}
	label, input{
		display: block;
	}
	input{
		margin-top: 2.5px;
		width: 100%;
		height: 25px;
		padding-left: 7.5px;
	}
	label{
		margin-bottom: 12.5px;
	}
	form{
		margin-left: 10%;
		margin-right: 10%;
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
</style>
</head>
<body>
<header>
	<h1>Add a new Book!</h1>
</header>
<main>
	<form action="add_book_update.jsp" method= "post">
		<label>
			Book Name
				<input type="text" name="Book_Name"/>
		</label>
		<label>
			IBSN
				<input type="text" name="ibsn"/>
		</label>
		<label>
			Author
			<input type="text" name="author"/>
		</label>
		<label>
		Price
		<input type="text" name="price"/>
		</label>
		<label>
		Description
		<input type="text" name="desc">
		</label>
		<label>
		Copies Left
		<input type="text" name="copies">
		</label>
		<label>
			URL
				<input type="text" name="bookURL">
		</label>
	<input type="submit" value = "Add Book"></input>
	<a href = "AllBooksAdmin.jsp"><button type = "button">Exit</button></a>
	</form>
</main>
</body>
</html>