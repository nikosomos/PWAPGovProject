package myPackage1;

import java.text.ParseException;

import javax.servlet.http.HttpServletRequest;

public class ReportDecision implements FormHandler {

	private HttpServletRequest request;
	
	private String recoveryUnit, program, muniMini, initiativeProjectNum, type, reportDecision, redraftComments;
	
	public ReportDecision(HttpServletRequest request) {
		this.request = request;
	}
	
	@Override
	public void setAllFields() throws ParseException {
		if (request.getParameter("recoveryUnitRD").equals("Other")){
			this.recoveryUnit = request.getParameter("otherrecoveryUnitRD");
		} else {
			this.recoveryUnit = request.getParameter("recoveryUnitRD");
		}
		this.program = request.getParameter("program");
		this.muniMini = request.getParameter("muniMini");
		this.initiativeProjectNum = request.getParameter("projectNumber");
		this.type = request.getParameter("reportType");
		this.reportDecision = request.getParameter("reportDecision");
		if (this.reportDecision.equals("Redraft")){
			this.setRedraftComments(request.getParameter("redraftComments"));
		}
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

	public String getReportDecision() {
		return reportDecision;
	}

	public String getRedraftComments() {
		return redraftComments;
	}

	public void setRedraftComments(String redraftComments) {
		this.redraftComments = redraftComments;
	}
	
	@Override
	public String log(Boolean success, String user) {
		String log = "Report Decision submission: " +
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
