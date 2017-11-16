package myPackage1;

import java.sql.Date;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Properties;

import javax.servlet.http.HttpServletRequest;
import javax.mail.*;
import javax.mail.internet.*;  
import javax.activation.*; 


public class NewRequest implements FormHandler {
	
	public class Contact {
		protected String name, position, phone, email;

		public String getName() {
			return name;
		}

		public String getPosition() {
			return position;
		}

		public String getPhone() {
			return phone;
		}

		public String getEmail() {
			return email;
		}
		
	}
	
	private String recoveryUnit, program, muniMini, initiativeProjectNum, name, loc, type, aAR, background, dmgDescription, cause, scopeMitigationEnhancments;
	private Date dateOfDamage;
	private Contact siteContact, projectContact;
	private HttpServletRequest request;
	
	public NewRequest(HttpServletRequest request){
		this.request = request;
		this.siteContact = new Contact();
		this.projectContact = new Contact();
	}
	
	public void setAllFields() throws ParseException{
		if (request.getParameter("recoveryUnitNR").equals("Other")){
			this.recoveryUnit = request.getParameter("otherrecoveryUnitNR");
		} else {
			this.recoveryUnit = request.getParameter("recoveryUnitNR");
		}
		this.program = request.getParameter("program");
		this.muniMini = request.getParameter("muniMini");
		this.initiativeProjectNum = request.getParameter("projectNumber");
		this.name = request.getParameter("projectName");
		this.loc = request.getParameter("projectLocation");
		this.type = request.getParameter("reportType");
		this.projectContact.name = request.getParameter("projectContactName");
		this.projectContact.position = request.getParameter("projectContactPosition");
		this.projectContact.phone = request.getParameter("projectContactPhone");
		this.projectContact.email = request.getParameter("projectContactEmail");
		this.siteContact.name = request.getParameter("siteContactName");
		this.siteContact.position = request.getParameter("siteContactPosition");
		this.siteContact.phone = request.getParameter("siteContactPhone");
		this.siteContact.email = request.getParameter("siteContactEmail");
		this.aAR = request.getParameter("aRNumber");
		this.background = request.getParameter("projectBackground");
		this.dmgDescription = request.getParameter("damageDescription");
		this.cause = request.getParameter("causeOfDamage");
		this.dateOfDamage = new Date(((new SimpleDateFormat("dd-MM-yyyy").parse(request.getParameter("dateOfDamage"))).getTime()));
		this.scopeMitigationEnhancments = request.getParameter("scopeMitEnhComments");
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

	public String getName() {
		return name;
	}

	public String getLoc() {
		return loc;
	}

	public String getType() {
		return type;
	}

	public String getaAR() {
		return aAR;
	}

	public String getBackground() {
		return background;
	}

	public String getDmgDescription() {
		return dmgDescription;
	}

	public String getCause() {
		return cause;
	}

	public Date getDateOfDamage() {
		return dateOfDamage;
	}

	public String getScopeMitigationEnhancments() {
		return scopeMitigationEnhancments;
	}

	public Contact getSiteContact() {
		return siteContact;
	}

	public Contact getProjectContact() {
		return projectContact;
	}

	@Override
	public String log(Boolean success, String user) {
		String log = "New Request submission: " + 
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
	
	public void email(Boolean success, String username) {
		final String from = "ma.aema.pwap@gov.ab.ca";
		final String user = "niko.somos";
		final String pass = "Ns.24251694";
		String host = "localhost";

		Properties properties = System.getProperties();
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.smtp.auth", "true");
	    properties.put("mail.smtp.host", "outlook.gov.ab.ca");
	    //properties.put("mail.smtp.port", "587");
	    
	    //Session session = Session.getInstance(properties);
	    
	    Session session = Session.getInstance(properties,
	            new javax.mail.Authenticator() {
	              protected PasswordAuthentication getPasswordAuthentication() {
	                  return new PasswordAuthentication(user, pass);
	              }
	    });

		
		try{ 
			String subject = "New Request Submitted - " + 
					this.getProgram() + " - " + 
					this.getMuniMini() + " - "  + 
					this.getName() + " - " + 
					this.getInitiativeProjectNum();
			String content = "Hello " + Sql.getUserFirstName(username) 
					+ "%n%nYour New Request submission has been recieved and will be processed soon.%n%n Please review your submission here for any errors:"
					+ "%n\tDate Entered: " + new java.util.Date()
					+ "%n\tRecovery Unit: " + this.getRecoveryUnit() 
					+ "%n\tProgram: " + this.getProgram() 
					+ "%n\tMuni/ Mini: " + this.getMuniMini() 
					+ "%n\tInitiative/ Project #:  " + this.getInitiativeProjectNum()
					+ "%n\tProject Name: " + this.getName()
					+ "%n\tProject Location: " + this.getLoc() 
					+ "%n\tReport Type: " + this.getType() 
					+ "%n\tProject Contact Name: " + this.getProjectContact().getName()
					+ "%n\tProject Contact Position: " + this.getProjectContact().getPosition() 
					+ "%n\tProject Contact Phone: " + this.getProjectContact().getPhone()
					+ "%n\tProject Contact Email: " + this.getProjectContact().getEmail()
					+ "%n\tSite Contact Name: " + this.getSiteContact().getName()
					+ "%n\tSite Contact Position: " + this.getSiteContact().getPosition()
					+ "%n\tSite Contact Phone: " + this.getSiteContact().getPhone()
					+ "%n\tSite Contact Email: " + this.getSiteContact().getEmail()
					+ "%n\tAR#: " + this.getaAR() 
					+ "%n\tBackground: " + this.getBackground()
					+ "%n\tDamage Description: " + this.getDmgDescription()
					+ "%n\tCause of Damage: " + this.getCause()
					+ "%n\tDate of Damage: " + this.getDateOfDamage()
					+ "%n\tScope and Mitigation Comments: " + this.getScopeMitigationEnhancments()
					+ "%n%n If there are any errors please contact the coordinator at ma.aema.pwap@gov.ab.ca."
					+ "%nThank you"
					+ "%n%n This is an automated message.";
	         MimeMessage message = new MimeMessage(session);  
	         message.setFrom(new InternetAddress(from));  
	         message.addRecipient(Message.RecipientType.TO,new InternetAddress(Sql.getUserEmail(username)));  
	         message.setSubject(subject);  
	         message.setText(content);  
	  
	         // Send message  
	         Transport.send(message);  
	         System.out.println("message sent successfully....");  
	  
	    }catch (Exception e) {e.printStackTrace();}  
		
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
