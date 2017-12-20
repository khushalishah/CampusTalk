package implementation;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import controller.CTInterface;
import dao.CTDao;
import dao.DocumentsDao;
import vo.DocumentsVo;

public class Documents implements CTInterface {

	CTDao cd = new DocumentsDao();

	@Override
	public void insert(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		UploadFile up = new UploadFile();
		HttpSession session = request.getSession();
		long enrollment = (long) session.getAttribute("enrollment");
		String document_photo = null;
		String document_sign = null;
		String document_10th = null;
		String document_12th = null;
		String document_sem1 = null;
		String document_sem2 = null;
		String document_sem3 = null;
		String document_sem4 = null;
		String document_sem5 = null;
		String document_sem6 = null;
		String document_sem7 = null;
		String document_sem8 = null;
		String document_clgId = null;
		String document_uniqueId = null;
		String document_drivingL = null;
		String document_birthC = null;
		String document_other = null;

		try {
			document_photo = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_profilePic");
			document_sign = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sign");
			document_10th = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_10M");
			document_12th = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_12M");
			document_sem1 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem1M");
			document_sem2 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem2M");
			document_sem3 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem3M");
			document_sem4 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem4M");
			document_sem5 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem5M");
			document_sem6 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem6M");
			document_sem7 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem7M");
			document_sem8 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem8M");
			document_clgId = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_collegeID");
			document_uniqueId = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_uniqueID");
			document_drivingL = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment,
					"document_drivingLicense");
			document_birthC = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_birthCerti");
			document_other = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_otherDocument");

		} catch (Exception e) {
			e.printStackTrace();
		}
		DocumentsDao docDao = (DocumentsDao) cd;
		if (docDao.areDocumentsAvailable(enrollment)) {
			//edit query
			edit(request,response);
		}else{
			//insert query
			DocumentsVo dv = new DocumentsVo(enrollment, document_photo, document_sign, document_10th,
					document_12th, document_sem1, document_sem2, document_sem3, document_sem4, document_sem5,
					document_sem6, document_sem7, document_sem8, document_clgId, document_uniqueId, document_drivingL,
					document_birthC, document_other);
			cd.insert(dv);
		}
		try {
			response.sendRedirect("User/home_UI.jsp");
		} catch (Exception e) {
		}
	}

	@Override
	public void delete(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub

	}

	@Override
	public void edit(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		long enrollment = (long) session.getAttribute("enrollment");
		
		UploadFile up = new UploadFile();
		
		String document_photo = null;
		String document_sign = null;
		String document_10th = null;
		String document_12th = null;
		String document_sem1 = null;
		String document_sem2 = null;
		String document_sem3 = null;
		String document_sem4 = null;
		String document_sem5 = null;
		String document_sem6 = null;
		String document_sem7 = null;
		String document_sem8 = null;
		String document_clgId = null;
		String document_uniqueId = null;
		String document_drivingL = null;
		String document_birthC = null;
		String document_other = null;

		try {
			document_photo = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_profilePic");
			document_sign = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sign");
			document_10th = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_10M");
			document_12th = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_12M");
			document_sem1 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem1M");
			document_sem2 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem2M");
			document_sem3 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem3M");
			document_sem4 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem4M");
			document_sem5 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem5M");
			document_sem6 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem6M");
			document_sem7 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem7M");
			document_sem8 = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_sem8M");
			document_clgId = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_collegeID");
			document_uniqueId = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_uniqueID");
			document_drivingL = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment,
					"document_drivingLicense");
			document_birthC = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_birthCerti");
			document_other = up.uploadFile(request, "C:\\campustalk\\Student\\" + enrollment, "document_otherDocument");
			
			DocumentsVo dv = new DocumentsVo(enrollment, document_photo, document_sign, document_10th,
					document_12th, document_sem1, document_sem2, document_sem3, document_sem4, document_sem5,
					document_sem6, document_sem7, document_sem8, document_clgId, document_uniqueId, document_drivingL,
					document_birthC, document_other);
		
		cd.edit(dv);
		}catch(Exception e){
			e.printStackTrace();
		}
	}

	@Override
	public void view(HttpServletRequest request, HttpServletResponse response) {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		long enrollment = (long) session.getAttribute("enrollment");
		ArrayList<DocumentsVo> list = (ArrayList) cd.view(enrollment);
		session.setAttribute("documentsList", list);
		try {
			response.sendRedirect("User/documentUpload_UI.jsp");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
