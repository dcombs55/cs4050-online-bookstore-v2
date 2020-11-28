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
	
	<title>Manage Customers</title>
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
	<h1>Manage Customers</h1>
		<form id="mainContent" action="${pageContext.request.contextPath}/manage-employees" method="post">
			<div align="center">
		        <table border="1">
		            <tr>
		                <th></th>
		                <th>Username</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Email Address</th>
		                <th>Phone Number</th>
		                <th>Account Status</th>
		                <th>Account Type</th>
		            </tr>
		            <%
		            	HashMap<String, List<String>> returnData = (HashMap<String, List<String>>)request.getAttribute("returnData");
		            	List<String> userName = returnData.get("UserID");
		            	List<String> firstName = returnData.get("FirstName");
		            	List<String> lastName = returnData.get("LastName");
		            	List<String> email = returnData.get("Email");
		            	List<String> phoneNumber = returnData.get("PhoneNumber");
		            	List<String> accountState = returnData.get("AccountState");
		            	List<String> accountType = returnData.get("AccountType");
		            	
		            	for(int i = 0; i < userName.size(); i++){
		            %>
		            <tr>
		            	<td><input type="checkbox" name="customer" value=<%=userName.get(i)%>></td>
		            	<td><%=userName.get(i)%></td>
		            	<td><%=firstName.get(i)%></td>
		            	<td><%=lastName.get(i)%></td>
		            	<td><%=email.get(i)%></td>
		            	<td><%=phoneNumber.get(i)%></td>
		            	<td><%=accountState.get(i)%></td>
		            	<td><%=accountType.get(i)%></td>
		            </tr>
		            <%} %>
		        </table>
		    </div>
		   	<input type="submit" name="manage-action" formaction="${pageContext.request.contextPath}/manage-customers" value="Suspend" class="button">
		   	<input type="submit" name="manage-action" formaction="${pageContext.request.contextPath}/manage-customers" value="Unsuspend" class="button">
			<input type="submit" name="manage-action" formaction="${pageContext.request.contextPath}/manage-customers" value="Promote" class="button"><br/>
			<input type="submit" formaction="manage_users.jsp" value="Back" class="button">
			<input type="submit" formaction="${pageContext.request.contextPath}/sign-out" value="Sign Out" class="signout">
	    </form>
	</main>

</body>
</html>