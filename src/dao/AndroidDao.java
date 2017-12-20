package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.AnswerVo;
import vo.BlogsVo;
import vo.DocumentsVo;
import vo.EventsVo;
import vo.NoticeVo;
import vo.QuestionVo;
import vo.RegVo;

public class AndroidDao {

	Database db;
	Session session;
	Transaction tx = null;

	public void createSession() {
		db = new Database();
		session = db.getSession();
	}

	public void closeSession() {
		db.closeSession(session);
	}

	public boolean authenticateUser(String username, String Password) {
		long count = 0;

		try {
			tx = session.beginTransaction();
			count = (long) session
					.createQuery(
							"select count(*) from RegVo where uname='" + username + "' and password='" + Password + "'")
					.uniqueResult();
			tx.commit();
			if (count == 1) {
				return true;
			}
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return false;
	}

	public RegVo getStudentDetails(String username, String password) {
		try {
			tx = session.beginTransaction();
			RegVo regVo = (RegVo) session
					.createQuery("from RegVo where uname='" + username + "' and password='" + password + "'")
					.uniqueResult();

			tx.commit();
			return regVo;
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return null;
	}

	public List<NoticeVo> getNotices(String noticeType, String semester, int pageNo) {
		List<NoticeVo> list = new ArrayList<>();
		int offset = (pageNo - 1) * 10;

		try {
			tx = session.beginTransaction();

			StringBuilder sb = new StringBuilder(
					"from NoticeVo where notice_fEnrollment=" + noticeType);

			if (!semester.equals("")) {
				sb.append(" and notice_semester=" + semester);
			}
			
			sb.append(" order by notice_startDate desc");

			Query query = session.createQuery(sb.toString());
			query.setFirstResult(offset);
			query.setMaxResults(10);
			list = (ArrayList<NoticeVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}

	public int getTotalPageNOForNotice(String noticeType, String semester) {
		long count = 0;
		int totalPageNo = 0;

		try {
			tx = session.beginTransaction();
			StringBuilder sb = new StringBuilder(
					"select count(*) from NoticeVo where notice_fEnrollment=" + noticeType);

			if (!semester.equals("")) {
				sb.append(" and notice_semester=" + semester);
			}

			count = (long) session.createQuery(sb.toString()).uniqueResult();
			tx.commit();
			totalPageNo = (int) (count / 10.0);
			if ((count % 10) != 0) {
				totalPageNo++;
			}

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return totalPageNo;
	}

	public int getTotalPageNOForBlog(String blogCategory) {
		long count = 0;
		int totalPageNo = 0;

		try {
			tx = session.beginTransaction();
			count = (long) session
					.createQuery("select count(*) from BlogsVo where blog_category='" + blogCategory + "'")
					.uniqueResult();
			tx.commit();
			totalPageNo = (int) (count / 10.0);
			if ((count % 10) != 0) {
				totalPageNo++;
			}

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return totalPageNo;
	}

	public String getBlogDescription(String id) {
		String desc = null;

		try {
			tx = session.beginTransaction();
			desc = (String) session.createQuery("select blog_description from BlogsVo where blog_id=" + id)
					.uniqueResult();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return desc;
	}

	public List<BlogsVo> getBlogs(String category, int pageNo) {
		List<BlogsVo> list = new ArrayList<>();
		int offset = (pageNo - 1) * 10;
		System.out.println(offset);

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from BlogsVo where blog_category='" + category + "' order by blog_date desc");
			query.setFirstResult(offset);
			query.setMaxResults(10);
			list = (ArrayList<BlogsVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}

	public int getTotalPageNOForEvent() {
		long count = 0;
		int totalPageNo = 0;

		try {
			tx = session.beginTransaction();
			count = (long) session.createQuery("select count(*) from EventsVo").uniqueResult();
			tx.commit();
			totalPageNo = (int) (count / 10.0);
			if ((count % 10) != 0) {
				totalPageNo++;
			}

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return totalPageNo;
	}

	public List<EventsVo> getEvents(int pageNo) {
		List<EventsVo> list = new ArrayList<>();
		int offset = (pageNo - 1) * 10;
		System.out.println(offset);

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from EventsVo order by event_startDate desc");
			query.setFirstResult(offset);
			query.setMaxResults(10);
			list = (ArrayList<EventsVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}

	public int getTotalPageNOForStudents(String name, String department, String semester) {
		long count = 0;
		int totalPageNo = 0;

		try {
			StringBuilder query = new StringBuilder("select count(*) ");
			tx = session.beginTransaction();
			if (!name.equals("") || !semester.equals("") || !department.equals("")) {
				query.append("from RegVo where ");
				if (!semester.equals("")) {
					query.append("registration_semester=" + semester );
				}
				if(!department.equals("")){
					if(!semester.equals("")){
						query.append(" and ");
					}
				query.append("registration_department='" + department +"'");
				}
				
				if(!name.equals("")){
					if(!semester.equals("") || !department.equals("")){
						query.append(" and ");
					}
					query.append("registration_name like '%" + name + "%'");
				}
			} else {
				query.append("from RegVo");
			}

			count = (long) session.createQuery(query.toString()).uniqueResult();
			tx.commit();
			totalPageNo = (int) (count / 10.0);
			if ((count % 10) != 0) {
				totalPageNo++;
			}
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return totalPageNo;
	}

	public List<RegVo> getStudents(int pageNo, String name, String department, String semester) {
		List<RegVo> list = new ArrayList<>();
		int offset = (pageNo - 1) * 10;
		System.out.println(offset);

		try {
			StringBuilder strquery = new StringBuilder();
			tx = session.beginTransaction();
			if (!name.equals("") || !semester.equals("") || !department.equals("")) {
				strquery.append("from RegVo where ");
				if (!semester.equals("")) {
					strquery.append("registration_semester=" + semester );
				}
				if(!department.equals("")){
					if(!semester.equals("")){
						strquery.append(" and ");
					}
				strquery.append(
						"registration_department='" + department +"'");
				}
				
				if(!name.equals("")){
					if(!semester.equals("") || !department.equals("")){
						strquery.append(" and ");
					}
					strquery.append("registration_name like '%" + name + "%'");
				}
			} else {
				strquery.append("from RegVo");
			}
			Query query = session.createQuery(strquery.toString());
			query.setFirstResult(offset);
			query.setMaxResults(10);
			list = (ArrayList<RegVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}

	public int getTotalPageNOForQuestions() {
		long count = 0;
		int totalPageNo = 0;

		try {
			tx = session.beginTransaction();
			count = (long) session.createQuery("select count(*) from QuestionVo").uniqueResult();
			tx.commit();
			totalPageNo = (int) (count / 10.0);
			if ((count % 10) != 0) {
				totalPageNo++;
			}

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return totalPageNo;
	}

	public List<QuestionVo> getQuestions(int pageNo) {
		List<QuestionVo> list = new ArrayList<>();
		int offset = (pageNo - 1) * 10;
		System.out.println(offset);

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from QuestionVo order by question_date desc");
			query.setFirstResult(offset);
			query.setMaxResults(10);
			list = (ArrayList<QuestionVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}

	public List<AnswerVo> getAnswers(String queId) {
		List<AnswerVo> list = new ArrayList<>();

		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from AnswerVo where queID=" + queId + " order by date desc");
			list = (ArrayList<AnswerVo>) query.list();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}

		return list;
	}
	
	public DocumentsVo getDocuments(String enrollment){
		
		DocumentsVo vo= null;
		try {
			tx = session.beginTransaction();
			Query query = session.createQuery("from DocumentsVo where document_enrollment=" + enrollment);
			vo = (DocumentsVo) query.uniqueResult();

			tx.commit();

		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		}
		return vo;
		
	}
}
