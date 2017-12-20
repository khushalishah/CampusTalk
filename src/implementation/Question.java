package implementation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.CTDao;
import dao.QuestionDao;
import vo.QuestionVo;
import vo.RegVo;

public class Question implements CTInterface {
	
	CTDao cd=new QuestionDao();
	@Override
	public void insert(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		RegVo regVo = (RegVo) session.getAttribute("RegObj");
		String question_department=regVo.getRegistration_department();
		int question_semester=regVo.getRegistration_semester();
		String question_name=regVo.getRegistration_name();
		long question_enrollment=regVo.getRegistration_enrollment();
		String question_title=request.getParameter("que_title");
		
		Date date= new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String question_date=sdf.format(date);
		
		QuestionVo qv=new QuestionVo(question_department,  question_semester,
				question_name, question_enrollment,
				question_title,question_date);
     	cd.insert(qv);
		try{
		response.sendRedirect(request.getContextPath()+"/CTServlet?type=question&operation=view");
		}
		catch(Exception e){}
		
		
	}

	@Override
	public void delete(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		cd.delete(id);
		try{
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=question&operation=view&id=123");
			}
			catch(Exception e){}
		
	}

	@Override
	public void view(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		long id=(long) request.getSession().getAttribute("enrollment");
		ArrayList list;
		if(request.getParameterMap().containsKey("search")){
			String searchParameter=request.getParameter("search");
			list=(ArrayList)((QuestionDao)cd).viewAll(searchParameter);

		}else if(id==12589){
			list = (ArrayList) cd.view(id);
		}
		else{
			list=(ArrayList)((QuestionDao)cd).viewAll("");
		}
		HttpSession session = request.getSession();
		session.setAttribute("list",list);
		try{
			if(id==12589)
			{
		      response.sendRedirect("Admin/questionsearch.jsp");
			}
			else
				response.sendRedirect("User/que_Ans_UI.jsp");
		}
		catch(Exception e){}
	}

	@Override
	public void edit(HttpServletRequest request,HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		QuestionVo qv=new QuestionVo().getInstance(id);
		cd.edit(qv);
		try{
			response.sendRedirect("Admin/question.jsp");
			}
			catch(Exception e){}
	}

}
