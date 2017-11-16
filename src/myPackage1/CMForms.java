package myPackage1;


import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.FilenameFilter;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.util.Arrays;
import java.util.Date;
import java.util.regex.Pattern;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import fineuploader.MultipartUploadParser;
import fineuploader.RequestParser;
import fineuploader.UploadReceiver;

/**
 * Servlet implementation class CMForms
 */
@WebServlet("/CMForms")
public class CMForms extends HttpServlet {
	private static final long serialVersionUID = 1L;

	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CMForms() {
        super();
        // TODO Auto-generated constructor stub
    }
    
    


	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String submitLogPath = "////M:/AEMA/DRP PSPD/PC/PWAP/Portal Resources/formSubmit.txt";
		String errorLogPath = "////M:/AEMA/DRP PSPD/PC/PWAP/Portal Resources/formErrors.txt";
		
		FileWriter submitWrite = new FileWriter(submitLogPath, true);
		FileWriter errorWrite = new FileWriter(errorLogPath, true);
		PrintWriter submitPrintLine = new PrintWriter(submitWrite);
		PrintWriter errorPrintLine = new PrintWriter(errorWrite);
		
		HttpSession session = request.getSession();
		
		String log;
		
		String error = null;
		
	
		
		switch (request.getParameter("formName")){
			case "newRequest":
			
				NewRequest formNR = new NewRequest(request);
				try {
					formNR.setAllFields();
					Sql.enterNewRequest(formNR, session);
					response.sendRedirect("SubmitSuccessful.jsp");
					log = formNR.log(true, (String) session.getAttribute("username"));
					//formNR.email(true, (String) session.getAttribute("username"));
				} catch (Exception e) {
					log = formNR.log(false, (String) session.getAttribute("username"));
					error = formNR.logError((String) session.getAttribute("username"), e);
					e.printStackTrace();
					response.sendRedirect("ErrorSubmitting.jsp");
				}
				break;
				
			case "updateRequest":
				Update formUR = new Update(request);
				try {
					formUR.setAllFields();
					Sql.enterUpdateRequest(formUR, session);
					response.sendRedirect("SubmitSuccessful.jsp");
					log = formUR.log(true, (String) session.getAttribute("username"));
				} catch (Exception e) {
					log = formUR.log(false, (String) session.getAttribute("username"));
					error = formUR.logError((String) session.getAttribute("username"), e);
					e.printStackTrace();
					response.sendRedirect("ErrorSubmitting.jsp");
				}
				break;
				
			case "reportDecision":
				ReportDecision formRD = new ReportDecision(request);
				try {
					formRD.setAllFields();
					Sql.enterReportDecision(formRD, session);
					response.sendRedirect("SubmitSuccessful.jsp");
					log = formRD.log(true, (String) session.getAttribute("username"));
				} catch (Exception e) {
					log = formRD.log(false, (String) session.getAttribute("username"));
					error = formRD.logError((String) session.getAttribute("username"), e);
					e.printStackTrace();
					response.sendRedirect("ErrorSubmitting.jsp");
				}
				break;
				
			case "newError":
				NewError formNE = new NewError(request);
				try {
					formNE.setAllFields();
					Sql.enterNewError(formNE, session);
					response.sendRedirect("SubmitSuccessful.jsp");
					log = formNE.log(true, (String) session.getAttribute("username"));
				} catch (Exception e) {
					log = formNE.log(false, (String) session.getAttribute("username"));
					error = formNE.logError((String) session.getAttribute("username"), e);
					e.printStackTrace();
					response.sendRedirect("ErrorSubmitting.jsp");
				}
				break;
				
			case "reportSubmission":
				ReportSubmission formRS = new ReportSubmission(request);
				try {
					formRS.setAllFields();
					Sql.enterReportSubmission(formRS, session);
					response.sendRedirect("SubmitSuccessful.jsp");
					log = formRS.log(true, (String) session.getAttribute("username"));
				} catch (Exception e) {
					log = formRS.log(false, (String) session.getAttribute("username"));
					error = formRS.logError((String) session.getAttribute("username"), e);
					e.printStackTrace();
					response.sendRedirect("ErrorSubmitting.jsp");
				}
				break;
				
			default:
				log = "Forms 'formName' parameter not set, something went wrong:" +
						"%n\tUser: " + session.getAttribute("username");
				error = "Forms 'formName' parameter not set, something went wrong:" +
						"%n\tUser: " + session.getAttribute("username");
				response.sendRedirect("ErrorSubmitting.jsp");
				break;
		}
		
		submitPrintLine.printf(log);
		if (error != null){
			errorPrintLine.printf(error);
		}
		
		submitPrintLine.close();
		submitWrite.close();
		errorPrintLine.close();
		errorWrite.close();

	}
}

	