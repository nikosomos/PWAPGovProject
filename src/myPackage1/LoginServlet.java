package myPackage1;

import java.io.FileWriter;
import java.io.PrintWriter;
import java.io.IOException;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoginServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	public void init() throws ServletException {
	}
	
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		this.doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {

		String logPath = "////M:/AEMA/DRP PSPD/PC/PWAP/Portal Resources/login.txt";
		
		String user = request.getParameter("username");
		String pass = request.getParameter("password");
		String log;
		
		FileWriter write = new FileWriter(logPath, true);
		PrintWriter printLine = new PrintWriter(write);
		
		String[] name = user.split("\\.");
		HttpSession session = request.getSession();

		try{
			if (Sql.passwordMatch(user, pass)) {
				log = user + " successful login on:  " + new Date();
				printLine.println(log);
				printLine.close();
				write.close();
				session.setAttribute("username", user);
				session.setAttribute("firstName", name[0].substring(0,1).toUpperCase() + name[0].substring(1));
				session.setAttribute("lastName", name[1].substring(0,1).toUpperCase() + name[1].substring(1));
				//session.setMaxInactiveInterval(60 * 60);
				try {
					if (Sql.firstLogin(user)){
						session.setAttribute("oldPassErr", false);
						session.setAttribute("newPassErr", false);
						response.sendRedirect("ChangePassword.jsp");
						return;
					}
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
					throw e;
				}
				response.sendRedirect("UserTypeFilter");
			} else {
				log = user + " un-successful login on:  " + new Date();
				printLine.println(log);
				printLine.close();
				write.close();
				session.setAttribute("userError", true);
				response.sendRedirect("Login.jsp");
				return;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
	}

}
