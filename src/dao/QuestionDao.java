package dao;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import vo.NoticeVo;
import vo.QuestionVo;
import db.Database;

public class QuestionDao extends CTDao {

	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		List<Object> que_ans = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			que_ans = session.createQuery("from QuestionVo order by question_date asc").list();
			

			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		} finally {
			db.closeSession(session);
		}
		return que_ans;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		// type-casting
		int ID = (int) id;
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			QuestionVo question = (QuestionVo) session.get(QuestionVo.class, ID);
			session.delete(question);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	@Override
	public void edit(Object o) {
		// TODO Auto-generated method stub
		QuestionVo qv = (QuestionVo) o;
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			QuestionVo question = (QuestionVo) session.get(QuestionVo.class, qv.getQuestion_id());

			Date date = new Date();
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			String qDate = sdf.format(date);
			question.setQuestion_date(qDate);
			question.setQuestion_department(qv.getQuestion_department());
			question.setQuestion_semester(qv.getQuestion_semester());
			question.setQuestion_name(qv.getQuestion_name());
			question.setQuestion_title(qv.getQuestion_title());

			session.update(question);
			tx.commit();
		} catch (HibernateException e) {
			if (tx != null)
				tx.rollback();
			e.printStackTrace();
		} finally {
			session.close();
		}

	}

	public List<Object[]> viewAll(String search){
		
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		List<Object[]> que_ans = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			que_ans = session
					.createQuery(
							"SELECT q.question_id,q.question_title,q.question_date,c.ansID,c.answer,c.date,c.department,c.semester,c.name FROM QuestionVo AS q LEFT JOIN q.children c WHERE q.question_title LIKE '%"+search+"%' order by q.question_date desc")
					.list();
			// questions = session.createQuery("FROM QuestionVo where
			// question_enrollment="+id).list();

			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		} finally {
			db.closeSession(session);
		}
		return que_ans;
		
	}
}
