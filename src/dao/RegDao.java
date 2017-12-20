package dao;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.Transaction;

import db.Database;
import vo.NoticeVo;
import vo.RegVo;

public class RegDao extends CTDao{

	@Override
	public List<Object> view(long id) {
		// TODO Auto-generated method stub
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		List<Object> registration=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
			registration = session.createQuery("FROM RegVo where registration_enrollment="+id).list(); 
			
					
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
		return  registration;
	}

	@Override
	public void delete(Object id) {
		// TODO Auto-generated method stub
		//type casting
		long ID=(long)id;
		long id1 = (long)ID;
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         RegVo registration = 
	                   (RegVo)session.get(RegVo.class,ID);
	         if(!registration.getRegistration_profilePic().equals(""))
	         {
	        	 File file=new File(registration.getRegistration_profilePic());
	        	 if(file.exists())
	        	 {
	        		 file.delete();
	        	 }
	         }
	         session.delete(registration); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	}
	
	public void edit(Object o) {
		// TODO Auto-generated method stub
		RegVo rv=(RegVo)o;
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
	      try{
	         tx = session.beginTransaction();
	         RegVo registration = 
	                    (RegVo) session.get(RegVo.class,rv.getRegistration_enrollment()); 
	        
	        registration.setRegistration_name(rv.getRegistration_name());
	        registration.setRegistration_alternatePhone(rv.getRegistration_alternatePhone());
	        registration.setRegistration_phone(rv.getRegistration_phone());
	        registration.setRegistration_gender(rv.getRegistration_gender());
	        registration.setRegistration_date(rv.getRegistration_date());
	        registration.setRegistration_email(rv.getRegistration_email());
	        registration.setRegistration_uname(rv.getRegistration_uname());
	        registration.setRegistration_password(rv.getRegistration_password());
	        registration.setRegistration_department(rv.getRegistration_department());
	        registration.setRegistration_semester(rv.getRegistration_semester());
	        registration.setRegistration_passingyear(rv.getRegistration_passingyear());
	        registration.setRegistration_tdetails(rv.getRegistration_tdetails());
	        registration.setRegistration_pdetails(rv.getRegistration_pdetails());
	        registration.setRegistration_odetails(rv.getRegistration_odetails());
	        
        	String old_pro_pic = (String) session.createQuery("select registration_profilePic from RegVo where registration_enrollment="+rv.getRegistration_enrollment()).uniqueResult();
	        if(!(rv.getRegistration_profilePic().equals(""))){
	        	//delete old file code
	        	File file = new File(old_pro_pic);
	        	if(file.exists()){
	        		file.delete();
	        	}
	        	//entry of new file in database
	        	registration.setRegistration_profilePic(rv.getRegistration_profilePic());
	        }else{
	        	registration.setRegistration_profilePic(old_pro_pic);
	        }
			 session.update(registration); 
	         tx.commit();
	      }catch (HibernateException e) {
	         if (tx!=null) tx.rollback();
	         e.printStackTrace(); 
	      }finally {
	         session.close(); 
	      }
	      
	}
	
	public List<Object> viewAll() {
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		List<Object> registration=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
				registration = session.createQuery("FROM RegVo ORDER BY name").list(); 
			
					
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
		return  registration;
	}
	
	public List<Object> search(String sem,String dept, String name) {
		Database db = new Database();
		Session session= db.getSession();
		Transaction tx = null;
		List<Object> registration=new ArrayList<>();
		try
		{
			tx = session.beginTransaction();
			if(sem.equals("All")&&dept.equals("All")&&name.equals(""))
				registration = session.createQuery("FROM RegVo order by name").list(); 
			else if(dept.equals("All")&&sem.equals("All"))
				registration = session.createQuery("FROM RegVo where name like '%"+name+"%' order by name ").list(); 
			else if(dept.equals("All")&&name.equals(""))
				registration = session.createQuery("FROM RegVo where semester="+sem).list();
			else if(sem.equals("All")&&name.equals(""))
				registration = session.createQuery("FROM RegVo where department='"+dept+"'").list();
			else if(dept.equals("All"))
				registration = session.createQuery("FROM RegVo where semester='"+sem+"' and name like '%"+name+"%' order by name").list();
			else if(sem.equals("All"))
				registration = session.createQuery("FROM RegVo where department='"+dept+"' and name like '%"+name+"%' order by name").list();
			else if(name.equals(""))
				registration = session.createQuery("FROM RegVo where department='"+dept+"' and semester='"+sem+"'").list();
			else
				registration = session.createQuery("FROM RegVo where semester="+sem+"and department='"+dept+"' and name like '%"+name+"%' order by name").list();		
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
		return  registration;
	}
}
