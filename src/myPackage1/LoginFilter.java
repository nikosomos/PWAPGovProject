package myPackage1;

import java.io.IOException;
import java.util.ArrayList;
import java.util.StringTokenizer;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class Login
 */
@WebFilter("/Login")
public class LoginFilter implements Filter {

	private ArrayList<String> urlList;
	
    /**
     * Default constructor. 
     */
    public LoginFilter() {
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
		
		String url = req.getServletPath();		
		
		HttpSession session = req.getSession();
		
		if (session.getAttribute("userError") == null){
			session.setAttribute("userError", false);
		}
		
		if (!(urlList.contains(url)) && session.getAttribute("username") == null){
			System.out.println("first" + url);
			res.sendRedirect("Login.jsp");
			return;
		} else if (urlList.contains(url) && session.getAttribute("username") != null){
			System.out.println("second" + url);
			res.sendRedirect("UserTypeFilter");
			return;
		}
		System.out.println("third" + url);
		// pass the request along the filter chain
		chain.doFilter(req, res);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		String urls = fConfig.getInitParameter("avoid-urls");
		StringTokenizer token = new StringTokenizer(urls, ",");

		urlList = new ArrayList<String>();

		while (token.hasMoreTokens()) {
			urlList.add(token.nextToken());

		}
	}

}
