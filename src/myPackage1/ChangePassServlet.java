package myPackage1;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet implementation class ChangePassServlet
 */
@WebServlet("/ChangePassServlet")
public class ChangePassServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePassServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		
		String oldPass = request.getParameter("oldPass");
		String newPass = request.getParameter("newPass");
		String confPass = request.getParameter("confPass");
		String user = (String)session.getAttribute("username");
		
		try{
			if (!Sql.passwordMatch(user, oldPass)) {
				session.setAttribute("oldPassErr", true);
				response.sendRedirect("ChangePassword.jsp");
				return;
			}
			if (!newPass.equals(confPass)){
				session.setAttribute("newPassErr", true);
				response.sendRedirect("ChangePassword.jsp");
				return;
			}
		Sql.changePassword(user, newPass);
		} catch (Exception e){
			e.printStackTrace();
		}
		response.sendRedirect("FinalFormFrame.jsp");

	}

}
