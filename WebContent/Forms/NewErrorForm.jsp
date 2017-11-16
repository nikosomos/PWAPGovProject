<form action="CMForms" method="post" 
	class="newErrorForm form w3-container w3-card-4 w3-margin-left w3-margin-right"
	id="newErrorForm"
	style="display:none;">

	<input type="hidden" name="formName" value="newError">

	<div class="w3-panel w3-center w3-xxlarge">
		<b>Error Form</b>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Recovery Unit:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNE" value="GoA"
			checked> GoA
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNE" value="Muni">
			Muni
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNE" value="INAC">
			INAC
		</label>
		 <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNE" value="Other">
			Other
		</label>
		
		
		<input
			class="otherRecoveryUnit w3-input w3-hover-shadow w3-round-large w3-padding w3-margin-top"
			type="text" name="otherrecoveryUnitNE" style="display:none" placeholder="Please Name Recovery Unit">
		
		
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Program:</b> <select id="program"
		
			class="attachShowNR programs w3-input w3-select w3-round-large w3-padding w3-hover-shadow"
			name="program" required>
			<option value="" disabled selected>Choose Program</option>
		</select>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Municipality/ Ministry:</b> <input
			class="muniMini attachShowNE w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="muniMini" list="muniMiniList" required>
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Initiative/ Project #:</b> <input
			class="attachShowNE w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectNumber">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Type:</b> 
		<label class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="initialNE" name="reportType" 
			value="Initial" checked> Initial
		</label> 
		<label class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="interimNE" name="reportType"
			value="Interim"> Interim
		</label>
		<label class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="finalNE" name="reportType"
			value="Final"> Final
		</label>
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Error Encounter Date:</b> <input
			class="datePicker w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="encounterDate" required>
	</div>
	
	<div id="errorDiv">
	</div>
	
	<div class="queryPanel w3-btn w3-block w3-ripple w3-panel w3-card-4 w3-padding-16 w3-round-large w3-center w3-xxlarge" id="additionalError">
		<b>Additional Error</b>
	</div>
	
	<input type="hidden" id="errorNum" name="errorNum" value="0">

	<div class="w3-row">
		<input type="submit" class="submit w3-quarter w3-btn w3-ripple w3-right w3-round-large w3-padding-16"
			value="SUBMIT">
		<input type="reset" class="reset w3-quarter w3-btn w3-ripple w3-left w3-round-large w3-padding-16"
			value="RESET" onclick="window.scrollTo(0,0);">
	</div>
	
	
</form>

