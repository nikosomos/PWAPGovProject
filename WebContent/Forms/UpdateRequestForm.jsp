
<form action="CMForms" method="post"
	class="updateRequestForm form w3-container w3-card-4 w3-margin-left w3-margin-right"
	id="updateRequestForm"
	style="display:none;">

	<input type="hidden" name="formName" value="updateRequest">

	<div class="w3-panel w3-center w3-xxlarge">
		<b>Update Form</b>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Recovery Unit:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitUR" value="GoA"
			checked> GoA
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitUR" value="Muni">
			Muni
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitUR" value="INAC">
			INAC
		</label>
		<label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitUR" value="Other">
			Other
		</label>
		
		
		<input
			class="otherRecoveryUnit w3-input w3-hover-shadow w3-round-large w3-padding w3-margin-top"
			type="text" name="otherrecoveryUnitUR" style="display:none" placeholder="Please Name Recovery Unit">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Program:</b> <select id="program"
			class="attachShowUR programs w3-input w3-select w3-round-large w3-padding w3-hover-shadow"
			name="program" required>
			<option value="" disabled selected>Choose Program</option>
		</select>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Municipality/ Ministry:</b> <input
			class="attachShowUR muniMini w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="muniMini" list="muniMiniList">
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Initiative/ Project #:</b> <input
			class="attachShowUR w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectNumber">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Type:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="initialUR" name="reportType"
			value="Initial" checked> Initial
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="interimUR" name="reportType"
			value="Interim"> Interim
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="finalUR" name="reportType"
			value="Final"> Final
		</label>
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Update Type:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="upType w3-radio" type="radio" name="updateType" value="request"
			checked> Update to Request
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="upType w3-radio" type="radio" name="updateType" value="error">
			Update to Error
		</label>
	</div>	
	
	<div class="errResolved queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Error Resolved:</b> 
		<label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="errRes w3-radio" type="radio" name="errorResolved" value="no" checked>
			No
		</label><label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="errRes w3-radio" type="radio" name="errorResolved" value="yes"
			> Yes
		</label>
	</div>	
		
	<div class="errorResolvedDate queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Error Resolved Date:</b>
		<input class="datePicker w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="resolvedDate">
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Update Comments (Please be specific to why this update is being submitted):</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="updateComments" rows="6"></textarea>
	</div>
	
	<div style="display: block" class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large"
		id="uploaderUR" >
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
	    	request: {endpoint: '/SchedulingProjectBackend/uploadsUR'},
	    	deleteFile: {
	            enabled: true,
	            endpoint: "/SchedulingProjectBackend/uploadsUR"
	        },
	    	retry: {enableAuto: true},
	        element: document.getElementById("uploaderUR")
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