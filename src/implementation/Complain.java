package implementation;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.CTDao;
import dao.ComplainDao;
import vo.ComplainVo;

public class Complain implements CTInterface {

	CTDao cd = new ComplainDao();

	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		String complain_department = request.getParameter("complain_department");
		int complain_semester = Integer.parseInt(request.getParameter("complain_semester"));
		String complain_name = request.getParameter("complain_name");
		long complain_enrollment = Long.parseLong(request.getParameter("complain_enrollment"));
		String complain_title = request.getParameter("complain_title");
		String complain_description = request.getParameter("complain_description");
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String d=sdf.format(date);
		ComplainVo cv = new ComplainVo(complain_department, complain_enrollment,d, complain_title, complain_description,
				complain_semester, complain_name);
		cd.insert(cv);
		try {
			response.sendRedirect("User/complain_UI.jsp?msg=success");
		} catch (Exception e) {
		}

	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		cd.delete(id);
		try {
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=complain&operation=view&id=123");
		} catch (Exception e) {
		}

	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		String complain_department = request.getParameter("complain_department");
		int complain_semester = Integer.parseInt(request.getParameter("complain_semester"));
		String complain_name = request.getParameter("complain_name");
		long complain_enrollment = Long.parseLong(request.getParameter("complain_enrollment"));
		String complain_title = request.getParameter("complain_title");
		String complain_description = request.getParameter("complain_description");
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String d=sdf.format(date);
		ComplainVo cv = new ComplainVo(id, complain_department, complain_enrollment,d, complain_title,
				complain_description, complain_name, complain_semester);
		cd.edit(cv);
		try {
			response.sendRedirect(request.getContextPath()+"/CTServlet?type=complain&operation=view&id="+complain_enrollment);
		} catch (Exception e) {
		}

	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("id"));
		ArrayList<ComplainVo> list = (ArrayList) cd.view(id);
		HttpSession session = request.getSession();
		session.setAttribute("list1", list);
		try {
				response.sendRedirect("Admin/complainsearch.jsp");	
		} catch (Exception e) {
		}
	}

}
