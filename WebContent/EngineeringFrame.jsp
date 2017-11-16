<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>


<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Engineering Inspection Forms</title>

<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel='stylesheet'
	href='https://fonts.googleapis.com/css?family=Arsenal'>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link href="Fine-Uploader/fine-uploader-new.css" rel="stylesheet">
    
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="Fine-Uploader/fine-uploader.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<%@ include file="Fine-Uploader/simple-thumbnails.html"%>


<%@ page import="myPackage1.Sql"%>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>

<%! List<String> programs;
	String[] muniMini;
	ResultSet projects;
	Iterator<String> it;
	String program;%>

<% 
	try {
		programs = Sql.getPrograms();
		//projects = Sql.getProjects();
		muniMini = Sql.getMuniMini();
	} catch (Exception e){
		e.printStackTrace();
	}
	
%>


<style>
	html {
		overflow-y: scroll;
	}
	
	.body {
		background-color: rgba(230, 230, 230, 0.5);
		margin-top: 2%;
		margin-bottom: 7%;
		max-width: 70%;
		font-family: 'Arsenal';
		font-size: 1.4em;
		line-height: 1.2;
	}
	
	.menu {
		width: 32%;
		margin-right: 2%;
		border-top-right-radius: 1.2em;
		border-top-left-radius: 1.2em;
	}
	
	.selectedButton {
		background-color: #aaaaaa;

	}
	
	.selectedButton:hover {
		background-color: #aaaaaa !important;
	}
	
	.menuButton {
		background-color: #cccccc;
		border-bottom: 0px;
	}
	
	.menuButton:hover {
		background-color: #999999 !important;
	}
	
	.menuButton:active {
		background-color: #888888 !important;
	}
	
	.form {
		border-bottom-right-radius: 1.2em;
		border-bottom-left-radius: 1.2em;
		padding-bottom: 20px;
		background-color: #aaaaaa;
	}
	
	.radioButton {
		margin-left: 10px;
	}
	
	.queryPanel {
		background-color: #99bbff;
	}
	
	.queryPanel:hover {
		background-color: #6699ee;
	}
	
	.activePanel {
		background-color: #4477ee;
	}
	
	.attach {
		background-color: #99bbff;
	}
	
	.attach:hover {
		background-color: #6699ee;
	}
	
	.attach:active {
		background-color: #4477ee;
	}
	
	.submit {
		background-color: #118811;
		color: #eeeeee;
		text-shadow: 2px 2px 5px #555555;
		font-weight: bold;
	}
	
	.submit:hover {
		background-color: #11dd11;
		color: #000000;
	}
	
	.reset {
		background-color: #881111;
		color: #eeeeee;
		text-shadow: 2px 2px 5px #555555;
		font-weight: bold;
	}
	
	.reset:hover {
		background-color: #dd1111;
		color: #000000;
	}
	
	#logout {
		background-color: #aaaaaa;
		position: fixed;
		top: 10px;
		left: 10px;
		width: 14%;
		white-space: normal;
	}
	
	.logout {
		background-color: #cccccc;
	}

	
</style>

</head>

<body class="body w3-content">

	<div class="w3-round-large w3-padding w3-left w3-center" id="logout">
		<div class="w3-padding"><%= request.getSession().getAttribute("firstName") %> <%= request.getSession().getAttribute("lastName") %></div>
		<div class="logout w3-bar-block w3-round-large w3-padding w3-center">
			<a href="Logout" class="w3-bar-item">Logout</a>
			<a href="ChangePassword" class="w3-bar-item">Change Password</a>
		</div>
	</div>
	
	
	<%@ include file="EngineeringHeaderandMenu.jsp"%>
	<%@ include file="Forms/ReportSubmissionForm.jsp"%>
	<%@ include file="Forms/UpdateRequestForm.jsp"%>
	<%@ include file="Forms/NewErrorForm.jsp"%>

	<script>
	
		$(function(){
			
			$(".logout").hide();
			
			<%	it = programs.iterator();
				while (it.hasNext()) {
					program = it.next();
			%>
			
			$(".programs").append($("<option></option>").attr("value", "<%= program %>").text("<%= program %>"));
			
			<%}%>
			
			var muniMini = new Array();
			<% for (int i = 0; i < muniMini.length; i++){ %>
			muniMini[<%= i %>] = "<%= muniMini[i]%>";
			<% } %>
			
			$(".muniMini").autocomplete({
				source: function(request, response){
					var results = $.ui.autocomplete.filter(muniMini, request.term);
					response(results.slice(0,5));
				},
				autoFocus: true,
				delay: 0
			});
			
			$(".datePicker").datepicker({
				appendText: "(dd-mm-yyyy)",
				changeMonth: true,
				changeYear: true,
				closeText: "Close",
				constrainInput: true,
				currentText: "Now",
				dateFormat: "dd-mm-yy",
				showAnim: "slideDown"
			});
		});
	
		$("#logout").hover(function(){
			$(".logout").show();
		}, function() {
			$(".logout").hide();
		});
	
		$(".menu").click(function() {
			if (!$(this).hasClass("selectedButton")){
				$(".otherRecoveryUnit").hide();
				$(".menu").addClass("menuButton");
				$(".selectedButton").removeClass("selectedButton");
				$(this).removeClass("menuButton");
				$(this).addClass("selectedButton");
				var formName = "#" + $(this).attr('id') + "Form";
				$(".form").hide();
				$(".form").trigger("reset");
				$(formName).show();
				$(formName).animate({backgroundColor: "#888888"}, 5);
				$(formName).animate({backgroundColor: "#aaaaaa"}, 600);
			}
		});

		$(".w3-input").focusin(function() {
			if ($(this).parent().hasClass("inDiv")) {
				$(this).parent().parent().parent().removeClass("queryPanel");
				$(this).parent().parent().parent().addClass("activePanel");
			} else {
				$(this).parent().removeClass("queryPanel");
				$(this).parent().addClass("activePanel");
			}
		});

		$(".w3-input").blur(function() {
			if ($(this).parent().hasClass("inDiv")) {
				$(this).parent().parent().parent().addClass("queryPanel");
				$(this).parent().parent().parent().removeClass("activePanel");
			} else {
				$(this).parent().addClass("queryPanel");
				$(this).parent().removeClass("activePanel");
			}
		});
		
		$('.recoveryUnit').change(
		    function(){

		        if ($(this).val() == 'Other') {
					$("input[name='other" + $(this).attr('name') + "'").show();
		        }
		        else {

		            // if it's the 'No' button removes the 'appended' element.
		        	$("input[name='other" + $(this).attr('name') + "'").hide();
		        }
		});

	</script>

</body>

</html>


