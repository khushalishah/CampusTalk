package dao;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.ComplainVo;
public class ComplainDao extends CTDao {

	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		List<Object> complain=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
			complain = session.createQuery("FROM ComplainVo ORDER BY complain_date DESC").list(); 
			tx.commit();	
		}
		catch(Exception e)
		{
			if(tx != null)
			{
				tx.rollback();
			}
			System.out.println(e);
		}finally
		{
			db.closeSession(session);
		}
		return  complain;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		int ID=(int)id;
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         ComplainVo complain = 
	                   (ComplainVo)session.get(ComplainVo.class,ID); 
	         session.delete(complain); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}

	@Override
	public void edit(Object o) {
		// TODO Auto-generated method stub
		ComplainVo cv=(ComplainVo)o;
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         ComplainVo complain = 
	                    (ComplainVo) session.get(ComplainVo.class,cv.getComplain_id()); 
	        
	         complain.setComplain_name(cv.getComplain_name());
	         complain.setComplain_enrollment(cv.getComplain_enrollment());
	         complain.setComplain_semester(cv.getComplain_semester());
	         complain.setComplain_description(cv.getComplain_description());
	         complain.setComplain_department(cv.getComplain_department());
	         complain.setComplain_title(cv.getComplain_title());
	         complain.setComplain_date(cv.getComplain_date());
	         
			 session.update(complain); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
		
	}
}
