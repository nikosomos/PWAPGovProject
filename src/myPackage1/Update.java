package myPackage1;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpServletRequest;


public class Update implements FormHandler {

	private HttpServletRequest request;
	
	private String recoveryUnit, program, muniMini, initiativeProjectNum, type, updateType, errorResolved, updateComments;
	private Date errResDate;
	
	public Update(HttpServletRequest request) {
		this.request = request;
	}

	@Override
	public void setAllFields() throws ParseException {
		if (request.getParameter("recoveryUnitUR").equals("Other")){
			this.recoveryUnit = request.getParameter("otherrecoveryUnitUR");
		} else {
			this.recoveryUnit = request.getParameter("recoveryUnitUR");
		}
		this.program = request.getParameter("program");
		this.muniMini = request.getParameter("muniMini");
		this.initiativeProjectNum = request.getParameter("projectNumber");
		this.type = request.getParameter("reportType");
		this.updateType = request.getParameter("updateType");
		if (updateType.equals("error")) {
			this.errorResolved = request.getParameter("errorResolved");
			if (this.errorResolved.equals("yes")){
				this.errResDate = new Date(((new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("resolvedDate"))).getTime()));
			}
		}
		this.updateComments = request.getParameter("updateComments");
	}

	public HttpServletRequest getRequest() {
		return request;
	}

	public String getRecoveryUnit() {
		return recoveryUnit;
	}

	public String getProgram() {
		return program;
	}

	public String getMuniMini() {
		return muniMini;
	}

	public String getInitiativeProjectNum() {
		return initiativeProjectNum;
	}

	public String getType() {
		return type;
	}

	public String getUpdateComments() {
		return updateComments;
	}

	public String getUpdateType() {
		return updateType;
	}

	public String getErrorResolved() {
		return errorResolved;
	}

	public Date getErrResDate() {
		return errResDate;
	}
	
	@Override
	public String log(Boolean success, String user) {
		String log = "Update Request submission: " +
				"%n\tUser: " + user + 
				"%n\tProgram: " + this.getProgram() + 
				"%n\tMuni/ Mini: " + this.getMuniMini() + 
				"%n\tInitiative/ Project #: " + this.getInitiativeProjectNum() +
				"%n\tReport Type: " + this.getType();
		
		if (success){
			log += "%n\tStatus: successful";
		} else {
			log += "%n\tStatus: failure";
		}
		
		log += "%n\tDate: " + new java.util.Date() + "%n%n";
		
		return log;
	}

	@Override
	public String logError(String user, Exception e) {
		String error = "Error in submission: " +
				"%n\tUser: " + user + 
				"%n\tDate: " + new java.util.Date() + 
				"%n\tError: " + e.getMessage() + "%n%n";
		return error;
	}

}
