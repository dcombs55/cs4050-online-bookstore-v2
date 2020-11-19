<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" %>
<!DOCTYPE html>
<html>
<head>
	<title>Edit Promotion</title>
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
			color:white;
		}
		input:hover{
			background-color: #DCDCDC;
		}
		main{
			width: 45%;
			margin: auto;
			padding: 2.5px;
		}
		.form-div{
			background: #111111;
			margin: 10px;
			border: 2px solid #AAAAAA;
		}
		h2, #userOptions{
			text-align: center;
		}#mainContent {
			margin: auto;
			padding: 2%;
			width: 50%;S
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
		div{
			width: 100%;
		}
		input[type=date], input[type=text], input[type=number], input[type=submit]{
			display: block;
			width: 100%;
			margin-left: 0px;
		}
		input{
			margin-top: 2px;
			height: 25px;
			padding-left: 7.5px;
			margin-bottom: 12.5px;
			margin-left: 15px;
		}
		form{
			margin-left: 10%;
			margin-right: 10%;
		}
		#server_errors{
			margin-left: 10%;
			margin-right: 10%;
			width: 80%;
			margin-top: 20px;
		}
		.required:after {
   			content:" *";
    		color: red;
  		}
  		.errors{
  			color:red;
  		}
		
	</style>
</head>
<body>

	<script type="text/javascript">
		
		function validateForm(){
			var promoType = document.editPromo.promoType;
			var promoCode = document.editPromo.promoCode;
			var promoAmt = document.editPromo.amount;
			var code_error = document.getElementById('code_error');
			var amount_error = document.getElementById("amount_error");
			code_error.innerHTML = "";
			amount_error.innerHTML = "";
			
			if(promoType.value=="perc" && promoAmt.value > 100){
				amount.style.border = "1px solid red";
				amount_error.innerHTML = "Percentage must be between 0-100!";
				return false;
			}
			if(promoCode.value.indexOf(" ") != -1 || promoCode.value.length < 3){
				promoCode.style.border = "1px solid red";
				code_error.innerHTML = "Invalid promo code!";
				return false;
			}
			
			return true;
		}
	</script>
	
	<h1>WASHINGTON T. BOOKSTORE</h1>
	<main>
	<div class="form-div">
		<div class="errors" id="server_errors">${errors}</div>
			<div id = "editPromotionsForm"><br>
				<h2>Edit Promotion</h2>
				<form name="editPromo" action="${pageContext.request.contextPath}/editPromo" onsubmit="return validateForm()" method="post">
					<label class="required">Promotion Type</label><br>
					<input type="radio" id="perc" name="promoType" value="perc" required>
					<label for="perc">Percentage</label><br>
					<input type="radio" id="amnt" name="promoType" value="amnt" required>
					<label for="amnt">Amount</label><br>
					
					<label for="promoCode">Promo Code</label>
					<input type="text" name="promoCode" placeholder="Enter promo code">
					<div class="errors" id="code_error"></div>
					
					<details>
						<summary>Requirements</summary>
						<p>Promo code must be at least three characters and must not contain any spaces.</p>
					</details>
					
					<label class="required">Amount</label>
					<input type="number" name="amount" id="amount" min="0" placeholder="Enter number">
					<div class="errors" id="amount_error"></div>
					
					<label class="required">Time Limit</label>
					<input type="date" name="timeLimit" id="timeLimit">
					
					<input type="checkbox" id="reset" name="reset" value="reset">
					<label for="reset">Reset Total Users</label>
					<br>
					<input type="submit" value="Edit Promotion"/>
					<input type="submit" value="Delete"/>
				</form>
			</div>
	
			<br>
			<div id="userOptions">
				<p><a style="color:#DCDCDC" href="admin_hp.html">Cancel</a></p>
			</div>
		</div>
	</main>

</body>
</html>