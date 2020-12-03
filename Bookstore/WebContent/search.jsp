<%@page language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<title>Search Results</title>
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
		main{
			width: 100%;
		}
		#results {
			background-image: linear-gradient(to left, rgba(255,149,5,0), rgba(255,149,5,1));
			height: 25px;
			width: 300px;
			padding: 5px 10px 5px;
			margin: 15px;
			margin-left: 0px;
			font-size:20px;
			font-weight:bold;
			color: black;
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
			color:#BF0600;
		}
		#isbn {
			font-size: 10px;
			font-style: italic;
			color:grey;
		}
		#sort{
			float: right;
			margin-right: 30px;
		}
		#resultsSection{
			display: inline-block;
			width: 85%;
			padding-left: 20px;
		}
		a:hover{
			background-color: #FFC370;
		}
		.nextPage{
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
		h3{
			border-bottom-style: solid;
		}
	</style>
	<meta charset="UTF-8">
</head>
<body>
	
	<h1>WASHINGTON T. BOOKSTORE</h1>

	<div class="navbar">
		<a href = "homepage.html">HOME</a>
		<a href = "login.jsp">LOGIN</a>
		<a href = "registration.jsp">REGISTER</a>
		<a href = "admin_hp.html">*DEMO ADMIN ACCESS*</a>
		<div class ="search">
			<form action="/booksearch.php">	
				<input type="text" placeholder="Search for books..." name="search">
				<button formaction="search.jsp" type="submit">&#128269;</button>
			</form>
		</div>
	</div>
		
	<main>
		
		<div id="resultsSection">
			<div id="sort">
				<label for="sort">Sort by: </label>
				<select name="sort" id="sort">
					<option value="low-high">Price: Low to High</option>
					<option value="high-low">Price: High to Low</option>
					<option value="AtoZ">Book Title (A to Z)</option>
					<option value="ZtoA">Book Title (Z to A)</option>
				</select>
			</div>
			
			<div id="results">Search for </div>
			<form>
				<label>Book Title</label>
				<input type="text" value="Book Title">
				
				<label>by</label>
				<input type="text" value="Author">
				
				<label>Subject</label>
				<input type="text" value="Subject">
				
				<label>ISBN</label>
				<input type="text" value="ISBN">	
				
				<input type="submit" value="Submit">	
			</form>
			<br>
			<%
	           	HashMap<String, List<String>> returnData = (HashMap<String, List<String>>)request.getAttribute("returnData");
				if(returnData == null){
					request.getRequestDispatcher("book-search").forward(request, response);
				}else{
					List<String> bookIDData = returnData.get("BookID");
		           	List<String> bookNameData = returnData.get("BookName");
		           	List<String> authorData = returnData.get("Author");
		           	List<String> isbnData = returnData.get("ISBN");
		           	List<String> pictureURLData = returnData.get("PictureURL");
	           	
		           	for(int i = 0; i < bookIDData.size(); i++){
		           		if(i == 0){ %>
		           			<div class= "row">
		           		<%} else if (i % 3 == 0){ %>
		           			</div>
		           			<div class = "row">
		           		<%}%>
			           		<div class= "column">
								<tr id>
									<td><a href ="BookDetails.jsp?u=<%=bookIDData.get(i)%>"><div id="book"><img border="0" src="<%=pictureURLData.get(i)%>" width="125" height="200"></div></td>
								</tr>
								<tr id ="booktitle">
									<td><a style="text-decoration:none; color:black"><%=bookNameData.get(i)%></a></td>
								</tr>
								<br>
								<tr id ="author">
									<td><i style="color:black">By: </i><a style="color:black"><%=authorData.get(i)%></a></td>
								</tr>
								<br>
								<tr id="isbn">
									<td><i style="color:black">ISBN: </i><a style="color:black"><%=isbnData.get(i)%></a></td>
								</tr>
							</div>
		           		<%
		           		if(i+1 == bookIDData.size()){ %>
		           			</div>
		           		<%}
		           	}
				}
		   	%>
			
			<div style="text-align:center; margin-bottom: 10px"><a href="#" class="nextPage">Next Page</a></div>
		</div>
		
	<main>

</body>
</html>