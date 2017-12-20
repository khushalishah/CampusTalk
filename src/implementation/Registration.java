package implementation;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import controller.CTInterface;
import dao.CTDao;
import dao.RegDao;
import vo.PathResourse;
import vo.RegVo;

public class Registration implements CTInterface {
	CTDao cd = new RegDao();

	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String registration_name = request.getParameter("registration_name");
		String registration_gender = request.getParameter("registration_gender");
		String registration_date = request.getParameter("registration_date");
		String registration_profilePic = request.getParameter("document");
		String registration_email = request.getParameter("registration_email");
		String registration_phone = request.getParameter("registration_phone");
		String registration_alternatePhone = request.getParameter("registration_alternatePhone");
		String registration_uname = request.getParameter("registration_uname");
		String registration_password = request.getParameter("registration_password");
		long registration_enrollment = Long.parseLong(request.getParameter("registration_enrollment"));
		int registration_passingyear = Integer.parseInt(request.getParameter("registration_passingyear"));
		String registration_odetails = request.getParameter("registration_odetails");
		String registration_tdetails = request.getParameter("registration_tdetails");
		String registration_pdetails = request.getParameter("registration_pdetails");
		String registration_department = request.getParameter("registration_department");
		int registration_semester = Integer.parseInt(request.getParameter("registration_semester"));
		UploadFile uf = new UploadFile();
	
			try {
				String path = PathResourse.path+"Student\\"+registration_enrollment;
				registration_profilePic = uf.uploadFile(request, path,"document");
			} catch (Exception e) {
				e.printStackTrace();
		
		}

		RegVo rv = new RegVo(registration_name, registration_gender, registration_date, registration_profilePic,
				registration_email, registration_phone, registration_alternatePhone, registration_uname,
				registration_password, registration_enrollment, registration_passingyear, registration_odetails,
				registration_tdetails, registration_pdetails, registration_department, registration_semester);
		cd.insert(rv);
		try {
			response.sendRedirect("User/registrationSuccessful.jsp");
		} catch (Exception e) {
		}

	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		long id = Long.parseLong(request.getParameter("id"));
		cd.delete(id);
		try {

			response.sendRedirect(request.getContextPath() + "/CTServlet?type=registration&operation=view");
		} catch (Exception e) {
		}

	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		// long id=Long.parseLong(request.getParameter("id"));
		HttpSession session = request.getSession();
		long id = (long) session.getAttribute("enrollment");

		String type = (String) session.getAttribute("type");
		try {
			if (id == 12589 && type.equals("super admin")) {
				ArrayList<RegVo> list = (ArrayList) ((RegDao) cd).viewAll();
				session.setAttribute("list_studentDetails", list);
				response.sendRedirect("Admin/regsearch.jsp");
			} else {
				String showcount = request.getParameter("showcount");
				String search=request.getParameter("search");
				if (showcount.equals("Self")) {
					ArrayList<RegVo> list = (ArrayList) cd.view(id);
					session.setAttribute("list_studentDetails", list);
					response.sendRedirect("User/registration_edit_UI.jsp");
				} else {
					// write code for view registration details in view student
					// details
					if(search.equals("0")){
					ArrayList<RegVo> list = (ArrayList) ((RegDao) cd).viewAll();
					session.setAttribute("list_studentDetails", list);
					// write redirect to view profiles page
					response.sendRedirect("User/viewProfile_UI.jsp");
					}
					else{
						String sem=request.getParameter("Semester");
						String Dept = request.getParameter("Department");
						String name = request.getParameter("Name");
						ArrayList<RegVo> list = (ArrayList)((RegDao)cd).search(sem,Dept,name);
						session.setAttribute("list_studentDetails", list);
						response.sendRedirect("User/viewProfile_UI.jsp");
					}
				}
			}

		} catch (Exception e) {
		}
	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

		String registration_name = request.getParameter("registration_name");
		String registration_gender = request.getParameter("registration_gender");
		String registration_date = request.getParameter("registration_date");
		String registration_profilePic = request.getParameter("document");
		String registration_email = request.getParameter("registration_email");
		String registration_phone = request.getParameter("registration_phone");
		String registration_alternatePhone = request.getParameter("registration_alternatePhone");
		String registration_uname = request.getParameter("registration_uname");
		String registration_password = request.getParameter("registration_password");
		long registration_enrollment = Long.parseLong(request.getParameter("registration_enrollment"));
		int registration_passingyear = Integer.parseInt(request.getParameter("registration_passingyear"));
		String registration_odetails = request.getParameter("registration_odetails");
		String registration_tdetails = request.getParameter("registration_tdetails");
		String registration_pdetails = request.getParameter("registration_pdetails");
		String registration_department = request.getParameter("registration_department");
		int registration_semester = Integer.parseInt(request.getParameter("registration_semester"));

		try {
			String path = PathResourse.path+"Student\\"+registration_enrollment;
			registration_profilePic = new UploadFile().uploadFile(request, path,"document");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			System.out.println("pic" + registration_profilePic);
		}

		RegVo rv = new RegVo(registration_name, registration_gender, registration_date, registration_profilePic,
				registration_email, registration_phone, registration_alternatePhone, registration_uname,
				registration_password, registration_enrollment, registration_passingyear, registration_odetails,
				registration_tdetails, registration_pdetails, registration_department, registration_semester);

		cd.edit(rv);
		try {
			response.sendRedirect("User/home_UI.jsp");
		} catch (Exception e) {
		}
	}

}
