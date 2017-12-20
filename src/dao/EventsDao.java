package dao;
import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import db.Database;
import vo.EventsVo;

public class EventsDao extends CTDao{
	Database db = new Database();
	Session session= db.getSession();
	Transaction tx = null;
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		
		List<Object> events=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
			if(id==12589)
			{
				events = session.createQuery("FROM EventsVo").list(); 
			}
			else
			events = session.createQuery("FROM EventsVo where event_enrollment="+id).list(); 
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
		return  events;
		
	}
	public List<Object> view(int noOfRows,int noOfPage)
	{
		List<Object> notices=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				
				
			Query q = session.createQuery("FROM EventsVo order by Event_startDate desc"); 
			//q.setMaxResults(3);
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
		int ID=(int)id;
		
	      try{
	         tx = session.beginTransaction();
	         EventsVo vo = 
	                   (EventsVo)session.get(EventsVo.class,ID); 
	         if(!vo.getEvent_document().equals(""))
	         	{
	        	 File file=new File(vo.getEvent_document());
	        	 if(file.exists())
	        	 {
	        		 file.delete();
	        	 }
	         	}
	         session.delete(vo); 
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
		EventsVo vo=(EventsVo)o;
		
	      try{
	         tx = session.beginTransaction();
	         EventsVo event = 
	                    (EventsVo) session.get(EventsVo.class,vo.getEvent_id()); 
	        
	         
	        event.setEvent_id(vo.getEvent_id());
	        event.setEvent_enrollment(vo.getEvent_enrollment());
	        event.setEvent_title(vo.getEvent_title());
	        event.setEvent_startDate(vo.getEvent_startDate());
	        event.setEvent_endDate(vo.getEvent_endDate());
	        event.setEvent_time(vo.getEvent_time());
	        
	        event.setEvent_description(vo.getEvent_description());
	         String old_file = (String) session.createQuery("select event_document from EventsVo where event_id="+vo.getEvent_id()).uniqueResult();
		        if(!(vo.getEvent_document().equals(""))){
		        	//delete old file code
		        	File file = new File(old_file);
		        	if(file.exists()){
		        		file.delete();
		        	}
		        	//entry of new file in database
		        	event.setEvent_document(vo.getEvent_document());
		        }else{
		        	event.setEvent_document(old_file);
		        }
	         
			 session.update(event); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
}
