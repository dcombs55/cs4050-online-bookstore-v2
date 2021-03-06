<%@page language="java" import="java.util.*" %>
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
	
	<title>Manage Promotions</title>
	<style>
		h1 {
			color:white;
			text-align:center;
			margin:50px;
		}
		body{
			font-family: Arial, Verdana, Helvetica;
			background-color: #030303;
			background-image: linear-gradient(to right, rgba(40,40,40,0), rgba(40,40,40,0.25));
		}
		input:hover{
			background-color: #DCDCDC;
		}
		#mainContent {
			margin: auto;
			padding: 2%;
			background: black;
			width: 50%;
			text-align:center;
			border: 5px solid #202020;
		}
		.button{
			background-color: #FFCC10;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0));
  			color: black;
  			cursor: pointer;
  			font-size: 15px;
  			padding: 10px 25px;
  			text-align: center;
  			text-decoration: none;
			width: 145px;
			margin-bottom: 20px;
		}
		.signout {
			background-color: #FF1030;
			background-image: linear-gradient(to top, rgba(0,0,0,0.5), rgba(0,0,0,0) 150%);
  			color: black;
  			cursor: pointer;
  			display: inline-block;
  			font-size: 15px;
  			padding: 10px 25px;
  			text-align: center;
  			text-decoration: none;
			width: 145px;
		}
		table{
			color:white;
			margin-bottom: 20px;
			width: 100%;
		}
	</style>
	<meta charset="UTF-8">
</head>
<body>
	
	<main>
	<h1>Manage Promotions</h1>
		<form id="mainContent" action="${pageContext.request.contextPath}/manage-promotions" method="post">
			<div align="center">
		        <table border="1">
		            <tr>
		                <th></th>
		                <th>Promotion ID</th>
		                <th>Type</th>
		                <th>Code</th>
		                <th>Amount</th>
		                <th>Start Date</th>
		                <th>End Date</th>
		                <th>Total Users</th>
		            </tr>
		            <%
		            	HashMap<String, List<String>> returnData = (HashMap<String, List<String>>)request.getAttribute("returnData");
		            	List<String> promoID = returnData.get("PromoID");
		            	List<String> promoType = returnData.get("PromoType");
		            	List<String> promoCode = returnData.get("PromoCode");
		            	List<String> promoAmo = returnData.get("PromoAmount");
		            	List<String> promoSD = returnData.get("StartDate");
		            	List<String> promoED = returnData.get("EndDate");
		            	List<String> totalUsers = returnData.get("TotalUsers");
		            	
		            	for(int i = 0; i < promoID.size(); i++){
		            %>
		            <tr>
		            	<td><input type="checkbox" name="promotion" value=<%=promoID.get(i)%>></td>
		            	<td><%=promoID.get(i)%></td>
		            	<td><%=promoType.get(i)%></td>
		            	<td><%=promoCode.get(i)%></td>
		            	<td><%=promoAmo.get(i)%></td>
		            	<td><%=promoSD.get(i)%></td>
		            	<td><%=promoED.get(i)%></td>
		            	<td><%=totalUsers.get(i)%></td>
		            </tr>
		            <%} %>
		        </table>
		    </div>
		   	<input type="submit" name="manage-action" formaction="add_promotion.jsp" value="Add" class="button">
		   	<input type="submit" name="manage-action" formaction="${pageContext.request.contextPath}/manage-promotions" value="Delete" class="button">
			<input type="submit" name="manage-action" formaction="${pageContext.request.contextPath}/promotions-list2" value="Edit" class="button"><br/>
			<input type="submit" formaction="admin_hp.jsp" value="Back" class="button">
			<input type="submit" formaction="${pageContext.request.contextPath}/sign-out" value="Sign Out" class="signout">
	    </form>
	</main>

</body>
</html>