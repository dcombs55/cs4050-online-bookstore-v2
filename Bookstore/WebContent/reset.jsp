<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Create An Account</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<style>
	header {
  		text-align: center;
  		font-size: 35px;
  		height: 25px;
  		color: #000000;
  		margin-bottom: 75px;
	}
	body{
		background-image: url('book.jpg');
		font-family:verdana;
	}
	main{
		width: 45%;
		margin: auto;
		background-color: #DCDCDC;
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
	<h1>Reset Your Password!</h1>
</header>
<main>
	<form>
		<label>
			Username
				<input type="text" placeholder="Enter existing username">
		</label>
		<label>
			Change password (New password must not be same as old password)
				<input type="password">
		</label>
		<details>
					<summary>Requirements</summary>
					<p>Password must be at least 8 characters long and include at least one uppercase
					letter, lower case letter and number.</p>
				</details>
		<label>
			Confirm new password (must match new password)
				<input type="password">
		</label>
	</form>
	<button>Save Changes</button>
	<a href = "login.html"><button type = "button">Cancel</button></a>

</main>
</body>
</html>