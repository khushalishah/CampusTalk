package implementation;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.BlogDao;
import dao.CTDao;
import vo.BlogsVo;
import vo.PathResourse;

public class Blog implements CTInterface{
	CTDao cd=new BlogDao();
	
	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response){
		// TODO Auto-generated method stub
		String blog_name=request.getParameter("blog_name");
		long blog_enrollment=Long.parseLong(request.getParameter("blog_enrollment"));
		String blog_title=request.getParameter("blog_title");
		String blog_file=request.getParameter("document");
		String blog_description=request.getParameter("blog_description");
		String blog_category=request.getParameter("blog_category");
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String d=sdf.format(date);
		UploadFile uf=new UploadFile();

		
			try
			{
			
				String path = PathResourse.path+"Blog";				
				blog_file=uf.uploadFile(request, path,"document");
			}catch(Exception e)
			{
				e.printStackTrace();
			}
		
		BlogsVo bv = new BlogsVo(blog_enrollment,blog_name,blog_title,blog_file,blog_description,d,blog_category);
		cd.insert(bv);
		try{
			response.sendRedirect("User/blogPostForm_UI.jsp?msg=success");
		}catch(Exception e){}
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		int id=Integer.parseInt(request.getParameter("id"));
		String usertype = (String) session.getAttribute("who");
		cd.delete(id);
		try{
			if(usertype.equals("Admin"))
			{
				response.sendRedirect(request.getContextPath()+"/CTServlet?type=blog&operation=view");
			}
			else if(usertype.equals("user"))
			{
				response.sendRedirect(request.getContextPath()+"/CTServlet?type=blog&operation=view&page=1&showcount=Self");
			}
			}
			catch(Exception e){}
		
	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		int id=Integer.parseInt(request.getParameter("id"));
		String blog_name=request.getParameter("blog_name");
		long blog_enrollment=Long.parseLong(request.getParameter("blog_enrollment"));
		String blog_title=request.getParameter("blog_title");
		String blog_file=request.getParameter("document");
		String blog_description=request.getParameter("blog_description");
		String blog_category=request.getParameter("blog_category");
		Date date=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
		String d=sdf.format(date);
		
		try {
			String path = PathResourse.path+"Blog";
			blog_file = new UploadFile().uploadFile(request,
					path ,"document");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("pic" + blog_file);
		}
		
		BlogsVo bv = new BlogsVo(id,blog_enrollment,blog_name,blog_title,blog_file,blog_description,d,blog_category);
		cd.edit(bv);
		HttpSession session = request.getSession();
		String usertype = (String) session.getAttribute("who");
		try{
			if(usertype.equals("Admin"))
			{
				response.sendRedirect(request.getContextPath()+"/CTServlet?type=blog&operation=view");
			}
			else if(usertype.equals("user"))
			{
				response.sendRedirect(request.getContextPath()+"/CTServlet?type=blog&operation=view&page=1&showcount=Self");
			}
		}catch(Exception e){}
		
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		ArrayList<BlogsVo> list;
		HttpSession session = request.getSession();
		Long id=(Long) session.getAttribute("enrollment");
		String type = (String) session.getAttribute("type");
		String category=(String)request.getParameter("category");
		try{
			if(id==12589 && type.equals("super admin"))
			{
				list=(ArrayList)((BlogDao)cd).viewAll("");
				session.setAttribute("list",list);
				response.sendRedirect("Admin/blogsearch.jsp");
			}
			else
			{
				String showcount=(String) request.getParameter("showcount");
				if(showcount.equals("Self"))
				{
					list=(ArrayList)cd.view(id);
					session.setAttribute("list",list);
					response.sendRedirect("User/blogPost_UI.jsp");
				}
				else 
				{
					list=(ArrayList)((BlogDao)cd).viewAll(category);
					session.setAttribute("list",list);
					response.sendRedirect("User/blogView_UI.jsp");
				}
					
			}
			}catch(Exception e){
				e.printStackTrace();
			}
		
	}
	

}
