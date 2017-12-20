package controller;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import implementation.Login_DB_Admin;

/**
 * Servlet implementation class ChangePwdServlet
 */
@WebServlet("/ChangePwdServlet")
public class ChangePwdServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       HttpSession session;
       Login_DB_Admin lda=new Login_DB_Admin();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ChangePwdServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		session=request.getSession(false);
		String opwd=request.getParameter("opwd");
		String npwd=request.getParameter("npwd");
		String uname=request.getParameter("id");
		String matchdpwd=lda.getPwd(uname);
		if(opwd.equals(matchdpwd))
		{
			lda.setpwd(npwd,uname);
			
			response.sendRedirect("Admin/changePassword.jsp?msg=success");
			
		}
		else{
			response.sendRedirect("Admin/changePassword.jsp?msg=error");
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
