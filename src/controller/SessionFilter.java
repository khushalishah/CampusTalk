package controller;

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
import javax.servlet.http.HttpSession;

/**
 * Servlet Filter implementation class SessionFilter
 */
@WebFilter({"/Admin/*","/User/*","/CTServlet/*"})
public class SessionFilter implements Filter {

	/**
	 * Default constructor.
	 */
	public SessionFilter() {
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
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		System.out.println("filtering...");
		HttpServletRequest req = (HttpServletRequest) request;
		HttpSession session = req.getSession();

		String url = req.getServletPath();
		
		boolean isLoginPage = url.indexOf("login")>0 || url.indexOf("registration_UI")>0 || url.indexOf("registrationSuccessful.jsp")>0;

		//boolean isLoginPage = url.indexOf("login") > 0 || url.indexOf("LoginServlet") > 0;
		
		/*boolean isJSOrCss = url.indexOf(".js") > 0 || url.indexOf(".css") > 0 || url.indexOf("font") > 0
				|| url.indexOf("images") > 0;

		boolean isAndroidService = url.indexOf("Android") > 0 || url.indexOf("ImageServlet") > 0
				|| url.indexOf("DownloadServlet") > 0;*/

		boolean isRegister = false;
		
		if(req.getParameterMap().containsKey("type")){
			
			if(req.getParameter("type").equals("registration") && req.getParameter("operation").equals("insert")){
				System.out.println("Regi page");
				isRegister=true;
			}
			
		} 

		/*if (!isAndroidService) {
			if (!isJSOrCss) {
				if (!isLoginPage) {
					if (!isRegister) {

						System.out.println("request is not from login page");

						if (session.getAttribute("enrollment") == null) {

							System.out.println("session not found...");
							HttpServletResponse res = (HttpServletResponse) response;

							res.sendRedirect("User/login.jsp");
							// return;

						} else {

							// pass the request along the filter chain
							chain.doFilter(request, response);
						}
					} else {
						chain.doFilter(request, response);
					}
				} else {

					// pass the request along the filter chain
					chain.doFilter(request, response);
				}
			} else {

				// pass the request along the filter chain
				chain.doFilter(request, response);
			}
		} else {

			// pass the request along the filter chain
			chain.doFilter(request, response);
		}*/
		
		if(!isLoginPage){
			if(!isRegister){
				if (session.getAttribute("enrollment") == null) {

					System.out.println("session not found...");
					HttpServletResponse res = (HttpServletResponse) response;

					res.sendRedirect("User/login.jsp");
					return;
				}
			}
		}
		chain.doFilter(request, response);

	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub
	}

}
