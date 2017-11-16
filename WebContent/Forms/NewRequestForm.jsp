<form action="CMForms" method="post"
	class="form w3-container w3-card-4 w3-margin-left w3-margin-right"
	id="newRequestForm" >

	<input type="hidden" name="formName" value="newRequest">

	<div class="w3-panel w3-center w3-xxlarge">
		<b>New Request Form</b>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Recovery Unit:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNR" value="GoA"
			checked> GoA
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNR" value="Muni">
			Muni
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNR" value="INAC">
			INAC
		</label>
		 <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio recoveryUnit" type="radio" name="recoveryUnitNR" value="Other">
			Other
		</label>
		
		
		<input
			class="otherRecoveryUnit w3-input w3-hover-shadow w3-round-large w3-padding w3-margin-top"
			type="text" name="otherrecoveryUnitNR" style="display:none" placeholder="Please Name Recovery Unit">
		
		
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
			class="attachShowNR w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectNumber" id="projectNumber" required>
	</div>
	
	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Project Name:</b> <input
			class="w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="projectName" required>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Project Location (Street address and GPS coordinates):</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="projectLocation" rows="4" required></textarea>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Report Type:</b> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="initialNR" name="reportType"
			value="Initial" checked> Initial
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="interimNR" name="reportType"
			value="Interim"> Interim
		</label> <label
			class="radioButton w3-btn w3-hover-blue w3-ripple w3-padding-16 w3-round-large">
			<input class="w3-radio" type="radio" id="finalNR" name="reportType"
			value="Final"> Final
		</label>
	</div>

	<div class="w3-row">

		<div
			class="queryPanel w3-mobile w3-panel w3-half w3-left w3-card-4 w3-padding-16 w3-round-large"
			style="width: 49%">

			<b>Initiative/ Project Contact:</b>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 7px 0 0 7px">
					<i class="w3-xxlarge fa fa-user"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="projectContactName" type="text" placeholder="Name">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 6px 0 0 0">
					<i class="w3-xxlarge fa fa-id-card"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="projectContactPosition" type="text" placeholder="Position">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 7px 0 0 7px">
					<i class="w3-xxlarge fa fa-phone"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="projectContactPhone" type="text" placeholder="Phone">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 5px 0 0 2px">
					<i class="w3-xxlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="projectContactEmail" type="text" placeholder="Email">
				</div>
			</div>

		</div>

		<div
			class="queryPanel w3-mobile w3-panel w3-half w3-right w3-card-4 w3-padding-16 w3-round-large"
			style="width: 49%">

			<b>Site Contact:</b>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 7px 0 0 7px">
					<i class="w3-xxlarge fa fa-user"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="siteContactName" type="text" placeholder="Name">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 6px 0 0 0">
					<i class="w3-xxlarge fa fa-id-card"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="siteContactPosition" type="text" placeholder="Position">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 7px 0 0 7px">
					<i class="w3-xxlarge fa fa-phone"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="siteContactPhone" type="text" placeholder="Phone">
				</div>
			</div>

			<div class="w3-row w3-section">
				<div class="w3-col" style="width: 50px; padding: 5px 0 0 2px">
					<i class="w3-xxlarge fa fa-envelope"></i>
				</div>
				<div class="w3-rest inDiv">
					<input class="w3-input w3-hover-shadow w3-round-large w3-padding"
						name="siteContactEmail" type="text" placeholder="Email">
				</div>
			</div>

		</div>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Associated AR#:</b> <input
			class="w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="aRNumber">
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Project Background:</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="projectBackground" rows="4" required></textarea>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Damage Description:</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="damageDescription" rows="4" required></textarea>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Cause of Damage:</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="causeOfDamage" rows="4" required></textarea>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Date of Damage:</b> <input
			class="datePicker w3-input w3-hover-shadow w3-round-large w3-padding"
			type="text" name="dateOfDamage" required>
	</div>

	<div class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large">
		<b>Scope/ Mitigation/ Enhancements Comments:</b>
		<textarea class="w3-input w3-hover-shadow w3-round-large w3-padding"
			name="scopeMitEnhComments" rows="4"></textarea>
	</div>

	<div style="display: block" class="queryPanel w3-panel w3-card-4 w3-padding-16 w3-round-large"
		id="uploader" >
		<div id="uploader"></div>    
	</div>

	<div class="w3-row">
		<input type="submit" class="submit w3-quarter w3-btn w3-ripple w3-right w3-round-large w3-padding-16"
			value="SUBMIT">
		<input type="reset" class="reset w3-quarter w3-btn w3-ripple w3-left w3-round-large w3-padding-16"
			value="RESET" onclick="window.scrollTo(0,0);">
	</div>
	
	
	
	<script>
	
	    var uploader = new qq.FineUploader({
	    	sizeLimit: 200000,
	    	blobs: "attach",
	    	autoUpload: true,
	    	disableCancelForFormUploads: true,
	    	debug: true,
	    	request: {endpoint: '/SchedulingProjectBackend/uploads'},
	    	deleteFile: {
	            enabled: true,
	            endpoint: "/SchedulingProjectBackend/uploads"
	        },
	    	retry: {enableAuto: true},
	        element: document.getElementById("uploader")
	    });
	    
	
		/*$(".attachShowNR").change(function(){
			
			var reqlength = $('.attachShowNR').length;
		    var value = $('.attachShowNR').filter(function () {
		        return this.value != '';
		    });

		    if (value.length>=0 && (value.length !== reqlength)) {
		    	$("#uploader").hide();
		    } else {
		    	$("#uploader").show();
		    }
		    
		});*/
		
	
	
	</script>

</form>