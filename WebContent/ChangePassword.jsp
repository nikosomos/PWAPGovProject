<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Login</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Arsenal'>


<%@ page import = "java.util.*" %>

</head>

<style>

	html {
		overflow-y: scroll;
	}

	.body {
		background-color: rgba(230, 230, 230, 0.5);
		margin-top: 10%;	
		max-width: 500px; 
		font-family: 'Arsenal'; 
		font-size: 1.8em;
		line-height: 1.2;
	}
	
	.form {
		background-color: #aaaaaa;
	}
	
	.login {
		background-color: #2095F0;
		color: #ffffff;
		text-shadow: 2px 2px 5px #555555;
	}
	
	.login:hover {
		background-color: #1080E0;
	}
	
	.input {
		max-width: 350px;
		border: none;
	}
	
	.input:focus {
		outline: none;
	}
	

</style>

<body class="body w3-content">

	<h1 class="w3-container w3-center w3-padding"><b>Change Password</b></h1>

	<form action="ChangePassServlet" method="post"
	class="form w3-container w3-card-4 w3-margin-left w3-margin-right w3-padding-16 w3-middle w3-round-xlarge">
	
		<div class="w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-white">
			<input class="input" type="password" name="oldPass" placeholder="Old Password" maxlength="20">
		</div>
		
		<% Boolean oldPassErr = (Boolean)session.getAttribute("oldPassErr");
		if (oldPassErr) { %>
			<div class="error w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-xlarge w3-red w3-bold w3-center">
			Old Password is incorrect
			</div>
		<% } %>
	
		<div class="w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-white">
			<input class="input" type="password" name="newPass" placeholder="New Password" maxlength="20">
		</div>
		
		<div class="w3-section w3-row w3-section w3-round-large w3-padding w3-margin w3-white">
			<input class="input" type="password" name="confPass" placeholder="Confirm Password" maxlength="20">
		</div>
		
		
		<% Boolean newPassErr = (Boolean)session.getAttribute("newPassErr");
		if (newPassErr) { %>
			<div class="error w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-xlarge w3-red w3-bold w3-center">
				Password does not match
			</div>
		<% } %>

		
		<div class="w3-panel w3-padding w3-round-large">
			<button class="login w3-btn w3-block w3-ripple w3-round-large w3-padding-16">
				<b>CONFIRM</b>
			</button>
		</div>
	
	</form>

</body>

<script>

	$(".input").hover (
		function() {
			$(this).parent().addClass("w3-card-2");
		}, 
		function() {
			$(this).parent().removeClass("w3-card-2");
		}
	);
	

	$(".input").focusin (
		function() {
			$(".error").hide(300);
			$(this).parent().addClass("w3-card-4 w3-border");
		}
	);

	$(".input").blur (
		function() {
			$(this).parent().removeClass("w3-card-4 w3-border");
		}
	);

	


</script>

</html>