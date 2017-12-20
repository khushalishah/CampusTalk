package controller;


import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.BlogDao;
import dao.CTDao;
import dao.EventsDao;
import dao.GetRegObj;
import dao.NoticeDao;
import implementation.Login_DB;
import implementation.Login_DB_Admin;
import vo.BlogsVo;
import vo.RegVo;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	HttpSession session;
	Login_DB ld=new Login_DB();
	Login_DB_Admin lda=new Login_DB_Admin();
    /**
     * @see HttpServlet#HttpServlet()
     */
    public LoginServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//response.getWriter().append("Served at: ").append(request.getContextPath());
		String matchpwd,usertype;
		String user=request.getParameter("username");
		String pwd=request.getParameter("password");
		String type=request.getParameter("type");
		if(type.equals("Admin"))
		{
			matchpwd=lda.getPwd(user);
			usertype=lda.getType(user);
		}
		else
		{
			matchpwd=ld.getPwd(user);
			usertype="user";
			System.out.println("coming");
		}
		
		if(pwd.equals(matchpwd))
		{
			long eid=Long.parseLong(user);
			GetRegObj gro=new GetRegObj();
			RegVo rv = gro.getRegObj(eid);
			session=request.getSession();
			session.setAttribute("who", type);
			session.setAttribute("enrollment", eid);
			session.setAttribute("type", usertype);
			session.setAttribute("RegObj", rv);
			session.setMaxInactiveInterval(30*60);
			BlogDao bd=new BlogDao();
			List<Object> latestBlogs = bd.view(3,1);
			session.setAttribute("latest blogs", latestBlogs);
		    NoticeDao dao = new NoticeDao();
		    List<Object> latestNotices = dao.view(3, 1);
		    session.setAttribute("latestNotices", latestNotices);
		     if(type.equals("Admin"))
				response.sendRedirect("Admin/firstPage.jsp");
			else{				
				response.sendRedirect("User/home_UI.jsp");
				RegVo regv = (RegVo) session.getAttribute("RegObj");
			}
		}
		else
		{
			if(type.equals("Admin")){
			response.sendRedirect("Admin/login_Admin.jsp?msg=error");
			}
			else{
				response.sendRedirect("User/login.jsp?msg=error");
			}
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
