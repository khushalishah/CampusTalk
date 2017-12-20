package controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONObject;
import dao.AndroidDao;
import dao.AnswerDao;
import dao.CTDao;
import dao.ComplainDao;
import dao.FeedbackDao;
import dao.QuestionDao;
import implementation.Complain;
import vo.AnswerVo;
import vo.BlogsVo;
import vo.ComplainVo;
import vo.DocumentsVo;
import vo.EventsVo;
import vo.FeedbackVo;
import vo.NoticeVo;
import vo.QuestionVo;
import vo.RegVo;

/**
 * Servlet implementation class AndroidServiceServlet
 */
@WebServlet("/AndroidServices")
public class AndroidServiceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AndroidServiceServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("application/json");
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		String operation = request.getParameter("operation");
		long enrollment;

		AndroidDao dao = new AndroidDao();
		dao.createSession();
		JSONObject rootObject = new JSONObject();

		if (dao.authenticateUser(username, password)) {
			try {
				rootObject.put("login", "Success");
				switch (operation) {
				case "login":
					RegVo studentDetails = dao.getStudentDetails(username, password);
					enrollment = studentDetails.getRegistration_enrollment();
					buildStudentDetailsJSON(rootObject, studentDetails);
					break;

				case "notice":
					String noticeType = request.getParameter("noticeType");
					int pageNo = Integer.parseInt(request.getParameter("pageNo"));
					String notSem = request.getParameter("semester");
					int totalPages = dao.getTotalPageNOForNotice(noticeType, notSem);
					rootObject.put("totalPages", totalPages);
					rootObject.put("pageNo", pageNo);
					List<NoticeVo> noticeList = dao.getNotices(noticeType, notSem, pageNo);
					buildNoticesJSON(rootObject, noticeList);
					break;

				case "blog":
					if (request.getParameterMap().containsKey("id")) {
						String id = request.getParameter("id");
						String desc = dao.getBlogDescription(id);
						rootObject.put("id", id);
						rootObject.put("desc", desc);
					} else {
						String category = request.getParameter("category");
						int pageNo1 = Integer.parseInt(request.getParameter("pageNo"));
						int totalPages1 = dao.getTotalPageNOForBlog(category);
						rootObject.put("totalPages", totalPages1);
						rootObject.put("pageNo", pageNo1);
						List<BlogsVo> blogsList = dao.getBlogs(category, pageNo1);
						buildBlogsJSON(rootObject, blogsList);
					}
					break;
				case "event":
					int pageNo2 = Integer.parseInt(request.getParameter("pageNo"));
					int totalPages2 = dao.getTotalPageNOForEvent();
					rootObject.put("totalPages", totalPages2);
					rootObject.put("pageNo", pageNo2);
					List<EventsVo> eventsList = dao.getEvents(pageNo2);
					buildEventsJSON(rootObject, eventsList);
					break;

				case "students":
					int pageNo3 = Integer.parseInt(request.getParameter("pageNo"));
					String name = request.getParameter("name");
					String department = request.getParameter("department");
					String semester = request.getParameter("semester");
					int totalPages3 = dao.getTotalPageNOForStudents(name, department, semester);
					rootObject.put("totalPages", totalPages3);
					rootObject.put("pageNo", pageNo3);
					List<RegVo> studentList = dao.getStudents(pageNo3, name, department, semester);
					buildStudentsJSON(rootObject, studentList);
					break;

				case "complain":
					String stuName = request.getParameter("name");
					String stuDept = request.getParameter("department");
					int stuSemester = Integer.parseInt(request.getParameter("semester"));
					long stuEnrollment = Long.parseLong(request.getParameter("enrollment"));
					String title = request.getParameter("title");
					String description = request.getParameter("description");
					Date date = new Date();
					SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String strDate = sdf.format(date);

					ComplainVo vo = new ComplainVo(stuDept, stuEnrollment, strDate, title, description, stuSemester,
							stuName);
					CTDao ctDao = new ComplainDao();
					ctDao.insert(vo);
					break;
				case "feedback":
					String feeDept = request.getParameter("department");
					String feeDiv = request.getParameter("division");
					int feeSemester = Integer.parseInt(request.getParameter("semester"));
					String courseCode = request.getParameter("coursecode");
					String courseTitle = request.getParameter("coursetitle");
					String teacher = request.getParameter("teacher");
					String comment = request.getParameter("comment");
					int que1 = Integer.parseInt(request.getParameter("que1"));
					int que2 = Integer.parseInt(request.getParameter("que2"));
					int que3 = Integer.parseInt(request.getParameter("que3"));
					int que4 = Integer.parseInt(request.getParameter("que4"));
					int que5 = Integer.parseInt(request.getParameter("que5"));
					int que6 = Integer.parseInt(request.getParameter("que6"));
					int que7 = Integer.parseInt(request.getParameter("que7"));
					int que8 = Integer.parseInt(request.getParameter("que8"));
					int que9 = Integer.parseInt(request.getParameter("que9"));
					int que10 = Integer.parseInt(request.getParameter("que10"));
					int que11 = Integer.parseInt(request.getParameter("que11"));
					int que12 = Integer.parseInt(request.getParameter("que12"));
					int que13 = Integer.parseInt(request.getParameter("que13"));

					FeedbackVo feeVo = new FeedbackVo(feeDept, feeDiv, feeSemester, teacher, courseCode, courseTitle,
							comment, que1, que2, que3, que4, que5, que6, que7, que8, que9, que10, que11, que12, que13);
					CTDao cd = new FeedbackDao();
					cd.insert(feeVo);
					break;

				case "question":
					int pageNo4 = Integer.parseInt(request.getParameter("pageNo"));
					int totalPages4 = dao.getTotalPageNOForQuestions();
					rootObject.put("totalPages", totalPages4);
					rootObject.put("pageNo", pageNo4);
					List<QuestionVo> list = dao.getQuestions(pageNo4);
					buildQuestionJSON(rootObject, list);

				case "getanswer":
					String queID = request.getParameter("id");
					List<AnswerVo> answerList = dao.getAnswers(queID);
					buildAnswerJSON(rootObject, answerList);
					break;

				case "postanswer":
					int queId = Integer.parseInt(request.getParameter("queid"));
					String answer = request.getParameter("answer");
					String ansName = request.getParameter("name");
					String ansDept = request.getParameter("department");
					int ansSem = Integer.parseInt(request.getParameter("semester"));

					Date date1 = new Date();
					SimpleDateFormat sdf1 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String strDate1 = sdf1.format(date1);

					AnswerVo ansVo = new AnswerVo(queId, answer, ansSem, ansDept, ansName, strDate1);
					CTDao dv = new AnswerDao();
					dv.insert(ansVo);
					break;

				case "postquestion":
					String que = request.getParameter("que");
					String queDept = request.getParameter("department");
					int queSem = Integer.parseInt(request.getParameter("semester"));
					String queName = request.getParameter("name");
					long queEnroll = Long.parseLong(request.getParameter("enrollment"));

					Date date2 = new Date();
					SimpleDateFormat sdf2 = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
					String strDate2 = sdf2.format(date2);

					QuestionVo qvo = new QuestionVo(queDept, queSem, queName, queEnroll, que, strDate2);
					cd = new QuestionDao();
					cd.insert(qvo);
					break;
					
				case "documents":
					String docEnroll = request.getParameter("enrollment");
					DocumentsVo docvo = dao.getDocuments(docEnroll);
					buildDocumentsJSON(rootObject,docvo);
					break;

				default:
					break;
				}

			} catch (Exception e) {
				e.printStackTrace();
			}
		} else {
			try {
				rootObject.put("login", "Failure");
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		dao.closeSession();
		response.getWriter().append(rootObject.toString());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	void buildStudentDetailsJSON(JSONObject jsonObject, RegVo vo) throws Exception {
		jsonObject.put("name", vo.getRegistration_name());
		jsonObject.put("gender", vo.getRegistration_gender());
		jsonObject.put("department", vo.getRegistration_department());
		jsonObject.put("semester", vo.getRegistration_semester());
		jsonObject.put("enrollment", vo.getRegistration_enrollment());
		jsonObject.put("passingyear", vo.getRegistration_passingyear());
		jsonObject.put("email", vo.getRegistration_email());
		jsonObject.put("phone", vo.getRegistration_phone());
		jsonObject.put("altphone", vo.getRegistration_alternatePhone());
		jsonObject.put("imagePath", vo.getRegistration_profilePic());
		jsonObject.put("trainingDetails", vo.getRegistration_tdetails());
		jsonObject.put("projectDetails", vo.getRegistration_pdetails());
		jsonObject.put("otherDetails", vo.getRegistration_odetails());
		jsonObject.put("dob", vo.getRegistration_date());

		String department = vo.getRegistration_department();
		int deptid = 0;

		switch (department) {

		case "Mechanical":
			deptid = 123001;
			break;
		case "Electrical":
			deptid = 123002;
			break;
		case "Civil":
			deptid = 123003;
			break;
		case "Computer":
			deptid = 123004;
			break;
		case "IT":
			deptid = 123005;
			break;
		case "Bio Medical":
			deptid = 123006;
			break;
		case "E&C":
			deptid = 123007;
			break;
		case "Textile":
			deptid = 123008;
			break;
		case "Environment":
			deptid = 123009;
			break;
		case "Chemical":
			deptid = 123010;
			break;
		case "Rubber":
			deptid = 123011;
			break;
		case "Plastic":
			deptid = 123012;
			break;
		case "I&C":
			deptid = 123013;
			break;
		case "Applied Mechanics":
			deptid = 123014;
			break;

		default:
			break;
		}

		jsonObject.put("deptid", deptid);
	}

	void buildNoticesJSON(JSONObject jsonObject, List<NoticeVo> list) {
		try {
			JSONArray jsonArray = new JSONArray();
			for (NoticeVo vo : list) {
				JSONObject noticeJson = new JSONObject();
				noticeJson.put("title", vo.getNotice_title());
				noticeJson.put("id", vo.getNotice_id());
				noticeJson.put("enroll", vo.getNotice_fEnrollment());
				noticeJson.put("filePath", vo.getNotice_document());
				noticeJson.put("date", vo.getNotice_startDate());
				noticeJson.put("desc", vo.getNotice_description());
				noticeJson.put("semester", vo.getNotice_semester());

				jsonArray.put(noticeJson);
			}
			jsonObject.put("notices", jsonArray);
		} catch (Exception e) {
		}
	}

	void buildBlogsJSON(JSONObject jsonObject, List<BlogsVo> list) throws Exception {

		JSONArray jsonArray = new JSONArray();
		for (BlogsVo vo : list) {
			JSONObject blogJson = new JSONObject();
			blogJson.put("category", vo.getBlog_category());
			blogJson.put("imagePath", vo.getBlog_file());
			blogJson.put("title", vo.getBlog_title());
			blogJson.put("id", vo.getBlog_id());
			blogJson.put("date", vo.getBlog_date());
			blogJson.put("enroll", vo.getBlog_enrollment());
			blogJson.put("name", vo.getBlog_name());

			jsonArray.put(blogJson);

		}
		jsonObject.put("blogs", jsonArray);
	}

	void buildEventsJSON(JSONObject jsonObject, List<EventsVo> list) throws Exception {

		JSONArray jsonArray = new JSONArray();

		for (EventsVo vo : list) {
			JSONObject eventsJson = new JSONObject();
			eventsJson.put("title", vo.getEvent_title());
			eventsJson.put("id", vo.getEvent_id());
			eventsJson.put("imagePath", vo.getEvent_document());
			eventsJson.put("startdate", vo.getEvent_startDate());
			eventsJson.put("enddate", vo.getEvent_endDate());
			eventsJson.put("time", vo.getEvent_time());
			eventsJson.put("desc", vo.getEvent_description());

			jsonArray.put(eventsJson);
		}

		jsonObject.put("events", jsonArray);
	}

	void buildStudentsJSON(JSONObject jsonObject, List<RegVo> list) throws Exception {

		JSONArray jsonArray = new JSONArray();

		for (RegVo vo : list) {
			JSONObject studentJson = new JSONObject();
			studentJson.put("name", vo.getRegistration_name());
			studentJson.put("gender", vo.getRegistration_gender());
			studentJson.put("department", vo.getRegistration_department());
			studentJson.put("semester", vo.getRegistration_semester());
			studentJson.put("enrollment", vo.getRegistration_enrollment());
			studentJson.put("passingyear", vo.getRegistration_passingyear());
			studentJson.put("email", vo.getRegistration_email());
			studentJson.put("phone", vo.getRegistration_phone());
			studentJson.put("altphone", vo.getRegistration_alternatePhone());
			studentJson.put("imagePath", vo.getRegistration_profilePic());
			studentJson.put("trainingDetails", vo.getRegistration_tdetails());
			studentJson.put("projectDetails", vo.getRegistration_pdetails());
			studentJson.put("otherDetails", vo.getRegistration_odetails());
			studentJson.put("dob", vo.getRegistration_date());

			jsonArray.put(studentJson);

		}

		jsonObject.put("students", jsonArray);
	}

	void buildQuestionJSON(JSONObject jsonObject, List<QuestionVo> list) throws Exception {

		JSONArray jsonArray = new JSONArray();

		for (QuestionVo vo : list) {

			JSONObject queJson = new JSONObject();

			queJson.put("que", vo.getQuestion_title());
			queJson.put("id", vo.getQuestion_id());
			queJson.put("date", vo.getQuestion_date());
			queJson.put("name", vo.getQuestion_name());
			queJson.put("department", vo.getQuestion_department());
			queJson.put("semester", vo.getQuestion_semester());

			jsonArray.put(queJson);
		}

		jsonObject.put("questions", jsonArray);
	}

	void buildAnswerJSON(JSONObject jsonObject, List<AnswerVo> list) throws Exception {

		JSONArray jsonArray = new JSONArray();

		for (AnswerVo vo : list) {

			JSONObject answerJson = new JSONObject();

			answerJson.put("ans", vo.getAnswer());
			answerJson.put("id", vo.getAnsID());
			answerJson.put("queid", vo.getQueID());
			answerJson.put("date", vo.getDate());
			answerJson.put("department", vo.getDepartment());
			answerJson.put("semester", vo.getSemester());
			answerJson.put("name", vo.getName());

			jsonArray.put(answerJson);
		}

		jsonObject.put("answers", jsonArray);
	}
	
	void buildDocumentsJSON(JSONObject jsonObject,DocumentsVo vo) throws Exception{
		
		jsonObject.put("10th", vo.getDocument_10th());
		jsonObject.put("12th", vo.getDocument_12th());
		jsonObject.put("sem1", vo.getDocument_sem1());
		jsonObject.put("sem2", vo.getDocument_sem2());
		jsonObject.put("sem3", vo.getDocument_sem3());
		jsonObject.put("sem4", vo.getDocument_sem4());
		jsonObject.put("sem5", vo.getDocument_sem5());
		jsonObject.put("sem6", vo.getDocument_sem6());
		jsonObject.put("sem7", vo.getDocument_sem7());
		jsonObject.put("sem8", vo.getDocument_sem8());
		jsonObject.put("birthcertificate", vo.getDocument_birthC());
		jsonObject.put("license", vo.getDocument_drivingL());
		jsonObject.put("uniqueid", vo.getDocument_uniqueId());
		jsonObject.put("clgid", vo.getDocument_clgId());
		jsonObject.put("photo", vo.getDocument_photo());
		jsonObject.put("sign", vo.getDocument_sign());
		jsonObject.put("ohterdoc", vo.getDocument_other());
		
	}

}
