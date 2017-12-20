package implementation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.CTDao;
import dao.FeedbackDao;
import vo.FeedbackVo;

public class Feedback implements CTInterface{
	
	CTDao cd=new FeedbackDao();

	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String department=request.getParameter("fDepartment");
		int semester=Integer.parseInt(request.getParameter("fSemester"));
		String nameOfTeacher=request.getParameter("fNameOfTeacher");
		String courseCode=request.getParameter("fCourseCode");
		String courseTitle=request.getParameter("fCourseTitle");
		String comment=request.getParameter("fComment");
		String division=request.getParameter("fDivision");
		int que1=Integer.parseInt(request.getParameter("que1"));
		int que2=Integer.parseInt(request.getParameter("que2"));
		int que3=Integer.parseInt(request.getParameter("que3"));
		int que4=Integer.parseInt(request.getParameter("que4"));
		int que5=Integer.parseInt(request.getParameter("que5"));
		int que6=Integer.parseInt(request.getParameter("que6"));
		int que7=Integer.parseInt(request.getParameter("que7"));
		int que8=Integer.parseInt(request.getParameter("que8"));
		int que9=Integer.parseInt(request.getParameter("que9"));
		int que10=Integer.parseInt(request.getParameter("que10"));
		int que11=Integer.parseInt(request.getParameter("que11"));
		int que12=Integer.parseInt(request.getParameter("que12"));
		int que13=Integer.parseInt(request.getParameter("que13"));
		
		FeedbackVo fv=new FeedbackVo(department, division, semester, nameOfTeacher, courseCode, courseTitle, comment, que1, que2, que3, que4, que5, que6, que7, que8, que9, que10, que11, que12, que13);
		cd.insert(fv);
		try{
		response.sendRedirect("User/feedback_UI.jsp?msg=success");
		}catch(Exception e){}
		
		
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		cd.delete(id);
		try{
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=feedback&operation=view");
			}
			catch(Exception e){}
	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		
		ArrayList<FeedbackVo> list=(ArrayList) cd.view(123);
		HttpSession session=request.getSession();
		session.setAttribute("feedback_list",list);
		try {
           response.sendRedirect("Admin/feedback_search.jsp");
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

}