<script>

	var errAss = ["Request Errors", "Site Errors", "Applicant Changes"];
	var errType = ["Documents", "Natural Causes", "Applicant Hold", "GoA Ministry Hold", "Priority Hold", "Rejection", "Cancelled/ Withdrawn", "Redraft"];
	var errDoc = ["Progress Certificate(s)", "Completion Certificate", "Pre-Event Photo(s)", "Post-Event Photo(s)", "Pre & Post-Event Photos", 
	"Cost Summary Sheet", "Adherence to Building Codes", "Invoices - Not Provided", "Invoices - Not Complete", "Detail Form - Inaccurate", 
	"Detail Form - Incomplete", "Labor Timesheet(s)", "Equipment Schedule(s)", "Non-Standard Format(s)", "Tender Document(s)", "Insurance Policy", 
	"Enhancement(s) Cost Separation and Breakdown", "Procurement Policy", "Standard Contracting Procedure(s)", "Design Documents"];
	var errNat = ["Snow", "Ice", "Flooding", "Drought", "Wind", "Fire", "General Winter Conditions", "Extreme Winter Conditions", "Re-impacted Site"];
	var errApp = ["Construction Delayed - Weather", "Construction Halted", "Re-prioritization of I/P Schedule", "Availability of Applicant Staff", 
	              "Scope Change(s)", "Lack of Notification to Trigger Engineering", "Project Incomplete on Inspection", "Addition of Project(s) on Same Site"];
	var errGoa = ["Seasonality", "Complex Transportation Required"];
	var errPri = ["Disaster Occurrence Capacity Impact", "Business Operations"];
	var errRej = ["Coordinator Review", "Engineer Review", "Other Process"];
	var errCan = ["Cancelled", "Withdrawn"];
	var errRed = ["Redraft"];
	
	
	$(addError());
	
	$("#additionalError").click(function(){addError();});
	
	
	function addError(){


		var errorNum = $(".error").length+1;
		$("#errorNum").val(errorNum);
		$("#errorDiv").append(
			'<div class="error queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large" id="error'+ errorNum + '"> ' +
				'<button class="errorDelete w3-btn w3-ripple w3-right w3-round-large w3-padding-16" id="errorClose'+ errorNum + '"><b>X</b></button>' + 
				'<h3 class="w3-padding-bottom"><b class="errTitle">Error '+ errorNum + '</b></h3> ' +
				'<div class = "w3-panel"> ' +
					'<b>Error Association:</b> ' +
						'<div class="inDiv"><select ' +
						'class="errorAss w3-input w3-select w3-round-large w3-padding w3-hover-shadow" ' +
						'name="errorAss'+ errorNum + '" required> ' +
						'<option value="" disabled selected>Choose Association</option> ' +
						'</select></div> ' +
				'</div><div class = "w3-panel"> ' +
					'<b>Error Type:</b> ' +
						'<div class="inDiv"><select ' +
						'class="errorType w3-input w3-select w3-round-large w3-padding w3-hover-shadow" ' +
						'name="errorType'+ errorNum + '" required> ' +
						'<option value="" disabled selected>Choose Type</option> ' +
						'</select></div> ' +
				'</div><div class = "w3-panel"> ' +
					'<b>Error Specifics:</b> ' +
						'<div class="inDiv"><select ' +
						'class="errorSpec w3-input w3-select w3-round-large w3-padding w3-hover-shadow" ' +
						'name="errorSpec'+ errorNum + '" required> ' +
						'<option value="" disabled selected>Choose Specific</option> ' +
						'</select></div> ' +
				'</div><div class = "w3-panel"> ' +
					'<b>Error Comments:</b> ' +
						'<div class="inDiv"><textarea class="errorCom w3-input w3-hover-shadow w3-round-large w3-padding" ' +
						'name="errorComments'+ errorNum + '" rows="6" required placeholder="Please be specific"></textarea></div> ' +
				'</div> ' +
			'</div>'
		);
		
		$("#errorClose" + errorNum).click(function(){
			$(this).parent().remove();
			var errorNum = $(".error").length;
			$("#errorNum").val(errorNum);
			var errDelNum = parseInt($(this).attr("id").replace(/^\D+/g, ''));
			
			$(".error").each(function( index ){
				var errNum = parseInt($(this).attr("id").replace(/^\D+/g, ''));
				if (errNum > errDelNum){
					var newErrNum = errNum-1;
					$(this).attr("id", "error" + newErrNum);
					$(this).find("button").attr("id", "errorClose" + newErrNum);
					$(this).find(".errTitle").text("Error " + newErrNum);
					$(this).find(".errorAss").attr("name", "errorAss" + newErrNum);
					$(this).find(".errorType").attr("name", "errorType" + newErrNum);
					$(this).find(".errorSpec").attr("name", "errorSpec" + newErrNum);
					$(this).find(".errorCom").attr("name", "errorComments" + newErrNum);
				}
			})
			
			
		});
		
		$.each(errAss, function(index, value){
			$("#error" + errorNum).find(".errorAss").append($("<option></option>", {value:value, text:value}));
		});
		
		$.each(errType, function(index, value){
			$('#error' + errorNum).find(".errorType").append($("<option></option>", {value:value, text:value}));
		});
	
		$(".errorType").change(function(){
			var errName = $(this).attr("name");
			var errTypeVal = $(this).val();
			var errSpecName = "errorSpec" + errName.replace(/^\D+/g, '');
			var useArray;
			switch(errTypeVal) {
				case errType[0]:
					useArray = errDoc;
					break;
				case errType[1]:
					useArray = errNat;
					break;
				case errType[2]:
					useArray = errApp;
					break;
				case errType[3]:
					useArray = errGoa;
					break;
				case errType[4]:
					useArray = errPri;
					break;
				case errType[5]:
					useArray = errRej;
					break;
				case errType[6]:
					useArray = errCan;
					break;
				case errType[7]:
					useArray = errRed;
					break;
			}
			$("select[name="+ errSpecName +"]").find('option').remove().end().append('<option value="" disabled selected>Choose Specific</option>');
			$.each(useArray, function(index, value){
				$("select[name="+ errSpecName +"]").append($("<option></option>", {value:value, text:value}));
			});
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
		
	}
	

</script>