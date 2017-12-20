package implementation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.AnswerDao;
import dao.CTDao;
import dao.QuestionDao;
import vo.AnswerVo;
import vo.RegVo;

public class Answer implements CTInterface{
	
	CTDao cd=new AnswerDao();

	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		RegVo regVo = (RegVo) session.getAttribute("RegObj");
		int semester = regVo.getRegistration_semester();
		String department = regVo.getRegistration_department();
		String name = regVo.getRegistration_name();
		String answer = request.getParameter("answer");
		int queID = Integer.parseInt(request.getParameter("queID"));
		
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		Date date = new Date();
		String ansDate = sdf.format(date);
		
		AnswerVo vo = new AnswerVo(queID, answer, semester, department, name, ansDate);
		
		cd.insert(vo);
		
		try{
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=question&operation=view");
		}catch(Exception e){
			
		}
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		cd.delete(id);
		try{
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=answer&operation=view");
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
		ArrayList list = new ArrayList<>();
		list = (ArrayList) cd.view(0);
		HttpSession session = request.getSession();
		session.setAttribute("list", list);
		try{
			response.sendRedirect("Admin/answersearch.jsp");
		}catch(Exception e){}
		
	}

	
}
