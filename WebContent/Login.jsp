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
	}
	
	.loginCard {
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

	<h1 class="w3-container w3-center w3-padding"><b>PWAP Login</b></h1>

	<form action="LoginServlet" method="post"
	class="loginCard w3-container w3-card-4 w3-margin-left w3-margin-right w3-padding-16 w3-middle w3-round-xlarge">
	
		<div class="w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-white">
			<div class="w3-col" style="width: 30px; padding: 9px 0 0 1px">
				<i class="w3-xlarge fa fa-user"></i>
			</div>
			<div class="w3-rest">
				<input class="input" type="text" name="username" placeholder="Username" maxlength="20">
			</div>
		</div>
		
		<div class="w3-section w3-row w3-section w3-round-large w3-padding w3-margin w3-white">
			<div class="w3-col" style="width: 30px; padding: 11px 0 0 2px">
				<i class="w3-xlarge fa fa-lock"></i>
			</div>
			<div class="w3-rest">
				<input class="input" type="password" name="password" placeholder="Password" maxlength="20">
			</div>
		</div>
		
		
		<% Boolean err = (Boolean)session.getAttribute("userError"); %>
		<% if (err) { %>
			<div class="error w3-panel w3-row w3-section w3-round-large w3-padding w3-margin w3-xlarge w3-red w3-bold w3-center">
			Username or Password is incorrect
			</div>
		<% } 
		session.setAttribute("userError", false);%>

		
		<div class="w3-panel w3-padding w3-round-large">
			<button class="login w3-btn w3-block w3-ripple w3-round-large w3-padding-16">
				<b>LOGIN</b>
			</button>
		</div>
	
	</form>

<script>


$(document).ready(function(){
	$(".input").hover (
		function() {
			$(this).parent().parent().addClass("w3-card-2");
		}, 
		function() {
			$(this).parent().parent().removeClass("w3-card-2");
		}
	);
	

	$(".input").focusin (
		function() {
			$(".error").hide(300);
			$(this).parent().parent().addClass("w3-card-4 w3-border");
		}
	);

	$(".input").blur (
		function() {
			$(this).parent().parent().removeClass("w3-card-4 w3-border");
		}
	);

	
	$("input[name=password]").focusin(
		function(){
			$(".fa-lock").addClass("fa-unlock-alt").removeClass("fa-lock");
		}
	);
	
	$("input[name=password]").blur(
		function(){
			$(".fa-unlock-alt").addClass("fa-lock").removeClass("fa-unlock-alt");
		}
	);
});	


</script>

</body>

</html>