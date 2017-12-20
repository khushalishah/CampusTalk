package dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.AnswerVo;
import vo.QuestionVo;

public class AnswerDao extends CTDao{

	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		List<Object> ans = new ArrayList<>();
		try {
			tx = session.beginTransaction();
			ans = session.createQuery("from AnswerVo").list();
			

			tx.commit();
		} catch (Exception e) {
			if (tx != null) {
				tx.rollback();
			}
			System.out.println(e);
		} finally {
			db.closeSession(session);
		}
		return ans;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		int ID = (int) id;
		Database db = new Database();
		Session session = db.getSession();
		Transaction tx = null;
		try {
			tx = session.beginTransaction();
			AnswerVo answer = (AnswerVo) session.get(AnswerVo.class, ID);
			session.delete(answer);
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
		
	}
	
	

}
