
<form action="CMForms" method="post"
	class="updateRequestForm form w3-container w3-card-4 w3-margin-left w3-margin-right"
	id="reportSubmissionForm">

	<input type="hidden" name="formName" value="reportSubmission">

	<div class="w3-panel w3-center w3-xxlarge">
		<b>Report Submission</b>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Recovery Unit:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRS" value="GoA"
			checked> GoA
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRS" value="Muni">
			Muni
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRS" value="INAC">
			INAC
		</label>
		<label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitRS" value="Other">
			Other
		</label>
		
		
		<input
			class="otherRecoveryUnit w3-input w3-hover-shadow w3-round-large w3-padding w3-margin-top"
			type="text" name="otherrecoveryUnitRS" style="display:none" placeholder="Please Name Recovery Unit">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Program:</b> <select id="program"
			class="attachShowRS programs w3-input w3-select w3-round-large w3-padding w3-hover-shadow"
			name="program" required>
			<option value="" disabled selected>Choose Program</option>
		</select>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Municipality/ Ministry:</b> <input
			class="attachShowRS muniMini w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="muniMini" list="muniMiniList">
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Initiative/ Project #:</b> <input
			class="attachShowRS w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectNumber">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Type:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="initialRS" name="reportType"
			value="Initial" checked> Initial
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="interimRS" name="reportType"
			value="Interim"> Interim
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="finalRS" name="reportType"
			value="Final"> Final
		</label>
	</div>
	
	<div style="display: block" class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large"
		id="uploaderRS" >
		<div id="uploader"></div>    
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
		
	    var uploader = new qq.FineUploader({
	    	sizeLimit: 200000,
	    	blobs: "attach",
	    	autoUpload: true,
	    	disableCancelForFormUploads: true,
	    	debug: true,
	    	request: {endpoint: '/SchedulingProjectBackend/uploadsRS'},
	    	deleteFile: {
	            enabled: true,
	            endpoint: "/SchedulingProjectBackend/uploadsRS"
	        },
	    	retry: {enableAuto: true},
	        element: document.getElementById("uploaderRS")
	    });
		
		$(".errResolved").hide();
		$(".errorResolvedDate").hide();
		
		$(".upType").change(function(){
			var val = $(this).val();
			if (val == "error"){
				$(".errResolved").show();
			} else {
				$(".errorResolvedDate").hide();
				$(".errResolved").hide();
				$(".errRes").val("no");
			}
		});
		
		$(".errRes").change(function(){
			var val = $(this).val();
			if (val == "yes"){
				$(".errorResolvedDate").show();
			} else {
				$(".errorResolvedDate").hide();
			}
		});
	});

</script>