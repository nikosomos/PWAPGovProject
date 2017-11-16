package myPackage1;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet Filter implementation class UserTypeFilter
 */
@WebFilter("/UserTypeFilter")
public class UserTypeFilter implements Filter {

    /**
     * Default constructor. 
     */
    public UserTypeFilter() {
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		HttpServletRequest req = (HttpServletRequest) request;
		HttpServletResponse res = (HttpServletResponse) response;
		
		String user = (String) req.getSession().getAttribute("username");
		
		try {
			if (Sql.getUserCoor(user)){
				res.sendRedirect("FinalFormFrame.jsp");
				return;
			} else if (Sql.getUserCM(user)){
				res.sendRedirect("FinalFormFrame.jsp");
				return;
			} else if (Sql.getUserEng(user)){
				res.sendRedirect("EngineeringFrame.jsp");
				return;
			} else {
				res.sendRedirect("FinalFormFrame.jsp");
				return;
			}
		} catch (Exception e){
			e.printStackTrace();
		}
		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
