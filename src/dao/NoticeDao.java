package dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.NoticeVo;

public class NoticeDao extends CTDao {

	Database db = new Database();
	Session session= db.getSession();
	Transaction tx = null;
	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		
		List<Object> notices=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				
				
			notices = session.createQuery("FROM NoticeVo where notice_fEnrollment="+id+"order by notice_startDate desc").list(); 
			
			/*for (Iterator iterator =  notices.iterator(); iterator.hasNext();){
				NoticeVo employee = (NoticeVo) iterator.next(); 
		        System.out.println("Title="+employee.getNotice_startDate());
		  }*/
					
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
		return  notices;
	}
	
	public List<Object> view(int noOfRows,int noOfPage)
	{
		List<Object> notices=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				
				
			Query q = session.createQuery("FROM NoticeVo order by notice_startDate desc"); 
			q.setMaxResults(3);
			notices=q.list();
					
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
		return  notices;
	}

	

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		//type-casting
		int ID=(int)id;
		System.out.println("delete method in dao");
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         NoticeVo notice = 
	                   (NoticeVo)session.get(NoticeVo.class,ID);
	         
	         if(!(notice.getNotice_document().equals(""))){
		        	//delete old file code
		        	File file = new File(notice.getNotice_document());
		        	if(file.exists()){
		        		file.delete();
		        	}
	         session.delete(notice);
	        
	         tx.commit();
	      }}
	         catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
	public void edit(Object o) {
		// TODO Auto-generated method stub
		NoticeVo nv=(NoticeVo)o;
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         NoticeVo notice = 
	                    (NoticeVo) session.get(NoticeVo.class,nv.getNotice_id()); 
	        
	        
	         notice.setNotice_description(nv.getNotice_description());
	         notice.setNotice_endDate(nv.getNotice_endDate());
	         notice.setNotice_startDate(nv.getNotice_startDate());
	         notice.setNotice_title(nv.getNotice_title());
	         String old_file = (String) session.createQuery("select notice_document from NoticeVo where notice_id="+nv.getNotice_id()).uniqueResult();
		        if(!(nv.getNotice_document().equals(""))){
		        	//delete old file code
		        	File file = new File(old_file);
		        	if(file.exists()){
		        		file.delete();
		        	}
		        	//entry of new file in database
		        	notice.setNotice_document(nv.getNotice_document());
		        }else{
		        	notice.setNotice_document(old_file);
		        }
			 session.update(notice); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	      
	}

	public List<Object> view(int dept, String sem) {
		// TODO Auto-generated method stub
		List<Object> notices=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				
				
			notices = session.createQuery("FROM NoticeVo where (notice_semester='"+sem+"' or notice_semester='all') and notice_fEnrollment="+dept).list(); 
			/*for (Iterator iterator =  notices.iterator(); iterator.hasNext();){
				NoticeVo employee = (NoticeVo) iterator.next(); 
		        System.out.println("Title="+employee.getNotice_startDate());
		  }*/
					
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
		return  notices;  
	}
	

}
