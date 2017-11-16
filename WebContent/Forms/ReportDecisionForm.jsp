<form action="CMForms" method="post"
	class="reportDecisionForm form w3-container w3-card-4 w3-margin-left w3-margin-right"
	id="reportDecisionForm"
	style="display:none;">

	<input type="hidden" name="formName" value="reportDecision">

	<div class="w3-panel w3-center w3-xxlarge">
		<b>Report Decision Form</b>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Recovery Unit:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRD" value="GoA"
			checked> GoA
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRD" value="Muni">
			Muni
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRD" value="INAC">
			INAC
		</label>
		 <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRD" value="Other">
			Other
		</label>
		
		
		<input
			class="otherRecoveryUnit w3-input w3-hover-shadow w3-round-large w3-padding w3-margin-top"
			type="text" name="otherrecoveryUnitRD" style="display:none" placeholder="Please Name Recovery Unit">
		
		
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
			class="muniMini attachShowNR w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="muniMini" list="muniMiniList" required>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Initiative/ Project #:</b> <input
			class="w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectNumber">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Type:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="NRinitial" name="reportType"
			value="Initial" checked> Initial
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="NRinterim" name="reportType"
			value="Interim"> Interim
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="NRfinal" name="reportType"
			value="Final"> Final
		</label>
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Decision:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="decision w3-radio" type="radio" name="reportDecision"
			value="Accepted" checked> Accepted
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="decision w3-radio" type="radio"name="reportDecision"
			value="Redraft"> Redraft
		</label>
	</div>
	
	<div class="redraftComments queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Redraft Comments (Please explain why a redraft is required):</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="redraftComments" rows="4"></textarea>
	</div>

	<div class="w3-row">
		<input type="submit" class="submit w3-quarter w3-btn w3-ripple w3-right w3-round-large w3-padding-16"
			value="SUBMIT">
		<input type="reset" class="reset w3-quarter w3-btn w3-ripple w3-left w3-round-large w3-padding-16"
			value="RESET" onclick="window.scrollTo(0,0);">
	</div>

</form>

<script>

$(function(){
	$(".redraftComments").hide();
});

$(".decision").change(function(){
	var val = $(this).val();
	if (val == "Redraft"){
		$(".redraftComments").show();
	} else {
		$(".redraftComments").hide();
	}
});

</script>