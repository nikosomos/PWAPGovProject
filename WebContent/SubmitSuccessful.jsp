<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Submitted</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel='stylesheet' href='https://fonts.googleapis.com/css?family=Arsenal'>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
	
	.back {
		background-color: #2095F0;
		color: #ffffff;
		text-shadow: 2px 2px 5px #555555;
	}
	
	.back:hover {
		background-color: #1080E0;
	}
</style>

<body class="body w3-content">

	<h1 class="w3-container w3-center w3-padding"><b>Successfully Submitted</b></h1>
	
	<form action="UserTypeFilter" method="POST">
		<div class="w3-panel w3-padding w3-round-large">
			<button class="back w3-btn w3-block w3-ripple w3-round-large w3-padding-16" >
				<b>Return to Forms</b>
			</button>
		</div>
	</form>

</body>
</html>