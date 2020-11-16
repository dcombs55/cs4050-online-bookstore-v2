<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page import="database.*"%>
    <%@page import="java.sql.*"%>
    
<!DOCTYPE html>
<html>
<head>
<title>Edit Book</title>
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
</head>
<body>
<header>
	<h1>Delete a Book!</h1>
</header>
<main>
	<form action="delete_book_update.jsp" method= "post">
<label>
			Please Enter the title of the book you would like to delete!
				<input type="text" name="Book_Name"/>
		</label>
		<input type="submit" value = "Delete Book"></input>
		<a href = "AllBooksAdmin.jsp"><button type = "button">Exit</button></a>
 </form>
 </main>
</body>
</html>