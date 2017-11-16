package myPackage1;
import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;


public class NewError implements FormHandler {

	private HttpServletRequest request;
	
	public class Error {
		String assoc, type, specifics, comments;
		
		public Error(String assoc, String type, String specifics, String comments){
			this.assoc = assoc;
			this.type = type;
			this.specifics = specifics;
			this.comments = comments;
		}

		public String getAssoc() {
			return assoc;
		}

		public String getType() {
			return type;
		}

		public String getSpecifics() {
			return specifics;
		}

		public String getComments() {
			return comments;
		}
		
	}
	
	private String recoveryUnit, program, muniMini, initiativeProjectNum, type;
	private Date encounterDate;
	private Integer errorCount;
	private List<Error> errorList;

	public NewError(HttpServletRequest request) {
		this.request = request;
		errorList = new ArrayList<Error>();
	}

	@Override
	public void setAllFields() throws ParseException {
		if (request.getParameter("recoveryUnitNE").equals("Other")){
			this.recoveryUnit = request.getParameter("otherrecoveryUnitNE");
		} else {
			this.recoveryUnit = request.getParameter("recoveryUnitNE");
		}
		this.program = request.getParameter("program");
		this.muniMini = request.getParameter("muniMini");
		this.initiativeProjectNum = request.getParameter("projectNumber");
		this.type = request.getParameter("reportType");
		this.encounterDate = new Date(((new SimpleDateFormat("yyyy-mm-dd").parse(request.getParameter("encounterDate"))).getTime()));
		this.errorCount = Integer.parseInt(request.getParameter("errorNum"));
		for (int i = 0; i < this.errorCount; i++){
			errorList.add(new Error(request.getParameter("errorAss" + (i+1)), request.getParameter("errorType" + (i+1)), request.getParameter("errorSpec" + (i+1)), request.getParameter("errorComments" + (i+1))));
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

	public Integer getErrorCount() {
		return errorCount;
	}

	public List<Error> getErrorList() {
		return errorList;
	}

	public Date getEncounterDate() {
		return encounterDate;
	}
	
	@Override
	public String log(Boolean success, String user) {
		String log = "New Error submission: " +
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
