package myPackage1;
import java.sql.*;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;


public class Sql {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "net.ucanaccess.jdbc.UcanaccessDriver";
    static final String DB_URL="jdbc:ucanaccess://M:/AEMA/DRP PSPD/PC/PWAP/PWAP_DB.accdb";
    //static final String DB_URL="jdbc:ucanaccess://M:/AEMA/DRP PSPD/PC/PWAP/PWAP_DB_TEST_1.accdb";

	public static void newProgram(String name, Date startDate, Date endDate) throws Exception{
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		String query = "INSERT INTO Program (Name, Start_Date, End_Date) VALUES ( ?, ?, ? );";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, name);
		st.setDate(2, startDate);
		st.setDate(3, endDate);    		
		st.executeUpdate();
		con.close();
		st.close();
    }
    
    public static Boolean passwordMatch(String username, String password) throws Exception{
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		String query = "SELECT Password FROM Users WHERE Username = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		con.close();
		st.close();
		if (rs.next() && (rs.getString("Password").equals(password))){
			return true;
		}
    	return false;
    }
    
    public static void changePassword(String username, String password) throws Exception{
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		String query = "UPDATE Users SET Password = ?, First_Login = ? WHERE Username = ?;";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, password);
		st.setBoolean(2, false);
		st.setString(3, username);
		st.executeUpdate();
		con.close();
		st.close();
    }
    
    public static Boolean firstLogin(String username) throws Exception{
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		String query = "SELECT First_Login FROM Users WHERE Username = ?";
		PreparedStatement st = con.prepareStatement(query);
		st.setString(1, username);
		ResultSet rs = st.executeQuery();
		con.close();
		st.close();
		if (rs.next()){
			return rs.getBoolean("First_Login");
		}
    	return false;
    }
    
    public static List<String> getPrograms() throws Exception{
    	List<String> prog;
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		PreparedStatement st = con.prepareStatement("SELECT Name FROM Program ORDER BY Name;");
		ResultSet rs = st.executeQuery();
		con.close();
		st.close();
		prog = new ArrayList<String>();
		while(rs.next()){
			prog.add(rs.getString("Name"));
		}
      	return prog;
    }
    
    public static String[] getMuniMini() throws Exception{
    	String[] muniMini;
    	
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		PreparedStatement st = con.prepareStatement("SELECT Name FROM MuniMini;");
		ResultSet rs = st.executeQuery();
		List<String> temp = new ArrayList<String>();
		while (rs.next()){
			temp.add(rs.getString("Name"));
		}
		muniMini = temp.toArray(new String[1]);
		con.close();
		st.close();

      	return muniMini;
    }
    
    
    public static Map<String, Map<String, Map<String, String>>> getProjects() throws Exception{
    	
    	Map<String, String> projects;
    	Map<String, Map<String, String>> muniMinis;
    	Map<String, Map<String, Map<String, String>>> programs;
    	
    	try{
    		Class.forName(JDBC_DRIVER);
    		Connection con = DriverManager.getConnection(DB_URL);
    		PreparedStatement st = con.prepareStatement("SELECT Program_Id, Muni_Mini, Project_Number, Name FROM Project ORDER BY Program_Id, Muni_Mini, Project_Number;");
    		ResultSet rs = st.executeQuery();
    		con.close();
    		st.close();
    		projects = new HashMap<String, String>();
    		muniMinis = new HashMap<String, Map<String, String>>();
    		programs = new HashMap<String, Map<String, Map<String, String>>>();
    		
    		String lastMuniMini = new String();
    		String lastProgram = new String();
    		
    		while (rs.next()){
    			if (!rs.getString("Muni_Mini").equals(lastMuniMini) && !lastMuniMini.equals("")){
    				muniMinis.put(lastMuniMini, new HashMap<String, String>(projects));
    				projects.clear();
    			}
    			if (!rs.getString("Program_Id").equals(lastProgram) && !lastProgram.equals("")){
    				programs.put(lastProgram, new HashMap<String, Map<String, String>>(muniMinis));
    				muniMinis.clear();
    			}
    			projects.put(rs.getString("Project_Number"), rs.getString("Name"));
    			lastProgram = rs.getString("Program_Id");
    			lastMuniMini = rs.getString("Muni_Mini");
    		}
    		muniMinis.put(lastMuniMini, new HashMap<String, String>(projects));
    		programs.put(lastProgram, new HashMap<String, Map<String, String>>(muniMinis));
    	}catch(Exception e){
    		e.printStackTrace();
    		throw e;
    	}
      	return programs;
    }
    
    public static void enterNewRequest(NewRequest nR, HttpSession session) throws Exception{
    	
    
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT Id FROM Project WHERE Program_Id=? AND Muni_Mini=? AND Project_Number=?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, nR.getProgram());
		st1.setString(2, nR.getMuniMini());
		st1.setString(3, nR.getInitiativeProjectNum());
		ResultSet rs1 = st1.executeQuery();
		Calendar cal = Calendar.getInstance();
		Date date = new Date(cal.getTimeInMillis());
		cal.add(Calendar.DAY_OF_MONTH,30);
		Date deadline = new Date(cal.getTimeInMillis());
		
		if (!rs1.next()){
    		String query2 = "INSERT INTO Project VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL);";
    		PreparedStatement st2 = con.prepareStatement(query2);
    		st2.setString(1, nR.getRecoveryUnit());
    		st2.setString(2, nR.getProgram());
    		st2.setString(3, nR.getMuniMini());
    		st2.setString(4, nR.getInitiativeProjectNum());
    		st2.setString(5, nR.getName());
    		st2.setString(6, nR.getLoc());
    		st2.setString(7, nR.getProjectContact().getName());
    		st2.setString(8, nR.getProjectContact().getPosition());
    		st2.setString(9, nR.getProjectContact().getPhone());
    		st2.setString(10, nR.getProjectContact().getEmail());
    		st2.setString(11, nR.getSiteContact().getName());
    		st2.setString(12, nR.getSiteContact().getPosition());
    		st2.setString(13, nR.getSiteContact().getPhone());
    		st2.setString(14, nR.getSiteContact().getEmail());
    		st2.setString(15, nR.getaAR());
    		st2.setString(16, nR.getBackground());
    		st2.setString(17, nR.getDmgDescription());
    		
			st2.setString(18, nR.getCause());
			st2.setDate(19, nR.getDateOfDamage());
    		st2.executeUpdate();
    		st2.close();
		}
		
		String query3 = "SELECT Id FROM Project WHERE Program_Id=? AND Muni_Mini=? AND Project_Number=?";
		PreparedStatement st3 = con.prepareStatement(query3);
		st3.setString(1, nR.getProgram());
		st3.setString(2, nR.getMuniMini());
		st3.setString(3, nR.getInitiativeProjectNum());
		ResultSet rs2 = st3.executeQuery();
		
		String query4 = "INSERT INTO Request VALUES (NULL, ?, NULL, ?, ?, ?, ?, ?, ?, ?, NULL, NULL, NULL, NULL, NULL, NULL, NULL, ?);";
		PreparedStatement st4 = con.prepareStatement(query4);
		rs2.next();
		st4.setInt(1, rs2.getInt(1));
		st4.setString(2, session.getAttribute("username").toString());
		st4.setDate(3, date);
		st4.setDate(4, deadline);
		st4.setString(5, nR.getType());
		st4.setString(6, "In Queue");
		st4.setString(7, "Pending");
		st4.setDate(8, date);
		st4.setBoolean(9, false);
		st4.executeUpdate();
		
		st1.close();
		st3.close();
		st4.close();
		rs1.close();
		rs2.close();
		con.close();

    }
    
    public static void enterUpdateRequest(Update uR, HttpSession session) throws Exception{
    
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT req.Id AS Request_Id, req.CM_Id AS Case_Manager FROM Project pro, Request req WHERE pro.Program_Id=? AND pro.Muni_Mini=? AND pro.Project_Number=? AND req.Project_Id=pro.Id";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, uR.getProgram());
		st1.setString(2, uR.getMuniMini());
		st1.setString(3, uR.getInitiativeProjectNum());
		ResultSet rs1 = st1.executeQuery();
		

		Date date = new Date(new java.util.Date().getTime());

		String query2 = "INSERT INTO Update VALUES (NULL, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?);";
		PreparedStatement st2 = con.prepareStatement(query2);
		
		if (rs1.next()){
			st2.setInt(1, rs1.getInt("Request_Id"));
		} else {
			st2.setNull(1, java.sql.Types.INTEGER);
		}
		
		st2.setString(2, "Pending");
		st2.setString(3, uR.getRecoveryUnit());
		st2.setString(4, uR.getProgram());
		st2.setString(5, uR.getMuniMini());
		st2.setString(6, uR.getInitiativeProjectNum());
		st2.setString(7, uR.getType());
		st2.setString(8, session.getAttribute("username").toString());
    	st2.setDate(9, date);
    	if (uR.getUpdateType().equals("error")){
    		if (uR.getErrorResolved().equals("yes")){
    			st2.setString(10, "Error Update - " + uR.getUpdateComments());
    		} else {
    			st2.setString(10, "Error Resolved - Resolved Date: " + uR.getErrResDate() + " Comments: "+ uR.getUpdateComments());
    		}
    	} else {
    		st2.setString(10, "Request Update - " + uR.getUpdateComments());
    	}
    	st2.executeUpdate();
    	
		st1.close();
		st2.close();
		rs1.close();
		con.close();

    }
    
    public static void enterReportSubmission(ReportSubmission rS, HttpSession session) throws Exception{
        
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT req.Id AS Request_Id, req.CM_Id AS Case_Manager FROM Project pro, Request req WHERE pro.Program_Id=? AND pro.Muni_Mini=? AND pro.Project_Number=? AND req.Project_Id=pro.Id";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, rS.getProgram());
		st1.setString(2, rS.getMuniMini());
		st1.setString(3, rS.getInitiativeProjectNum());
		ResultSet rs1 = st1.executeQuery();
		

		Date date = new Date(new java.util.Date().getTime());

		String query2 = "INSERT INTO Update VALUES (NULL, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?);";
		PreparedStatement st2 = con.prepareStatement(query2);
		
		if (rs1.next()){
			st2.setInt(1, rs1.getInt("Request_Id"));
		} else {
			st2.setNull(1, java.sql.Types.INTEGER);
		}
		
		st2.setString(2, "Pending");
		st2.setString(3, rS.getRecoveryUnit());
		st2.setString(4, rS.getProgram());
		st2.setString(5, rS.getMuniMini());
		st2.setString(6, rS.getInitiativeProjectNum());
		st2.setString(7, rS.getType());
		st2.setString(8, session.getAttribute("username").toString());
    	st2.setDate(9, date);
    	st2.setString(10, "Report Submission");
    	st2.executeUpdate();
    	
		st1.close();
		st2.close();
		rs1.close();
		con.close();

    }
    
    public static void enterReportDecision(ReportDecision rD, HttpSession session) throws Exception{
    	
    	
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT req.Id AS Request_Id, req.CM_Id AS Case_Manager FROM Project pro, Request req WHERE pro.Program_Id=? AND pro.Muni_Mini=? AND pro.Project_Number=? AND req.Project_Id=pro.Id";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, rD.getProgram());
		st1.setString(2, rD.getMuniMini());
		st1.setString(3, rD.getInitiativeProjectNum());
		ResultSet rs1 = st1.executeQuery();
		
		Calendar cal = Calendar.getInstance();
		Date date = new Date(new java.util.Date().getTime());

		String query2 = "INSERT INTO Update VALUES (NULL, ?, NULL, ?, ?, ?, ?, ?, ?, ?, ?, NULL, ?);";
		PreparedStatement st2 = con.prepareStatement(query2);
		
		if (rs1.next()){
			st2.setInt(1, rs1.getInt("Request_Id"));
		} else {
			st2.setNull(1, java.sql.Types.INTEGER);
		}
		
		st2.setString(2, "Pending");
		st2.setString(3, rD.getRecoveryUnit());
		st2.setString(4, rD.getProgram());
		st2.setString(5, rD.getMuniMini());
		st2.setString(6, rD.getInitiativeProjectNum());
		st2.setString(7, rD.getType());
		st2.setString(8, session.getAttribute("username").toString());
    	st2.setDate(9, date);
		if (rD.getReportDecision().equals("Redraft")){
			st2.setString(10, "Report Decision - Redraft: " + rD.getReportDecision());
		} else {
			st2.setString(10, "Report Decision - " + rD.getReportDecision());
		}
    	st2.executeUpdate();
    	
		st1.close();
		st2.close();
		rs1.close();
		con.close();

    }
    
    public static void enterNewError(NewError nE, HttpSession session) throws Exception{
        
		Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT req.Id AS Request_Id, req.CM_Id AS Case_Manager FROM Project pro, Request req WHERE pro.Program_Id=? AND pro.Muni_Mini=? AND pro.Project_Number=? AND req.Project_Id=pro.Id";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, nE.getProgram());
		st1.setString(2, nE.getMuniMini());
		st1.setString(3, nE.getInitiativeProjectNum());
		ResultSet rs1 = st1.executeQuery();
		

		Date date = new Date(new java.util.Date().getTime());
		
		String query2 = "INSERT INTO Errors VALUES (NULL, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, NULL, NULL, ?, ?, ?, ?, ?);";
		PreparedStatement st2 = con.prepareStatement(query2);
		
		for (NewError.Error err : nE.getErrorList()){
			
			if (rs1.next()){
				st2.setInt(1, rs1.getInt("Request_Id"));
			} else {
				st2.setNull(1, java.sql.Types.INTEGER);
			}
			
			st2.setString(2, "Pending");
			st2.setString(3, nE.getRecoveryUnit());
			st2.setString(4, nE.getProgram());
			st2.setString(5, nE.getMuniMini());
			st2.setString(6, nE.getInitiativeProjectNum());
			st2.setString(7, nE.getType());
			st2.setString(8, session.getAttribute("username").toString());
	    	st2.setDate(9, date);
	    	st2.setDate(10, nE.getEncounterDate());
	    	st2.setString(11, err.getAssoc());
	    	st2.setString(12, err.getType());
	    	st2.setString(13, err.getSpecifics());
	    	st2.setString(14, "New Error - " + err.getComments());
	    	st2.setString(15, "Pending");
	    	st2.addBatch();
		}
		st2.executeBatch();
		st1.close();
		st2.close();
		rs1.close();
		con.close();

    }
    
    public static String getUserFirstName(String username) throws Exception{
    	Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT First_Name FROM Users WHERE Username = ?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet rs1 = st1.executeQuery();
		if (rs1.next()){
			return rs1.getString("First_Name");
		} else {
			return "";
		}
    }
    
    public static String getUserEmail(String username) throws Exception{
    	Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT Email FROM Users WHERE Username = ?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet rs1 = st1.executeQuery();
		if (rs1.next()){
			return rs1.getString("Email");
		} else {
			return "";
		}
    }
    
    public static Boolean getUserCoor(String username) throws Exception{
    	Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT Coordinator FROM Users WHERE Username = ?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet rs1 = st1.executeQuery();
		if (rs1.next()){
			return rs1.getBoolean("Coordinator");
		} else {
			return false;
		}
    }
    
    public static Boolean getUserCM(String username) throws Exception{
    	Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT Case_Manager FROM Users WHERE Username = ?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet rs1 = st1.executeQuery();
		if (rs1.next()){
			return rs1.getBoolean("Case_Manager");
		} else {
			return false;
		}
    }
    
    public static Boolean getUserEng(String username) throws Exception{
    	Class.forName(JDBC_DRIVER);
		Connection con = DriverManager.getConnection(DB_URL);
		
		String query1 = "SELECT Engineer FROM Users WHERE Username = ?";
		PreparedStatement st1 = con.prepareStatement(query1);
		st1.setString(1, username);
		ResultSet rs1 = st1.executeQuery();
		if (rs1.next()){
			return rs1.getBoolean("Engineer");
		} else {
			return false;
		}
    }
    

    
    	
}
