package implementation;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import org.apache.catalina.connector.Request;

import controller.CTInterface;
import dao.CTDao;
import dao.NoticeDao;
import vo.NoticeVo;
import vo.RegVo;

public class Notice implements CTInterface {
	CTDao cd = new NoticeDao();
	HttpSession session;
	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		 session = request.getSession(false);
		// TODO Auto-generated method stub
		String notice_semester=request.getParameter("notice_semester");
		long notice_fEnrollment = (long)(session.getAttribute("enrollment"));
		String notice_title = request.getParameter("notice_title");
		String notice_startDate = request.getParameter("notice_startDate");
		String notice_endDate = request.getParameter("notice_endDate");
		String notice_document=request.getParameter("document");
		String notice_description = request.getParameter("notice_description");
		UploadFile uf=new UploadFile();
		SimpleDateFormat sdf= new SimpleDateFormat("EEE, dd MMMM yyyy");
		Date strtdate = null;
		Date endate=null;
		try {
			strtdate = sdf.parse(notice_startDate);
			endate=sdf.parse(notice_endDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startdate = sdf.format(strtdate);
		String enddate=sdf.format(endate);
		try
		{
			notice_document=uf.uploadFile(request, "C:\\campustalk\\Notice","document");
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		NoticeVo notices = new NoticeVo(notice_semester,notice_fEnrollment, notice_title,startdate,
				enddate,notice_document, notice_description);
		cd.insert(notices);
		// code for uploading document
		try {
			response.sendRedirect("Admin/notice.jsp?msg=success");
		} catch (Exception e) {
		}
	}
	// TODO Auto-generated method stub

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession(false);
		int id = Integer.parseInt(request.getParameter("id"));
		
		String fid = request.getParameter("fid");
		System.out.println(fid);
		cd.delete(id);
		try {
			response.sendRedirect(request.getContextPath() + "/CTServlet?type=notice&operation=view&id="+fid);
		} catch (Exception e) {
		}

	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("id"));
		HttpSession session = request.getSession(false);
		String type = (String) session.getAttribute("type");
		try{
		if(type.equals("user"))
		{
			int department=0;
			if(id==0)
			{
		    RegVo rv=(RegVo)session.getAttribute("RegObj");
		    String dept=rv.getRegistration_department();
		    String sem=rv.getRegistration_semester()+"";
		    switch(dept)
		    {
		    case "Mechanical":department=123001;
		    break;
		    case "Electrical":department=123002;
		    break;
		    case "Civil":department=123003;
		    break;
		    case "Computer":department=123004;
		    break;
		    case "IT":department=123005;
		    break;
		    case "Bio Medical":department=123006;
		    break;
		    case "E&C":department=123007;
		    break;
		    case "Textile":department=123008;
		    break;
		    case "Environment":department=123009;
		    break;
		    case "Chemical":department=123010;
		    break;
		    case "Rubber":department=123011;
		    break;
		    case "Plastic":department=123012;
		    break;
		    case "I&C":department=123013;
		    break;
		    case "Applied Mechanics":department=123014;
		    break;
		    
		    }
		    ArrayList<NoticeVo> li = (ArrayList)((NoticeDao)cd).view(department,sem);
		    session.setAttribute("list", li);
		    response.sendRedirect("User/notice_UI.jsp");
			}
			else
			{
				ArrayList<NoticeVo> list = (ArrayList) cd.view(id);
				session.setAttribute("list", list);
				response.sendRedirect("User/notice_UI.jsp");	
			}
		}
		else {
			        
			    ArrayList<NoticeVo> list = (ArrayList) cd.view(id);
			    session.setAttribute("list", list);
				response.sendRedirect("Admin/noticesearch.jsp");
		}
		}
		catch (Exception e) {
		}
	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession(false);
		// TODO Auto-generated method stub
		int id = Integer.parseInt(request.getParameter("id"));
		long notice_fEnrollment = Long.parseLong(request.getParameter("fid"));
		String notice_semester=request.getParameter("notice_semester");
		//long notice_fEnrollment = (long)session.getAttribute("enrollment");
		String notice_title = request.getParameter("notice_title");
		String notice_startDate = request.getParameter("notice_startDate");
		String notice_endDate = request.getParameter("notice_endDate");
		String notice_document = request.getParameter("document");
		String notice_description = request.getParameter("notice_description");
		UploadFile uf=new UploadFile();
		//String document="";
		SimpleDateFormat sdf= new SimpleDateFormat("EEE, dd MMMM yyyy");
		Date strtdate = null;
		Date endate=null;
		try {
			strtdate = sdf.parse(notice_startDate);
			endate=sdf.parse(notice_endDate);
		} catch (ParseException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		sdf = new SimpleDateFormat("yyyy-MM-dd");
		String startdate = sdf.format(strtdate);
		String enddate=sdf.format(endate);
		try
		{
			notice_document=uf.uploadFile(request, "C:\\campustalk\\Notice","document");
			
		}catch(Exception e)
		{
			e.printStackTrace();
		}
		NoticeVo nv = new NoticeVo(id,notice_semester, notice_fEnrollment, notice_title,startdate,
				enddate,notice_document, notice_description);

		cd.edit(nv);
		try {
			response.sendRedirect(request.getContextPath() + "/CTServlet?type=notice&operation=view&id="+notice_fEnrollment);
		} catch (Exception e) {
		}

	}

}
